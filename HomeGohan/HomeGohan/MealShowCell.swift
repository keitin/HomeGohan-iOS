//
//  MealShowCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class MealShowCell: UITableViewCell {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(meal: Meal) {
        self.mealImageView.sd_setImageWithURL(NSURL(string: meal.imageURL!))
        self.commentLabel.text = meal.text
        self.userImageView.sd_setImageWithURL(NSURL(string: meal.user.imageURL))
        self.nameLabel.text = meal.user.name
    }
    
    private func layoutUserImageView() {
        self.userImageView.makeAspectFill()
        self.userImageView.makeCircle()
    }
    
    private func layoutMealImageView() {
        self.mealImageView.makeAspectFill()
    }
    
    private func layoutCommentLabel() {
        self.commentLabel.font = UIFont.mainJaFont(12)
    }
    
    
    
}
