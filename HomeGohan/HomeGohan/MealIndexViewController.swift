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
        
        title = group.name + "とのアルバム"
        
        let backButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        
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
        return 175
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let meal = group.meals[indexPath.row]
        let mealShowVC = UIStoryboard.viewControllerWith("Meal", identifier: "MealShowViewController") as! MealShowViewController
        mealShowVC.meal = meal
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
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.meals.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCell", forIndexPath: indexPath) as! MealCell
        cell.fillWith(group.meals[indexPath.row])
        return cell
    }
    
    private func registerCell() {
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
