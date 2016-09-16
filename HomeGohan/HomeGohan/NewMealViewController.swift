//
//  NewMealViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class NewMealViewController: UIViewController, UIImagePickerControllerDelegate ,UINavigationControllerDelegate, UITextViewDelegate {
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var cameraTextImageView: UIImageView!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var footerHeightConst: NSLayoutConstraint!
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var group: Group!
    
    var footerHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "料理を送ろう"
        
        self.cameraImageView.hidden = false
        
        self.addSubViewBarItems()
        self.addGestureToMealImageView()
        
        self.footerHeight = sendButton.frame.height
        //Keyboard Notification
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.keyboardWillShow(self, selector: #selector(MealShowViewController.showWillKeyboard(_:)))
        notificationCenter.keyboardWillHide(self, selector: #selector(MealShowViewController.hideWillKeyboard(_:)))
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(NewMealViewController.tapView(_:)))
        self.view.addGestureRecognizer(gesture)
        
        //MARK Keyboard Accessary
        let keyboardCloseButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        keyboardCloseButton.backgroundColor = UIColor.mainColor()
        keyboardCloseButton.setTitle("O K", forState: .Normal)
        keyboardCloseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        keyboardCloseButton.addTarget(self, action: #selector(NewMealViewController.closeKeyboad(_:)), forControlEvents: .TouchUpInside)
        textView.inputAccessoryView = keyboardCloseButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboad(sender: UIButton) {
        textView.endEditing(true)
    }
    
    // MARK Keyboard Notification
    func showWillKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let keyboardRect = keyboard.CGRectValue()
                self.placeholderImageView.hidden = true
                self.cameraImageView.hidden = true
                self.cameraTextImageView.hidden = true
                self.mealImageView.hidden = true
                self.footerHeightConst.constant = keyboardRect.height
            }
        }
    }
    
    func hideWillKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(2.5, animations: {
            if self.mealImageView.image == nil {
                self.cameraImageView.hidden = false
                self.cameraTextImageView.hidden = false
            }
            
            if self.textView.text.isEmpty {
                self.placeholderImageView.hidden = false
            }
            
            self.mealImageView.hidden = false
            self.footerHeightConst.constant = self.footerHeight
        })
    }
    
    @IBAction func tapSendButton(sender: UIButton) {
        if let image = self.mealImageView.image {
            let user = CurrentUser.sharedInstance
            let meal = Meal(image: image, text: self.textView.text, user: user)
            meal.requestCreate(self.group!) {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    func tapView(sender: UITapGestureRecognizer) {
        textView.endEditing(true)
    }
    
    func closeVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapMealImageView(sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let album = UIImagePickerController()
            album.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //TODO:
//            album.sourceType = UIImagePickerControllerSourceType.Camera
//            album.allowsEditing = true
            album.delegate = self
            self.presentViewController(album, animated: true, completion: nil)
        }
    }
    
    //MARK: Image Picker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.mealImageView.image = selectImage
            self.cameraImageView.hidden = true
            self.cameraTextImageView.hidden = true
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func addSubViewBarItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hed_close"), style: .Done, target: self, action: #selector(NewMealViewController.closeVC(_:)))
    }
    
    private func addGestureToMealImageView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(NewMealViewController.tapMealImageView(_:)))
        self.mealImageView.addGestureRecognizer(gesture)
        self.mealImageView.userInteractionEnabled = true
    }
    
}
