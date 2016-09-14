//
//  Meal.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

struct Meal {
    var imageURL: String?
    var text: String
    var user: User
    var image: UIImage?

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
    
    func requestCreate(completion: () -> Void) {
        
    }
}