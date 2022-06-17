//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    weak var growingCellDelegate: GrowingCellProtocol?
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    let images: [String] = ["pk1.jpeg","pk2.jpeg","pk3.jpeg","pk4.jpeg","pk5.jpeg"]
    var currentPage = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commentTextView.delegate = self
        self.pageController.numberOfPages = images.count
        postCollectionView.register(UINib(nibName: Constant.postCollectionView, bundle: nil), forCellWithReuseIdentifier: Constant.postCollectionView)
        
        self.postCollectionView.reloadData()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
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
        let item = postCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.postCollectionView, for: indexPath) as! PostCollectionViewCell
        
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

//MARK: - Extension for textview growing height

extension FeedTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView)
    {
        if let deletate = growingCellDelegate {
            deletate.updateHeightOfRow(self, textView)
        }
    }
}

//MARK: - Protocol for textview growing height

protocol GrowingCellProtocol: AnyObject {
    func updateHeightOfRow(_ cell: FeedTableViewCell, _ textView: UITextView)
}
