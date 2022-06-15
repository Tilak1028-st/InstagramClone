//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        barButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 23)!], for: UIControl.State.normal)
    }
}
