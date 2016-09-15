//
//  UserNavigationController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/16.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class UserNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("===========")
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "HirakakuProN-W3", size: 20)!]
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
     
        
//        明日やること
//            - フォント適用
//            - 細かいデザイン
//            - 実機で確認
//            - コメントページにて、リクエスト飛ばしまくる
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
