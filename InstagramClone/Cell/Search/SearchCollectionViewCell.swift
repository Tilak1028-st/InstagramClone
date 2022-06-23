//
//  SearchCollectionViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 16/06/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse()
    {
        imageView.image = nil
    }
    

}
