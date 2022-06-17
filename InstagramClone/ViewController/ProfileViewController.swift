//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit
import ScrollableSegmentedControl

class ProfileViewController: UIViewController {

    @IBOutlet weak var addfollowerButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    @IBOutlet weak var profileimageView: UIView!
    @IBOutlet weak var segment: ScrollableSegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 23)!], for: UIControl.State.normal)
        self.profileimageView.layer.borderWidth = 1
        self.profileimageView.layer.borderColor = UIColor.gray.cgColor
        self.profileimageView.layer.cornerRadius = self.profileimageView.frame.size.width / 2
        editProfileButton.layer.borderWidth = 0.7
        editProfileButton.layer.borderColor = UIColor.gray.cgColor
        addfollowerButton.layer.borderWidth = 0.7
        addfollowerButton.layer.borderColor = UIColor.gray.cgColor
        segemntConfiguration()
    }
    
    func segemntConfiguration()
    {

        segment.backgroundColor = UIColor(red: 237.0/255, green: 140.0/255, blue: 12.0/255, alpha: 1.0)
        segment.segmentStyle = .textOnly
        segment.insertSegment(withTitle: "post", at: 0)
        segment.insertSegment(withTitle: "tag", at: 1)
        segment.underlineSelected = true
        segment.fixedSegmentWidth = false
        segment.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        
        let normalFont = UIFont(name: "Helvetica", size: 17.0)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: normalFont as Any,NSAttributedString.Key.foregroundColor: UIColor.systemGray5], for: UIControl.State.normal)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: normalFont as Any,NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("Hety")
        }
    }
    
}
