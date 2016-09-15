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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "アカウントを設定"
        self.addGestureToMealImageView()
        self.textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapResisterButton(sender: UIButton) {
        let user = User(name: self.textView.text!, image: self.userImageView.image!)
        user.requestCreate { 
            let startGroupNC = UIStoryboard.viewControllerWith("Group", identifier: "StartGroupNC")
            UIApplication.sharedApplication().keyWindow?.rootViewController = startGroupNC
        }
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
