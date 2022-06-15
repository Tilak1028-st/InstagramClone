//
//  SearchViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var searchBarView: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = searchBarView
    }
    
}
