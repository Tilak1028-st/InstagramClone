//
//  StringConstant.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import Foundation
import UIKit

class Constant
{
    static var storyCollectionCell: String = "StoryCollectionViewCell"
    static var feedTableViewCell: String = "FeedTableViewCell"
    static var feedHeadercell: String = "FeedHeaderTableViewCell"
    static var searchCollectionViewCell: String = "SearchCollectionViewCell"
    static var reelTableViewCell: String = "ReelTableViewCell"
    static var activityTableView: String = "ActivityTableViewCell"
    static var postCollectionView: String = "PostCollectionViewCell"
    static var storyVc: String = "StoryViewController"
    static var home: String = "Home"
    static var profile: String = "Profile"
    static var postTagVc: String = "PostTagViewController"
}

class CollectionView: UICollectionView {

    private let numberOfCellsPerRow = 3
    private let spacing: CGFloat = 1

    private var flowLayout: UICollectionViewFlowLayout? {
        return collectionViewLayout as? UICollectionViewFlowLayout
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        sharedInit()
        updateItemSize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
        updateItemSize()
    }

    private func sharedInit() {
        flowLayout?.minimumInteritemSpacing = spacing
        flowLayout?.minimumLineSpacing = spacing
    }


    private func updateItemSize() {
        let cellWidth = floor((bounds.width - (CGFloat(numberOfCellsPerRow) - 1) * spacing) / CGFloat(numberOfCellsPerRow))
        flowLayout?.itemSize = CGSize(width: cellWidth, height: cellWidth)
        flowLayout?.invalidateLayout()
    }

    override var bounds: CGRect {
        didSet {
            if bounds != oldValue {
                updateItemSize()
            }
        }
    }
}
