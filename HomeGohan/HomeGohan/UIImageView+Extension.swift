//
//  UIImageView+Extension.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

extension UIImageView {
    func makeAspectFill() {
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.layer.masksToBounds = true
    }
}
