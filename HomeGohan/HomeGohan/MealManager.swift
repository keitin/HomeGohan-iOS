//
//  MealManager.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MealManager: NSObject {
    static let sharedInstance = MealManager()
    var meals: [Meal] = []
    
    func requestGetMeals(group: Group, completion: () -> Void) {
        let params = [
            "group_id": group.id
        ]
        Alamofire.request(.GET, API.baseURL + "/api/meals", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .Success(let value):
                    let json = JSON(value)
                    for mealJSON in json["meals"].array! {
                        let meal = Meal(json: mealJSON)
                        self.meals.append(meal)
                        completion()
                    }
                case .Failure(let error):
                    completion()
                    print(error)
                }
        }
    }
}
