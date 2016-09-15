//
//  MealIndexViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealIndexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var group: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTableView()
        self.registerCell()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addSubViewBarItems()
        group.requestGetMeals() {
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 111
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            return
        }
        let meal = group.meals[indexPath.row]
        let mealShowVC = UIStoryboard.viewControllerWith("Meal", identifier: "MealShowViewController") as! MealShowViewController
        mealShowVC.viewModel.meal = meal
        navigationController?.pushViewController(mealShowVC, animated: true)
    }
    
    func modalNewMealVC(sender: UIBarButtonItem) {
        let newMealNC = UIStoryboard.viewControllerWith("Meal", identifier: "NewMealNC") as! UINavigationController
        let newMealVC = newMealNC.viewControllers.first as! NewMealViewController
        newMealVC.group = self.group
        self.presentViewController(newMealNC, animated: true, completion: nil)
    }
    
    
    //MARK: Table View Data Souce
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return group.meals.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupProfCell", forIndexPath: indexPath) as! GroupProfCell
            cell.fillWith(group)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! MealCell
            cell.fillWith(group.meals[indexPath.row])
            return cell
        }
        
    }
    
    private func registerCell() {
        self.tableView.registerCell("GroupProfCell")
        self.tableView.registerCell("MealCell")
    }
    
    
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func addSubViewBarItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .Done, target: self, action: #selector(MealIndexViewController.modalNewMealVC(_:)))
    }
    
    
    
}
