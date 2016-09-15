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
    let commentManager = CommentManager.sharedInstance
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("MealShowCell", forIndexPath: indexPath) as! MealShowCell
            cell.fillWith(meal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as! CommentCell
            cell.fillWith()
            return cell
        }
    }
    
    
    //MARK: API Request
    func createComment(text: String, completion: () -> Void) {
        let currentUser = CurrentUser.sharedInstance
        let comment = Comment(text: text, user: currentUser)
        comment.requestCreateComment(self.meal) { 
            completion()
        }
    }
    
    func getCommentInBackGround() {
        
    }
    
    func registerCell(tableView: UITableView) {
        tableView.registerCell("MealShowCell")
        tableView.registerCell("CommentCell")
    }
}
