//
//  SearchUsers.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchUsers: NSObject {
    static let sharedInstance = SearchUsers()
    var users: [User] = []
    
    func requestGetAllUsers(keyword: String, completion: () -> Void) {
        let params = [
            "keyword": keyword
        ]
        Alamofire.request(.GET, API.baseURL + "/api/users", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    self.users = []
                    let json = JSON(value)
                    for userJSON in json["users"].array! {
                        let user = User(json: userJSON["user"])
                        self.users.append(user)
                        completion()
                    }
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
}
