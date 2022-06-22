//
//  CommentViewController.swift
//  InstagramClone
//
//  Created by PCS213 on 20/06/22.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentTableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    
    static var count: Int = 0
    static var sectionValue: Int = 0
    var replySelectedSection: Int?
    var replySelectedRow: Int?
    var isReplyRow: Bool = false
    var arrComments = [CommentSection]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Functions
    private func setupView() {
        self.tabBarController?.tabBar.isHidden = true
        commentTableView.register(UINib(nibName: Constant.commentTableCell, bundle: nil), forCellReuseIdentifier: Constant.commentTableCell)
        commentTableView.separatorColor = UIColor.clear
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        
        arrComments.append(CommentSection.init(0, comment: "g ejrjhvgjer gvje rgvjer g"))
        arrComments.append(CommentSection.init(1, comment: "djfgv sdjgv"))
        arrComments.append(CommentSection.init(2, comment: "skrgjehrjgj"))
    }
    
    @objc func replyButtonClicked( _ sender: UITapGestureRecognizer) {
        replySelectedSection = sender.view?.tag
        commentTextField.becomeFirstResponder()
    }
    
    @objc func replyRowClicked(_ sender: UITapGestureRecognizer) {
        replySelectedRow = sender.view?.tag
        replySelectedSection = Int(sender.accessibilityHint ?? "0")
        commentTextField.becomeFirstResponder()
    }
    
    @IBAction func postComment(_ sender: UIButton) {
       
        if let section = replySelectedSection, let msg = commentTextField.text {
            arrComments[section].arrReply.append(CommentReply.init(reply: msg))
            commentTableView.reloadData()
        }
        
        if let row = replySelectedRow, let msg = commentTextField.text, let section = replySelectedSection {
            arrComments[section].arrReply[row].rowCommentReply.append(RowCommentReply.init(rowCommentReply: msg))
            commentTableView.reloadData()
        }
        commentTextField.text = ""
    }
}

//MARK: - Extension for tableview delegate and datasource methods.
extension CommentViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrComments.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrComments[section].arrReply.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: Constant.commentTableCell) as! CommentTableViewCell
        cell.commentTextView.text = arrComments[section].comment
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(replyButtonClicked(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        cell.replyLabel.addGestureRecognizer(tapRecognizer)
        tapRecognizer.accessibilityHint = "\(section)"
        tapRecognizer.view?.tag = section
        return cell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = commentTableView.dequeueReusableCell(withIdentifier: Constant.commentTableCell) as! CommentTableViewCell
        
        cell.commentTextView.text = arrComments[indexPath.section].arrReply[indexPath.row].comment
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(replyRowClicked(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        cell.replyLabel.addGestureRecognizer(tapRecognizer)
        cell.commentViewLeadingConstraint.constant = 30
        tapRecognizer.view?.tag = indexPath.row
        tapRecognizer.accessibilityHint = "\(indexPath.section)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
}
