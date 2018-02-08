//
//  Extensions.swift
//  DSDropDownController
//
//  Created by David Seek on 1/23/18.
//  Copyright © 2018 David Seek. All rights reserved.
//

import Foundation


extension UIViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return DismissAnimator()
    }
}
