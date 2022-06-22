//
//  CommentTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 20/06/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var replyLabel: UILabel!
    @IBOutlet weak var commentViewLeadingConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
