//
//  CommentCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class CommentCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layoutUserImageView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith() {
        self.nameLabel.text = "シミズ"
        self.commentLabel.text = "すごいねええええ！！頑張ったね！"
        self.userImageView.sd_setImageWithURL(NSURL(string: "http://kuroshiba.net/monaka/wp-content/uploads/2015/08/31981ce00b89e3c6e6b19954a8c13b86_s.jpg"))
        //        self.nameLabel.text = comment.user.name
        //        self.commentLabel.text = comment.text
        //        self.userImageView.sd_setImageWithURL(NSURL(string: comment.user.imageURL))
    }
    
    func fillWith(comment: Comment) {
        self.nameLabel.text = "シミズ"
        self.commentLabel.text = "すごいねええええ！！頑張ったね！"
        self.userImageView.sd_setImageWithURL(NSURL(string: "http://kuroshiba.net/monaka/wp-content/uploads/2015/08/31981ce00b89e3c6e6b19954a8c13b86_s.jpg"))
//        self.nameLabel.text = comment.user.name
//        self.commentLabel.text = comment.text
//        self.userImageView.sd_setImageWithURL(NSURL(string: comment.user.imageURL))
    }
    
    private func layoutUserImageView() {
        self.userImageView.makeAspectFill()
        self.userImageView.makeCircle()
    }
    
}
