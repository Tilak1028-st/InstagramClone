//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var storyDpImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.storyDpImgView.layer.borderWidth = 1.5
        self.storyDpImgView.layer.borderColor = UIColor(red: 35.0/255.0, green: 48.0/255.0, blue: 103.0/255.0, alpha: CGFloat(1)).cgColor
        self.storyDpImgView.layer.cornerRadius = self.storyDpImgView.frame.size.width / 2
        self.plusImageView.layer.cornerRadius = self.plusImageView.frame.size.width / 2
        self.userNameLabel.text = "Username"
    }
}
