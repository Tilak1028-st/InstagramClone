//
//  ReelViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class ReelViewController: UIViewController {

    @IBOutlet weak var reelTableView: UITableView!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    
    let images: [String] = [
         "pk7",
         "pk8",
         "pk9"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 23)!], for: UIControl.State.normal)
        reelTableView.register(UINib.init(nibName: Constant.reelTableViewCell, bundle: nil), forCellReuseIdentifier: Constant.reelTableViewCell)
    }
}

//MARK: - Extension for tableview delegate and datasource methods.

extension ReelViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = reelTableView.dequeueReusableCell(withIdentifier: Constant.reelTableViewCell, for: indexPath) as! ReelTableViewCell
        UIView.animate(withDuration: 12.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
            cell.marqueeLabel.center = CGPoint.init(x: 35 - cell.marqueeLabel.bounds.size.width / 2, y: cell.marqueeLabel.center.y)
               }, completion:  { _ in })
        cell.reelImageView.image = UIImage.init(named: images[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
            return self.reelTableView.frame.size.height
    }
    
}
