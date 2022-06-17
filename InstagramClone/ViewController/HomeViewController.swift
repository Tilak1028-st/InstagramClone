//
//  HomeViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var storyCollectionView: UICollectionView!
    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addLeftBarIcon(named: "Instagram_logo.svg")
        storyCollectionView.register(UINib.init(nibName: Constant.storyCollectionCell, bundle: nil), forCellWithReuseIdentifier: Constant.storyCollectionCell)
        tableConfiguration()
    }
    
//MARK: - Function for FeedTableView SetUp.
    
    func tableConfiguration()
    {
        feedTableView.register(UINib.init(nibName: Constant.feedTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.feedTableViewCell)
   
        self.feedTableView.separatorColor = UIColor.clear
        let dummyViewHeight = CGFloat(40)
        
        self.feedTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.feedTableView.bounds.size.width, height: dummyViewHeight))
        self.feedTableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
    }
    
// MARK:  - Function left Navigationbar item.
    
    func addLeftBarIcon(named:String)
    {
        let logoImage = UIImage.init(named: named)
        let logoImageView = UIImageView.init(image: logoImage)
        logoImageView.frame = CGRect(x:0.0,y:0.0, width:60,height:25.0)
        logoImageView.contentMode = .scaleAspectFit
        let imageItem = UIBarButtonItem.init(customView: logoImageView)
        let widthConstraint = logoImageView.widthAnchor.constraint(equalToConstant: 150)
        let heightConstraint = logoImageView.heightAnchor.constraint(equalToConstant: 40)
        heightConstraint.isActive = true
        widthConstraint.isActive = true
        navigationItem.leftBarButtonItem =  imageItem
    }
    
}

// MARK: - Extension for CollectionView Delegate and Datasource methods.

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = storyCollectionView.dequeueReusableCell(withReuseIdentifier: Constant.storyCollectionCell, for: indexPath) as! StoryCollectionViewCell
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: Constant.home, bundle: nil)
        let storyVc = storyboard.instantiateViewController(withIdentifier: "StoryViewController") as! StoryViewController
        self.present(storyVc, animated: true, completion: nil)
        storyVc.modalPresentationStyle = .fullScreen
    }
}

// MARK: - Extension for CollectionView Delegate Flowlayout.

extension HomeViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/4, height: collectionHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
    
}

// MARK: - Extension for TableView delegate and Datasource methods.

extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = feedTableView.dequeueReusableCell(withIdentifier: Constant.feedTableViewCell, for: indexPath) as! FeedTableViewCell
        cell.growingCellDelegate = self
        cell.postCollectionView.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let headerView = Bundle.main.loadNibNamed(Constant.feedHeadercell, owner: self, options: nil)?.first
        return headerView as? UIView
    }

}

//MARK: - Extension for growing textview height as new text entered.

extension HomeViewController: GrowingCellProtocol {
    
    func updateHeightOfRow(_ cell: FeedTableViewCell, _ textView: UITextView)
    {
        let size = textView.bounds.size
        let newSize = feedTableView.sizeThatFits(CGSize(width: size.width,
                                                         height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height {
            UIView.setAnimationsEnabled(false)
            feedTableView?.beginUpdates()
            feedTableView?.endUpdates()
            UIView.setAnimationsEnabled(true)
            if let thisIndexPath = feedTableView.indexPath(for: cell) {
                feedTableView.scrollToRow(at: thisIndexPath, at: .bottom, animated: false)
            }
        }
    }
}
