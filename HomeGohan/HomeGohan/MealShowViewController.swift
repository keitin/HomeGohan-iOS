//
//  MealShowViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealShowViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var footerHeightConst: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var footView: UIView!
    var hooterViewHeight: CGFloat!
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MealShowViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.viewModel.registerCell(tableView)
        
        self.hooterViewHeight = self.footView.frame.height
        
        //Keyboard Notification
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.keyboardWillShow(self, selector: #selector(MealShowViewController.showWillKeyboard(_:)))
        notificationCenter.keyboardWillHide(self, selector: #selector(MealShowViewController.hideWillKeyboard(_:)))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapSendButton(sender: UIButton) {
        
        if self.textField.text!.isEmpty {
            return
        }
        
        viewModel.createComment(self.textField.text!) {
            self.textField.text = ""
            self.textField.endEditing(true)
        }
        
        
    }
    
    //MAKR: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 479
        } else {
            return 132
        }
        
    }
    
    // MARK Keyboard Notification
    func showWillKeyboard(notification: NSNotification) {
        if let userInfo = notification.userInfo{
            if let keyboard = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                let keyboardRect = keyboard.CGRectValue()
                self.footerHeightConst.constant += keyboardRect.height
//                self.scrollView.frame.size.height = self.scrollView.frame.height - keyboardRect.height
            }
        }
    }
    
    func hideWillKeyboard(notification: NSNotification) {
        UIView.animateWithDuration(2.5, animations: {
            self.footerHeightConst.constant = self.hooterViewHeight
        })
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = viewModel
    }
    

}
