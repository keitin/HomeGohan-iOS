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
    var image: UIImage!
    
    var groups: [Group] = []
    
    init(json: JSON) {      
        self.id = json["id"].int!
        self.name = json["name"].string!
        self.imageURL = API.baseURL + json["image_url"]["url"].string!
    }
    
    init(id: Int, name: String, imageURL: String) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
    }
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
    init() {}
    
    func requestCreate(completion: () -> Void) {
        let params: [String: AnyObject] = [
            "name": self.name,
        ]
        let pass = API.baseURL +  "/api/users"
        let httpMethod = Alamofire.Method.POST.rawValue
        
        let urlRequest = NSData.urlRequestWithComponents(httpMethod, urlString: pass, parameters: params, image: self.image!)
        Alamofire.upload(urlRequest.0, data: urlRequest.1)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    let user = User(json: json["currentUser"])
                    let currentUser = CurrentUser.sharedInstance
                    currentUser.fetchCurrentUser(user)
                    completion()
                case .Failure(let error):
                    print(error)
                    completion()
                }
            }
    }
    
    func requestGetGroups(completion: () -> Void) {
        let params = [
            "user_id": self.id
        ]
        Alamofire.request(.GET, API.baseURL + "/api/groups", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    self.groups = []
                    let json = JSON(value)
                    for groupJSON in json["groups"].array! {
                        let group = Group(json: groupJSON["group"])
                        self.groups.append(group)
                        completion()
                    }
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
    
    
    
    
    
    
    
}