//
//  SearchUserCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class SearchUserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var checkboxImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutUserImageView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(user: User) {
        self.nameLabel.text = user.name
        self.userImageView.sd_setImageWithURL(NSURL(string: user.imageURL))
    }
    
    private func layoutUserImageView() {
        self.userImageView.makeAspectFill()
        self.userImageView.makeCircle()
    }
    
}
