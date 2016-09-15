//
//  Comment.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Comment: NSObject {
    var text: String
    var user: User
    
    init(json: JSON) {
        self.text = json["comment"]["text"].string!
        self.user = User(json: json["user"])
    }
    
    init(text: String, user: User) {
        self.text = text
        self.user = user
    }
    
    func requestCreateComment(meal: Meal, completion: () -> Void) {
        let params: [String: AnyObject] = [
            "user_id": self.user.id,
            "meal_id": meal.id,
            "text": self.text
        ]
        
        Alamofire.request(.POST, API.baseURL + "/api/comments", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    print(value)
                    completion()
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
    
    
}
