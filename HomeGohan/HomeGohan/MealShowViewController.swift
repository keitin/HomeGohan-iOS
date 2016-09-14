//
//  MealShowViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealShowViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MealShowViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.viewModel.registerCell(tableView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MAKR: Table View Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 479
    }
    
    private func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = viewModel
    }
    

}
