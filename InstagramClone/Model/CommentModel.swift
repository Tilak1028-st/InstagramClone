//
//  CommentModel.swift
//  InstagramClone
//
//  Created by PCS213 on 21/06/22.
//

import Foundation
import UIKit

class CommentModel
{
    var id: Int = 0
}


class CommentSection {
    var id: Int
    var comment: String
    var arrReply = [CommentReply]()
    
    init(_ id: Int, comment: String) {
        self.id = id
        self.comment = comment
    }
}

class CommentReply {
    var comment: String
    var rowCommentReply = [RowCommentReply]()
    
    init(reply: String) {
        self.comment = reply
    }
}

class RowCommentReply {
    var rowComment: String
    
    init(rowCommentReply: String) {
        self.rowComment = rowCommentReply
    }
}
