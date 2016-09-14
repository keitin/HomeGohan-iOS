//
//  GroupProfCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class GroupProfCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutProfImageView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillWith(group: Group) {
        self.profileImageView.sd_setImageWithURL(NSURL(string: group.imageURL))
        self.nameLabel.text = group.name
    }
    
    private func layoutProfImageView() {
        self.profileImageView.makeCircle()
        self.profileImageView.makeAspectFill()
    }
    
    private func layoutNameLabel() {
        
    }
    
}
