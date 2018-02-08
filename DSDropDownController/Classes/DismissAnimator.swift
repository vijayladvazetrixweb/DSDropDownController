//
//  DismissAnimator.swift
//  DSDropDownController
//
//  Created by David Seek on 1/23/18.
//  Copyright © 2018 David Seek. All rights reserved.
//

import Foundation


class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        let sourceViewController                        = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let desitantionViewController                   = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        var x :CGFloat                                  = desitantionViewController!.view.bounds.origin.x - (UIScreen.main.bounds.width / 2)
        let y :CGFloat                                  = desitantionViewController!.view.bounds.origin.y
        let width:CGFloat                               = desitantionViewController!.view.bounds.width
        let height:CGFloat                              = desitantionViewController!.view.bounds.height
        var frame:CGRect                                = CGRect(x: x, y: y, width: width, height: height)
        
        desitantionViewController?.view.alpha           = 1
        desitantionViewController?.view.frame           = frame
        
        let containerView                               = transitionContext.containerView
        containerView.insertSubview(desitantionViewController!.view, belowSubview: sourceViewController!.view)
        
        let bottomLeftCorner                            = CGPoint(x: UIScreen.main.bounds.width, y: 0)
        let finalFrame                                  = CGRect(origin: bottomLeftCorner, size: UIScreen.main.bounds.size)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            
            sourceViewController!.view.frame            = finalFrame
            desitantionViewController?.view.alpha       = 1
            
            x                                           = desitantionViewController!.view.bounds.origin.x
            frame                                       = CGRect(x: x, y: y, width: width, height: height)
            
            desitantionViewController?.view.frame       = frame
            
        }) { _ in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
