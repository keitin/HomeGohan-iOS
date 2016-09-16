//
//  MealCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    
    
    @IBOutlet weak var commentLabel: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutMealImageView()
        self.commentLabel.userInteractionEnabled = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(meal: Meal) {
        self.mealImageView.sd_setImageWithURL(NSURL(string: meal.imageURL!))
        self.nameLabel.text = meal.user.name
        self.commentLabel.text = meal.text
        self.commentLabel.sizeToFit()
    }
    
    private func layoutMealImageView() {
        self.mealImageView.makeAspectFill()
    }

    
    private func layoutNameLabel() {
        var rect = self.commentLabel.frame
        self.commentLabel.sizeToFit()
        rect.size.height = CGRectGetHeight(self.commentLabel.frame)
        commentLabel.frame = rect
        
    }


}
