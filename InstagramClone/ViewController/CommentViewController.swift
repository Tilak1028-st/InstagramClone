//
//  CommentViewController.swift
//  InstagramClone
//
//  Created by PCS213 on 20/06/22.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//MARK: - Extension for tableview delegate and datasource methods.

extension CommentViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell
    }
    
    
}
