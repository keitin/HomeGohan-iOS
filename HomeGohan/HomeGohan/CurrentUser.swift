//
//  CurrentUser.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import Foundation

class CurrentUser: User {
    static let sharedInstance = CurrentUser()
    
    func fetchInLocal() {
        self.id = 1
        self.name = "シミズ"
        self.imageURL = "https://nekogazou.com/wp-content/uploads/2015/08/481ba514766f8a3423eaff8d82cc7a64.jpg"
    }
}