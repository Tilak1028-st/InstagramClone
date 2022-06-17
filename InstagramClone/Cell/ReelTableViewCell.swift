//
//  ReelTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 16/06/22.
//

import UIKit

class ReelTableViewCell: UITableViewCell {

    @IBOutlet weak var reelImageView: UIImageView!
    @IBOutlet weak var marqueeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
