//
//  UIStoryboard+Extension.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func viewControllerWith(boardName: String, identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: boardName, bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(identifier)
    }
}
