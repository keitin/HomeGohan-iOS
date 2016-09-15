//
//  GroupCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/15.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit
import SDWebImage

class GroupCell: UITableViewCell {
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutGroupImageView()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func fillWith(group: Group) {
        self.groupImageView.sd_setImageWithURL(NSURL(string: group.imageURL))
        self.nameLabel.text = group.name
    }
    
    private func layoutGroupImageView() {
        self.groupImageView.makeAspectFill()
        self.groupImageView.makeCircle()
    }

    
}
