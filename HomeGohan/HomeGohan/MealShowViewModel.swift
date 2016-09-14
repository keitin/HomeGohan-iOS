//
//  MealShowViewModel.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealShowViewModel: NSObject, UITableViewDataSource {

    var meal: Meal!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealShowCell", forIndexPath: indexPath) as! MealShowCell
        cell.fillWith(meal)
        return cell
    }
    
    func registerCell(tableView: UITableView) {
        tableView.registerCell("MealShowCell")
    }
}
