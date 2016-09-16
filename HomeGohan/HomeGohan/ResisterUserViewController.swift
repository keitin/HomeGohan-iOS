//
//  ResisterUserViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class ResisterUserViewController: UIViewController, UIImagePickerControllerDelegate ,UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var cameraImageView: UIImageView!
    @IBOutlet weak var cametaTextImageView: UIImageView!
    @IBOutlet weak var footerHeightConst: NSLayoutConstraint!
    @IBOutlet weak var resisetButton: UIButton!
    
    var hooterHieght: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "アカウントを設定"
        self.addGestureToMealImageView()
        self.textView.delegate = self
        
        self.hooterHieght = resisetButton.frame.height
        //Keyboard Notification
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.keyboardWillShow(self, selector: #selector(MealShowViewController.showWillKeyboard(_:)))
        notificationCenter.keyboardWillHide(self, selector: #selector(MealShowViewController.hideWillKeyboard(_:)))
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ResisterUserViewController.tapView(_:)))
        self.view.addGestureRecognizer(gesture)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hed_close"), style: .Done, target: self, action: #selector(ResisterUserViewController.closeVC(_:)))
        
        
        //MARK Keyboard Accessary
        let keyboardCloseButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        keyboardCloseButton.backgroundColor = UIColor.mainColor()
        keyboardCloseButton.setTitle("O K", forState: .Normal)
        keyboardCloseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        keyboardCloseButton.addTarget(self, action: #selector(ResisterUserViewController.closeKeyboad(_:)), forControlEvents: .TouchUpInside)
        textView.inputAccessoryView = keyboardCloseButton
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func closeKeyboad(sender: UIButton) {
        textView.endEditing(true)
    }

    @IBAction func tapResisterButton(sender: UIButton) {
        
        if self.textView.text.isEmpty || self.userImageView.image == nil {
            return
        }
        let user = User(name: self.textView.text!, image: self.userImageView.image!)
        user.requestCreate { 
            let startGroupNC = UIStoryboard.viewControllerWith("Group", identifier: "StartGroupNC")
            UIApplication.sharedApplication().keyWindow?.rootViewController = startGroupNC
        }
    }
    
    func tapView(sender: UITapGestureRecognizer) {
        textView.endEditing(true)
    }
    
    // MARK Keyboard Notification
    func showWillKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let keyboardRect = keyboard.CGRectValue()
                self.placeholderImageView.hidden = true
                self.cameraImageView.hidden = true
                self.cametaTextImageView.hidden = true
                self.userImageView.hidden = true
                self.footerHeightConst.constant = keyboardRect.height
            }
        }
    }
    
    func hideWillKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(2.5, animations: {
            if self.userImageView.image == nil {
                self.cameraImageView.hidden = false
                self.cametaTextImageView.hidden = false
            }
            
            if self.textView.text.isEmpty {
                self.placeholderImageView.hidden = false
            }
            
            self.userImageView.hidden = false
            self.footerHeightConst.constant = self.hooterHieght
        })
    }
    
    
    //MARK: Text View Delegate
    func textViewDidBeginEditing(textView: UITextView) {
        self.placeholderImageView.hidden = true
    }
    
    func tapUserImageView(sender: UIGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let album = UIImagePickerController()
            album.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            album.delegate = self
            self.presentViewController(album, animated: true, completion: nil)
        }
    }
    
    //MARK: Image Picker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.cameraImageView.hidden = true
            self.cametaTextImageView.hidden = true
            self.userImageView.image = selectImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func addGestureToMealImageView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ResisterUserViewController.tapUserImageView(_:)))
        self.userImageView.addGestureRecognizer(gesture)
        self.userImageView.userInteractionEnabled = true
    }

}
