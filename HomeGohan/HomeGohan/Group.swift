//
//  Group.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Group {
    var id: Int
    var name: String
    var imageURL: String
    
    init(id: Int, name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
        self.id = id
    }
    
    init(json: JSON) {
        self.id = json["id"].int!
        self.name = json["name"].string!
        self.imageURL = API.baseURL + json["image_url"].string!
    }
    
    static func requestCreateGroup(userIds: [Int], completion: () -> Void) {
        let currentUser = CurrentUser.sharedInstance
        let params: [String: AnyObject] = [
            "user_ids": userIds,
            "user_id": currentUser.id
        ]
        Alamofire.request(.POST, API.baseURL + "/api/groups", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    let group = Group(json: json["group"])
                    let currentUser = CurrentUser.sharedInstance
                    currentUser.groups.append(group)
                    completion()
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
    
}
