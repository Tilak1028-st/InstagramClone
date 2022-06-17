//
//  ActivityTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 16/06/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.borderWidth = 1
        self.profileImageView.layer.borderColor = UIColor.gray.cgColor
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
        self.postImageView.layer.borderWidth = 1
        self.postImageView.layer.borderColor = UIColor.gray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
