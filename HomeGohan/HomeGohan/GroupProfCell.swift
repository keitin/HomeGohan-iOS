//
//  GroupProfCell.swift
//  HomeGohan
//
//  Created by 松下慶大 on 2016/09/14.
//  Copyright © 2016年 matsushita keita. All rights reserved.
//

import UIKit

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
    
    func fillWith() {
        
    }
    
    private func layoutProfImageView() {
        self.profileImageView.makeCircle()
        self.profileImageView.makeAspectFill()
    }
    
    private func layoutNameLabel() {
        
    }
    
}
