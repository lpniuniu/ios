//
//  DismissAnimator.swift
//  NavigationVC
//
//  Created by FanFamily on 16/12/10.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        containerView.addSubview((toViewController?.view)!)
        containerView.addSubview((fromViewController?.view)!)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
            fromViewController?.view.alpha = 0.0
        }, completion: { (complete:Bool) -> Void in
            transitionContext.completeTransition(true)
        })
    }
}
