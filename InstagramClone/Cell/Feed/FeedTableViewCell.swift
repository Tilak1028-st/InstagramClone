//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
//    weak var growingCellDelegate: GrowingCellProtocol?
    
    @IBOutlet weak var shareImageView: UIImageView!
    @IBOutlet weak var heartImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var likeImagewidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var likeImageView: UIImageView!
    
    let images: [String] = ["pk1.jpeg","pk2.jpeg","pk3.jpeg","pk4.jpeg","pk5.jpeg"]
    var currentPage = 0
    static var isPostLiked: Bool = false
    
    lazy var likeAnimator = LikeAnimator(container: contentView, layoutConstraint: likeImagewidthConstraint)
    
    lazy var doubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubletap))
        tapRecognizer.numberOfTapsRequired = 2
        FeedTableViewCell.isPostLiked = true
        return tapRecognizer
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.pageController.numberOfPages = images.count
        postCollectionView.register(UINib(nibName: Constant.postCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constant.postCollectionViewCell)
        
        self.postCollectionView.reloadData()
        self.postCollectionView.addGestureRecognizer(doubleTapRecognizer)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapLike(_:)))
        tapRecognizer.accessibilityHint = "true"
        tapRecognizer.numberOfTapsRequired = 1
        self.heartImageView.addGestureRecognizer(tapRecognizer)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func didTapLike(_ sender: UIGestureRecognizer) {
        if FeedTableViewCell.isPostLiked == true {
            self.heartImageView.image = UIImage(systemName: "heart.fill")
            FeedTableViewCell.isPostLiked = false
        }
        else {
            self.heartImageView.image = UIImage(systemName: "heart")
            FeedTableViewCell.isPostLiked = true
        }
    }
    
    @objc func didDoubletap() {
        likeAnimator.animate {
            self.likeImageView.image = UIImage(systemName: "heart.fill")
            self.heartImageView.image = UIImage(systemName: "heart.fill")
            FeedTableViewCell.isPostLiked = false
        }
    }
}


//MARK:  - Extension for UItableView delegate and datasource.

extension FeedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = postCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.postCollectionViewCell, for: indexPath) as! PostCollectionViewCell
        
        item.postImageView.image = UIImage(named: images[indexPath.item])
        return item
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.postCollectionView
        {
            let pageWidth = scrollView.frame.width
            self.currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
            self.pageController.currentPage = self.currentPage
            self.countLabel.text = "\(currentPage+1)/\(images.count)"
        }
    }
}

//MARK: - Extension for CollectionViewFlowlayout

extension FeedTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = UIScreen.main.bounds.size.width
        return CGSize(width: cellWidth, height: 250)
    }
}

////MARK: - Extension for textview growing height
//
//extension FeedTableViewCell: UITextViewDelegate {
//
//    func textViewDidChange(_ textView: UITextView)
//    {
//        if let deletate = growingCellDelegate {
//            deletate.updateHeightOfRow(self, textView)
//        }
//    }
//}

//MARK: - Protocol for textview growing height

//protocol GrowingCellProtocol: AnyObject {
//    func updateHeightOfRow(_ cell: FeedTableViewCell, _ textView: UITextView)
//}
