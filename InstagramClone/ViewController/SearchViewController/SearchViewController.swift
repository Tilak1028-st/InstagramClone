//
//  SearchViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet var searchBarView: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ImageSearchViewModel()
    var searchImage = [SearchImageModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    //MARK: -- Function to setUpView.
    
    private func setUpView() {
        navigationItem.titleView = searchBarView
        collectionView.register(UINib(nibName: Constant.searchCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constant.searchCollectionViewCell)
        collectionView.collectionViewLayout = SearchViewController.createlayout()
        collectionView.register(UINib(nibName: Constant.loadingCell, bundle: nil), forCellWithReuseIdentifier: Constant.loadingCell)
        getImageFromViewModel()
    }
    
    func getImageFromViewModel() {
        viewModel.getSearchImageData(page: 0, isPagination: false) { [weak self] (isImageAvaiable) in
            self?.collectionView.reloadData()
        }
    }
    
    //MARK: - CompotionalLayout Function.
    
    static func createlayout() -> UICollectionViewCompositionalLayout {
        
        //Items
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)))
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2)
        
        //Vertical Items
        let verticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)))
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2)
        
        //VerticalGroup
        let VerticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)),
            subitem: verticalStackItem,
            count: 2)
        
        
        //Triplet Item
        
        let tripletItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)))
        
        tripletItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2,
            leading: 2,
            bottom: 2,
            trailing: 2)
        
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)),
            subitem: tripletItem,
            count: 3)
        
        
        //Group
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.7)),
            subitems: [item, VerticalStackGroup])
        
        
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1.0)),
            subitems: [horizontalGroup, tripletHorizontalGroup])
        
        
        //Section
        let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

//MARK: - Extension for CollectionView Delegate and DataSource methods.

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.viewModel.hasMoreData ? 2 : 1
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if section == 0
        {
            return self.viewModel.imageSearch.count
        }
        else
        {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.searchCollectionViewCell, for: indexPath) as! SearchCollectionViewCell
            let imageData = self.viewModel.imageSearch[indexPath.row]
            if let imageUrl = imageData.download_url {
                let url = URL(string: imageUrl)
                print(imageUrl)
                item.imageView.kf.setImage(with: url)
            }
            return item
        }
        else
        {
            let item = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.loadingCell, for: indexPath) as! LoadingCollectionViewCell
            item.activityIndicator.startAnimating()
            return item
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == viewModel.imageSearch.count - 1 {
                if viewModel.hasMoreData == true {
                    ImageSearchViewModel.page += 2
                    viewModel.getSearchImageData(page: ImageSearchViewModel.page, isPagination: true) { [weak self] (isDataAvaiable) in
                        self?.collectionView.reloadData()
                    }
                }
            }
        }
    }
}
