//
//  SearchCollectionViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 16/06/22.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    let images: [UIImage] = [
        UIImage(named: "pk1"),
        UIImage(named: "pk2"),
        UIImage(named: "pk3"),
        UIImage(named: "pk4"),
        UIImage(named: "pk5"),
        UIImage(named: "pk6")
    ].compactMap( { $0 })
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.image = images.randomElement()
    }

}
