//
//  ShareViewController.swift
//  InstagramClone
//
//  Created by PCS213 on 22/06/22.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var shareTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareTableView.register(UINib(nibName: Constant.postShareCell, bundle: nil), forCellReuseIdentifier: Constant.postShareCell)
        self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
    }
}


extension ShareViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = shareTableView.dequeueReusableCell(withIdentifier: Constant.postShareCell, for: indexPath) as! PostShareTableViewCell
        return cell
    }
}
