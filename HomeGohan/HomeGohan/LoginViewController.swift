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

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hed_close"), style: .Done, target: self, action: #selector(LoginViewController.closeVC(_:)))
        self.textField.delegate = self
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
}
