//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var storyDpImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.storyDpImgView.layer.borderWidth = 1
        self.storyDpImgView.layer.borderColor = UIColor.gray.cgColor
        self.storyDpImgView.layer.cornerRadius = self.storyDpImgView.frame.size.width / 2
        self.userNameLabel.text = "Username"
    }

}
