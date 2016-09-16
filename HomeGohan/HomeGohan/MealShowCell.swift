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

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(meal: Meal) {
        self.mealImageView.sd_setImageWithURL(NSURL(string: meal.imageURL!))
        self.commentLabel.text = meal.text
//        // 行間の変更(正確には行自体の高さを変更している。)
//        let lineHeight:CGFloat = 10.0
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.minimumLineHeight = lineHeight
//        paragraphStyle.maximumLineHeight = lineHeight
//        let attributedText = NSMutableAttributedString(string: meal.text)
//        attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
//        commentLabel.attributedText = attributedText
    }
    
    private func layoutMealImageView() {
        self.mealImageView.makeAspectFill()
    }
    
    private func layoutCommentLabel() {
//        self.commentLabel.font = UIFont.mainJaFont(12)
    }
    
    
    
}
