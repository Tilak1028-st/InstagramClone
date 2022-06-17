//
//  FeedTableViewCell.swift
//  InstagramClone
//
//  Created by PCS213 on 15/06/22.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    weak var growingCellDelegate: GrowingCellProtocol?
    
    @IBOutlet weak var commentTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        commentTextView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: - Extension for textview growing height

extension FeedTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView)
    {
        if let deletate = growingCellDelegate {
            deletate.updateHeightOfRow(self, textView)
        }
    }
}

//MARK: - Protocol for textview growing height

protocol GrowingCellProtocol: AnyObject {
    func updateHeightOfRow(_ cell: FeedTableViewCell, _ textView: UITextView)
}
