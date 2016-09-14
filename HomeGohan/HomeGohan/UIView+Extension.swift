//
//  UIView+Extension.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//


import UIKit
extension UIView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
}