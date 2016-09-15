//
//  MealIndexViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealIndexViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MealIndexViewModel()
    let mealManager = MealManager.sharedInstance
    let group = Group(id: 1, name: "清水淳子", imageURL: "https://nekogazou.com/wp-content/uploads/2015/08/481ba514766f8a3423eaff8d82cc7a64.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setTableView()
        self.viewModel.registerCell(tableView)
        
        mealManager.requestGetMeals(group) { 
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.addSubViewBarItems()
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
        let meal = mealManager.meals[indexPath.row]
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
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = viewModel
    }
    
    private func addSubViewBarItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "New", style: .Done, target: self, action: #selector(MealIndexViewController.modalNewMealVC(_:)))
    }
    
}
