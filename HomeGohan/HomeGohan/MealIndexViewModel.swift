//
//  MealIndexViewModel.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealIndexViewModel: NSObject, UITableViewDataSource {
    
    var group = Group(id: 1, name: "清水淳子", imageURL: "https://nekogazou.com/wp-content/uploads/2015/08/481ba514766f8a3423eaff8d82cc7a64.jpg")
    var mealManager = MealManager.sharedInstance
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return mealManager.meals.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupProfCell", forIndexPath: indexPath) as! GroupProfCell
            cell.fillWith(group)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! MealCell
            cell.fillWith(mealManager.meals[indexPath.row])
            return cell
        }
        
    }
    
    func registerCell(tableView: UITableView) {
        tableView.registerCell("GroupProfCell")
        tableView.registerCell("MealCell")
    }
}
