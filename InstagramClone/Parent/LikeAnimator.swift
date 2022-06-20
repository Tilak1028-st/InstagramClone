//
//  LikeAnimator.swift
//  InstagramClone
//
//  Created by PCS213 on 20/06/22.
//

import Foundation
import UIKit

class LikeAnimator
{
    let container: UIView
    let layoutConstraint: NSLayoutConstraint
    
    init(container: UIView, layoutConstraint: NSLayoutConstraint) {
        self.container = container
        self.layoutConstraint = layoutConstraint
    }
    
    func animate(completion: @escaping () -> Void) {
        layoutConstraint.constant = 100
        
        UIView.animate(
            withDuration: 0.7,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 2,
            options: .curveLinear) { [weak self] in
                self?.container.layoutIfNeeded()
            } completion: { [weak self] (_) in
                self?.layoutConstraint.constant = 0
                
                UIView.animate(withDuration: 0.3) {
                    self?.container.layoutIfNeeded()
                    completion()
                }
            }
    }
}
