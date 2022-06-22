//
//  UIViewControllerExtension.swift
//  InstagramClone
//
//  Created by PCS213 on 22/06/22.
//

import Foundation
import UIKit

extension UIViewController {
func transitionVc(vc: UIViewController, duration: CFTimeInterval, type: CATransitionSubtype) {
    let customVcTransition = vc
    let transition = CATransition()
    transition.duration = duration
    transition.type = CATransitionType.push
    transition.subtype = type
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)
    present(customVcTransition, animated: false, completion: nil)
}}
