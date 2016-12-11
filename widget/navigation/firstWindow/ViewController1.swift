//
//  ViewController1.swift
//  NavigationVC
//
//  Created by FanFamily on 2016/12/2.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit
import SnapKit
import BlocksKit

class ViewController1: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {

    let pushBtn:UIButton = UIButton()
    let presentBtn:UIButton = UIButton()
    var presentAnimator:PresentAnimator = PresentAnimator()
    var dismissAnimator:DismissAnimator = DismissAnimator()
    var interactiveAnimator:InteractiveAnimator = InteractiveAnimator()
    var timer:Timer? = nil
    var times:CGFloat = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 显示toolbar
        self.navigationController?.isToolbarHidden = false
        self.setToolbarItems([UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .bookmarks, target: nil, action: nil)], animated: false)
        
        // 设置navigationBar的title
        self.title = "root view"
        
        // 设置navigationBar按钮
        self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil), animated: false)
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.pushAction(sender:))), animated: false)
        
        // 自定义navigationController动画
        self.navigationController?.delegate = self
        //
        
        view.addSubview(pushBtn)
        pushBtn.setTitle("push", for: .normal)
        pushBtn.backgroundColor = UIColor.brown
        view.addSubview(presentBtn)
        presentBtn.setTitle("present", for: .normal)
        presentBtn.backgroundColor = UIColor.brown

        pushBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(view).offset(10)
            make.width.height.equalTo(50);
        }
        
        pushBtn.bk_(whenTapped: {
            self.navigationController?.pushViewController(ViewController2(), animated: true)
        })
        
        presentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(pushBtn.snp.right).offset(10)
            make.width.height.equalTo(80);
        }
        
        presentBtn.bk_(whenTapped: {
            let vc = ViewController2()
            vc.transitioningDelegate = self
            self.present(vc, animated: true, completion: nil)
        })
    }
    
    func timeUpdate() {
        times += 1
        if times <= 5 {
            let per:CGFloat = times/5
            interactiveAnimator.update(per)
        } else {
            timer?.invalidate()
            interactiveAnimator.finish()
        }
    }
    
    func pushAction(sender:UIBarButtonItem) {
        let vc = ViewController2()
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeUpdate), userInfo: nil, repeats: true);
        return interactiveAnimator
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timeUpdate), userInfo: nil, repeats: true);
        return interactiveAnimator
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PresentAnimator()
        } else {
            return DismissAnimator()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
