//
//  Meal.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

struct Meal {
    var imageURL: String?
    var text: String
    var user: User!
    var image: UIImage?

    init(json: JSON) {
        self.imageURL = API.baseURL + json["meal"]["image_url"]["url"].string!
        self.text = json["meal"]["text"].string!
        self.user = User(json: json["user"])
    }
    
    init(imageURL: String, text: String, user: User) {
        self.imageURL = imageURL
        self.text = text
        self.user = user
    }
    
    init(image: UIImage, text: String, user: User) {
        self.image = image
        self.text = text
        self.user = user
    }
    
    func requestCreate(group: Group, completion: () -> Void) {
        let params: [String: AnyObject] = [
            "user_id": CurrentUser.sharedInstance.id,
            "text": self.text,
            "group_id": group.id
        ]
        let pass = API.baseURL +  "/api/meals"
        let httpMethod = Alamofire.Method.POST.rawValue
        
        let urlRequest = NSData.urlRequestWithComponents(httpMethod, urlString: pass, parameters: params, image: self.image!)
        Alamofire.upload(urlRequest.0, data: urlRequest.1)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    print(value)
                case .Failure(let error):
                    print(error)
                }
        }
    }
}