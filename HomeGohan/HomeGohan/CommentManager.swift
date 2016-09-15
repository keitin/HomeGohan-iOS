//
//  CommentManager.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CommentManager: NSObject {
    static let sharedInstance = CommentManager()
    var comments: [Comment] = []
    
    func requestGetComments(meal: Meal, completion: () -> Void) {
        let params = [
            "meal_id": meal.id
        ]
        Alamofire.request(.POST, API.baseURL + "/api/comments", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    self.comments = []
                    let json = JSON(value)
                    for commentJSON in json["comments"].array! {
                        let comment = Comment(json: commentJSON)
                        self.comments.append(comment)
                        completion()
                    }
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
}
