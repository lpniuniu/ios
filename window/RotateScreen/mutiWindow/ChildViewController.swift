//
//  ChildViewController.swift
//  mutiWindow
//
//  Created by FanFamily on 16/10/6.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {

    let subView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.blue
        subView.backgroundColor = UIColor.brown
        view.addSubview(subView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animateAlongsideTransition(in: view, animation: { (context) in
            print(".....................")
            }) { (context) in
        }
    }
}
