//
//  NewGroupViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class NewGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let searchUsers = SearchUsers.sharedInstance
    var checkUserIds: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "大切な人を探そう"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell("SearchUserCell")
        tableView.registerCell("NoUserCell")
        
        textField.delegate = self
        
        searchUsers.users = []
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "hed_close"), style: .Done, target: self, action: #selector(NewGroupViewController.closeVC(_:)))
        
        //MARK Keyboard Accessary
        let keyboardCloseButton = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        keyboardCloseButton.backgroundColor = UIColor.mainColor()
        keyboardCloseButton.setTitle("O K", forState: .Normal)
        keyboardCloseButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        keyboardCloseButton.addTarget(self, action: #selector(NewGroupViewController.closeKeyboad(_:)), forControlEvents: .TouchUpInside)
        textField.inputAccessoryView = keyboardCloseButton
        
        textField.layer.borderWidth = 2
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.mainColor().CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func closeKeyboad(sender: UIButton) {
        textField.endEditing(true)
    }
    
    @IBAction func tapSearchButton(sender: UIButton) {
        tableView.userInteractionEnabled = false
        searchUsers.requestGetAllUsers(textField.text!) {
            self.tableView.reloadData()
            self.tableView.userInteractionEnabled = true
            self.textField.endEditing(true)
        }
    }
    
    @IBAction func tapCreateGroupButton(sender: UIButton) {
        sender.enabled = false
        Group.requestCreateGroup(checkUserIds) {
            sender.enabled = true
            self.dismissViewControllerAnimated(true, completion: nil)
            
        }
    }
    
    func closeVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    //MARK: Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchUsers.users.isEmpty {
            return 1
        } else {
            return searchUsers.users.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if searchUsers.users.isEmpty {
            let cell = tableView.dequeueReusableCellWithIdentifier("NoUserCell", forIndexPath: indexPath) as! NoUserCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchUserCell", forIndexPath: indexPath) as! SearchUserCell
            let user = searchUsers.users[indexPath.row]
            if checkUserIds.contains(user.id) {
                cell.checkBoxImageView.highlighted = true
            }
            cell.fillWith(user)
            return cell
        }
    }
    
    //MARK: Table View Datasouce
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if searchUsers.users.isEmpty {
            return 178
        } else {
            return 91
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if searchUsers.users.isEmpty {
            return
        }
        
        let selectUser = searchUsers.users[indexPath.row]
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! SearchUserCell
        if checkUserIds.contains(selectUser.id) {
            let index = checkUserIds.indexOf(selectUser.id)
            checkUserIds.removeAtIndex(index!)
            
            cell.checkBoxImageView.highlighted = false
            
            return
        }
        checkUserIds.append(selectUser.id)
        cell.checkBoxImageView.highlighted = true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
