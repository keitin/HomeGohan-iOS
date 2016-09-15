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
        
        title = "アルバム一覧"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell("StartGroupCell")
        tableView.registerCell("GroupCell")
        
        let backButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(StartGroupViewController.modalNewGroupVC(_:)))

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
    
    func modalNewGroupVC(sender: UIBarButtonItem) {
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mealIndexVC = UIStoryboard.viewControllerWith("Meal", identifier: "MealIndexViewController") as! MealIndexViewController
        mealIndexVC.group = currentUser.groups[indexPath.row]
        self.navigationController?.pushViewController(mealIndexVC, animated: true)
    }
    

}
