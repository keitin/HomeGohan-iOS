//
//  NewMealViewController.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class NewMealViewController: UIViewController, UIImagePickerControllerDelegate ,UINavigationControllerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    var group: Group!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addSubViewBarItems()
        self.addGestureToMealImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func tapSendButton(sender: UIButton) {
        let user = CurrentUser.sharedInstance
        let meal = Meal(image: self.mealImageView.image!, text: self.textView.text, user: user)
        meal.requestCreate(self.group!) {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func closeVC(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tapMealImageView(sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            let album = UIImagePickerController()
            album.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            //TODO:
//            album.sourceType = UIImagePickerControllerSourceType.Camera
//            album.allowsEditing = true
            album.delegate = self
            self.presentViewController(album, animated: true, completion: nil)
        }
    }
    
    //MARK: Image Picker Delegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let selectImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.mealImageView.image = selectImage
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func addSubViewBarItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "×", style: .Done, target: self, action: #selector(NewMealViewController.closeVC(_:)))
    }
    
    private func addGestureToMealImageView() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(NewMealViewController.tapMealImageView(_:)))
        self.mealImageView.addGestureRecognizer(gesture)
        self.mealImageView.userInteractionEnabled = true
    }
    
}
