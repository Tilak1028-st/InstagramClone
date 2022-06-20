//
//  ProfileViewController.swift
//  Instagram Clone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit
import ScrollableSegmentedControl

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var addfollowerButton: UIButton!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    @IBOutlet weak var profileimageView: UIView!
    @IBOutlet weak var segment: ScrollableSegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(UIScreen.main.bounds.width)
        barButtonItem.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont(name: "Arial", size: 23)!], for: UIControl.State.normal)
        self.profileimageView.layer.borderWidth = 1
        self.profileimageView.layer.borderColor = UIColor.gray.cgColor
        self.profileimageView.layer.cornerRadius = self.profileimageView.frame.size.width / 2
        editProfileButton.layer.borderWidth = 0.7
        editProfileButton.layer.borderColor = UIColor.gray.cgColor
        addfollowerButton.layer.borderWidth = 0.7
        addfollowerButton.layer.borderColor = UIColor.gray.cgColor
        segment.selectedSegmentIndex = 0
        segemntConfiguration()
    }
    
    func segemntConfiguration()
    {
        
        segment.backgroundColor = UIColor.white
        segment.segmentStyle = .textOnly
        segment.insertSegment(withTitle: "Post", at: 0)
        segment.insertSegment(withTitle: "Tag", at: 1)
        segment.underlineSelected = true
        segment.fixedSegmentWidth = true
        segment.addTarget(self, action: #selector(segmentSelected(sender:)), for: .valueChanged)
        
        let normalFont = UIFont(name: "Helvetica", size: 17.0)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: normalFont as Any,NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        segment.setTitleTextAttributes([NSAttributedString.Key.font: normalFont as Any,NSAttributedString.Key.foregroundColor: UIColor.black], for: .selected)
    }
    
    @objc func segmentSelected(sender:ScrollableSegmentedControl) {
       
        let estimatorPhotoVc = storyboard?.instantiateViewController(withIdentifier: Constant.postTagVc) as! PostTagViewController
        if sender.selectedSegmentIndex == 0 {
            
        }
        else {
            print("Hello")
        }
    }
    
}
