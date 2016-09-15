//
//  MealCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

class MealCell: UITableViewCell {
    
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutNameLabel()
        self.layoutMealImageView()
        self.commentTextView.userInteractionEnabled = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(meal: Meal) {
        self.mealImageView.sd_setImageWithURL(NSURL(string: meal.imageURL!))
        self.nameLabel.text = meal.user.name
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attributes = [NSParagraphStyleAttributeName : style]
        commentTextView.attributedText = NSAttributedString(string: meal.text, attributes: attributes)
    }
    
    private func layoutMealImageView() {
        self.mealImageView.makeAspectFill()
    }

    
    private func layoutNameLabel() {
    }
    

}
