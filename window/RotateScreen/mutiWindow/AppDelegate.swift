//
//  AppDelegate.swift
//  mutiWindow
//
//  Created by familymrfan on 16/10/5.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var aditionWindow:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        self.window = UIWindow()
        self.window!.rootViewController = ViewController()
        let childViewController = ChildViewController()
        self.window!.rootViewController!.addChildViewController(ChildViewController())
        self.window!.rootViewController!.view.addSubview(childViewController.view)
        self.window!.backgroundColor = UIColor.green
        self.window!.makeKeyAndVisible()
        
        aditionWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        aditionWindow!.rootViewController = UIViewController()
        aditionWindow!.backgroundColor = UIColor.red
        aditionWindow!.makeKeyAndVisible()
        aditionWindow!.windowLevel = UIWindowLevelStatusBar + 1
        
        print("window array: \(UIApplication.shared.windows)")
        print("key window : \(UIApplication.shared.keyWindow)")
           
        return true
    }
}

