//
//  PresentAnimator.swift
//  NavigationVC
//
//  Created by FanFamily on 16/12/10.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        
        // 将跳转后的页面，设置到屏幕上方
        toViewController?.view.frame = (fromViewController?.view.frame)!
        toViewController?.view.frame.origin.y -= (toViewController?.view.frame.height)!
        
        // 添加到转场动画容器上，
        // containerView.addSubview((fromViewController?.view)!)
        containerView.addSubview((toViewController?.view)!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
            // 回归的屏幕位置
            toViewController?.view.frame = (fromViewController?.view.frame)!
            // fromViewController?.view.frame.origin.y -= (fromViewController?.view.frame.height)!
        }, completion: { (complete:Bool) -> Void in
            transitionContext.completeTransition(true)
        })
    }
}
