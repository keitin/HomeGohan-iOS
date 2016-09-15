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
    var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSearchButton(sender: UIButton) {
    }

    //MARK: Table View Delegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath)
        return cell
    }
    
    //MARK: Table View Datasouce

}
