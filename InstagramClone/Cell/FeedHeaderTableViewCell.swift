//
//  FeedHeaderTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class FeedHeaderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.userImageView.layer.borderWidth = 1
        self.userImageView.layer.borderColor = UIColor.gray.cgColor
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
