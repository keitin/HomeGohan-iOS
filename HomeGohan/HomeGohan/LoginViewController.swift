//
//  LoginViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/16.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var okaeriImageView: UIImageView!
    @IBOutlet weak var placeholderImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var footerHeightConst: NSLayoutConstraint!

    var footerHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        title = "ログイン"
        self.footerHeight = loginButton.frame.height
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.keyboardWillShow(self, selector: #selector(MealShowViewController.showWillKeyboard(_:)))
        notificationCenter.keyboardWillHide(self, selector: #selector(MealShowViewController.hideWillKeyboard(_:)))
        
        
        //MARK Keyboard Accessary
        let keyboardCloseButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        keyboardCloseButton.backgroundColor = UIColor.mainColor()
        keyboardCloseButton.setTitle("O K", forState: .Normal)
        keyboardCloseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        keyboardCloseButton.addTarget(self, action: #selector(LoginViewController.closeKeyboad(_:)), forControlEvents: .TouchUpInside)
        textField.inputAccessoryView = keyboardCloseButton
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hed_close"), style: .Done, target: self, action: #selector(LoginViewController.closeVC(_:)))
        self.textField.delegate = self
    }
    
    func closeKeyboad(sender: UIButton) {
        textField.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapLoginButton(sender: UIButton) {
        if textField.text!.isEmpty {
            return
        }
        
        User.requestLogin(textField.text!) { (message) in
            if let msg = message {
                let alert = UIAlertController(title: "エラー", message: msg, preferredStyle: .Alert)
                let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            } else {
                let startGroupNC = UIStoryboard.viewControllerWith("Group", identifier: "StartGroupNC")
                UIApplication.sharedApplication().keyWindow?.rootViewController = startGroupNC
            }
        }
    }

    
    func closeVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.placeholderImageView.hidden = true
    }
    
    // MARK Keyboard Notification
    func showWillKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let keyboardRect = keyboard.CGRectValue()
                self.placeholderImageView.hidden = true
                self.okaeriImageView.hidden = true
                self.footerHeightConst.constant = keyboardRect.height
            }
        }
    }
    
    func hideWillKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(2.5, animations: {
            self.okaeriImageView.hidden = false
            
            if self.textField.text!.isEmpty {
                self.placeholderImageView.hidden = false
            }
            
            self.footerHeightConst.constant = self.footerHeight
        })
    }
    
}
