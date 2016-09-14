//
//  Group.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import Foundation

struct Group {
    var id: Int
    var name: String
    var imageURL: String
    
    init(id: Int, name: String, imageURL: String) {
        self.name = name
        self.imageURL = imageURL
        self.id = id
    }
}
