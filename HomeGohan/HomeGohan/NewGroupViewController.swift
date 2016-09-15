//
//  NewGroupViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class NewGroupViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        
        searchUsers.requestGetAllUsers("") { 
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSearchButton(sender: UIButton) {
        searchUsers.requestGetAllUsers(textField.text!) {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func tapCreateGroupButton(sender: UIButton) {
        print(checkUserIds)
        Group.requestCreateGroup(checkUserIds) { 
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    //MARK: Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchUsers.users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchUserCell", forIndexPath: indexPath) as! SearchUserCell
        cell.fillWith(searchUsers.users[indexPath.row])
        return cell
    }
    
    //MARK: Table View Datasouce
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 91
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectUser = searchUsers.users[indexPath.row]
        if checkUserIds.contains(selectUser.id) {
            let index = checkUserIds.indexOf(selectUser.id)
            checkUserIds.removeAtIndex(index!)
            return
        }
        checkUserIds.append(selectUser.id)
    }
}
