//
//  UITableView+Extension.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
extension UITableView {
    func registerCell(name: String) {
        self.registerNib(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
}
