//
//  PostShareTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 22/06/22.
//

import UIKit

class PostShareTableViewCell: UITableViewCell {

    @IBOutlet weak var shareUserProfileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.shareUserProfileImageView.layer.cornerRadius = self.shareUserProfileImageView.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
