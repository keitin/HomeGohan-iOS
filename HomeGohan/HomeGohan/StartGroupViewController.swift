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
    var isStart = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell("StartGroupCell")
        
        if isStart {
            self.navigationController?.navigationBar.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func modalNewGroupVC(sender: UIButton) {
        
    }
    
    //MARK: Table View Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isStart {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if isStart {
            let cell = tableView.dequeueReusableCellWithIdentifier("StartGroupCell", forIndexPath: indexPath) as! StartGroupCell
            cell.addGroupButton.addTarget(self, action: #selector(StartGroupViewController.modalNewGroupVC(_:)), forControlEvents: .TouchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("StartGroupCell", forIndexPath: indexPath) as! StartGroupCell
            return cell
        }
    }
    
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if isStart {
            return self.view.frame.height
        } else {
            return self.view.frame.height
        }
    }
    

}
