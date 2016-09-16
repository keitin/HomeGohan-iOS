//
//  StartViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var resisterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        resisterButton.layer.cornerRadius = 5
        resisterButton.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapStartButton(sender: UIButton) {
        let resisterUserNC = UIStoryboard.viewControllerWith("User", identifier: "ResisterUserNC")
        self.presentViewController(resisterUserNC, animated: true, completion: nil)
    }

    @IBAction func tapModelLoginButton(sender: UIButton) {
        let resisterUserNC = UIStoryboard.viewControllerWith("User", identifier: "LoginNC")
        self.presentViewController(resisterUserNC, animated: true, completion: nil)
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

