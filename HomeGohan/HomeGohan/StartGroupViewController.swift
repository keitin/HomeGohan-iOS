//
//  StartGroupViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class StartGroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    let currentUser = CurrentUser.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell("StartGroupCell")
        tableView.registerCell("GroupCell")
        
        if currentUser.groups.isEmpty {
            self.navigationController?.navigationBar.hidden = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        currentUser.requestGetGroups { 
            self.tableView.reloadData()
            self.navigationController?.navigationBar.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func modalNewGroupVC(sender: UIButton) {
        let newGroupNC = UIStoryboard.viewControllerWith("Group", identifier: "NewGroupNC")
        presentViewController(newGroupNC, animated: true, completion: nil)
    }
    
    //MARK: Table View Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentUser.groups.isEmpty {
            return 1
        } else {
            return currentUser.groups.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if currentUser.groups.isEmpty {
            let cell = tableView.dequeueReusableCellWithIdentifier("StartGroupCell", forIndexPath: indexPath) as! StartGroupCell
            cell.addGroupButton.addTarget(self, action: #selector(StartGroupViewController.modalNewGroupVC(_:)), forControlEvents: .TouchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as! GroupCell
            cell.fillWith(currentUser.groups[indexPath.row])
            return cell
        }
    }
    
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if currentUser.groups.isEmpty {
            return self.view.frame.height
        } else {
            return 80
        }
    }
    

}
