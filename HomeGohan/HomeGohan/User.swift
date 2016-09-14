//
//  User.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class User {
    var name: String!
    var imageURL: String!
    var id: Int!
    
    init(json: JSON) {      
        self.id = json["id"].int!
        self.name = json["name"].string!
        self.imageURL = json["image_url"].string!
    }
    
    init(id: Int, name: String, imageURL: String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
    
    init() {}
}