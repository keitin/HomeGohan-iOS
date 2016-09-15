//
//  MealShowViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var footerHeightConst: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var footView: UIView!
    var hooterViewHeight: CGFloat!
    var meal: Meal!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "2016.09.16"
        
        self.registerCell()
        self.setTableView()

        self.meal.requestGetComments({
            self.tableView.reloadData()
        })
        
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
        self.createComment(self.textField.text!) {
            self.textField.text = ""
            self.textField.endEditing(true)
            self.meal.requestGetComments({ 
                self.tableView.reloadData()
                self.tableView.scrollToNearestSelectedRowAtScrollPosition(.Bottom, animated: true)
            })
        }

    }
    
    //MAKR: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 454
        } else {
            return 102
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return meal.comments.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("MealShowCell", forIndexPath: indexPath) as! MealShowCell
            cell.fillWith(meal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
            cell.fillWith(meal.comments[indexPath.row])
            return cell
        }
    }
    
    //MARK: API Request
    func createComment(text: String, completion: () -> Void) {
        let currentUser = CurrentUser.sharedInstance
        let comment = Comment(text: text, user: currentUser)
        comment.requestCreateComment(self.meal) {
            completion()
        }
    }
    
    func registerCell() {
        tableView.registerCell("MealShowCell")
        tableView.registerCell("CommentCell")
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
        self.tableView.dataSource = self
    }

}
