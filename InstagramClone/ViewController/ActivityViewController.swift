//
//  ActivityViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class ActivityViewController: UIViewController {
    
    @IBOutlet weak var navBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var activityTableView: UITableView!
    
    let tableSection: [String] = ["New","Yesterday","This Week"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navBarButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 23)!], for: UIControl.State.normal)
        self.activityTableView.register(UINib(nibName: Constant.activityTableView, bundle: nil), forCellReuseIdentifier: Constant.activityTableView)
        self.activityTableView.separatorColor = UIColor.clear
        self.activityTableView.rowHeight = UITableView.automaticDimension
    }
}

extension ActivityViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        tableSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = activityTableView.dequeueReusableCell(withIdentifier: Constant.activityTableView, for: indexPath) as! ActivityTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
       tableSection[section]
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        100
    }
}
