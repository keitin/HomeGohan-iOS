//
//  MealCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var mealImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutNameLabel()
        self.layoutMealImageView()
        self.layoutUserImageView()
        self.layoutCommentLabel()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(meal: Meal) {
        self.mealImageView.sd_setImageWithURL(NSURL(string: meal.imageURL))
        self.commentLabel.text = meal.text
        self.nameLabel.text = meal.user.name
        self.userImageView.sd_setImageWithURL(NSURL(string: meal.user.imageURL))
    }
    
    private func layoutMealImageView() {
        self.mealImageView.makeAspectFill()
    }
    
    private func layoutUserImageView() {
        self.userImageView.makeAspectFill()
        self.userImageView.makeCircle()
    }
    
    private func layoutNameLabel() {
        self.nameLabel.font = UIFont.mainJaFont(15)
        self.nameLabel.textColor = UIColor.darkTextColor()
    }
    
    private func layoutCommentLabel() {
        self.commentLabel.font = UIFont.mainJaFont(15)
        self.commentLabel.textColor = UIColor.darkTextColor()
    }
}
