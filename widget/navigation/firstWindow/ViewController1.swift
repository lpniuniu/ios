//
//  ViewController1.swift
//  NavigationVC
//
//  Created by FanFamily on 2016/12/2.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit
import SnapKit

class ViewController1: UIViewController {

    let pushBtn:UIButton = UIButton()
    let popBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(pushBtn)
        pushBtn.setTitle("push", for: .normal)
        pushBtn.backgroundColor = UIColor.brown
        view.addSubview(popBtn)
        popBtn.setTitle("pop", for: .normal)
        popBtn.backgroundColor = UIColor.brown
        
        pushBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(view).offset(10)
            make.width.height.equalTo(50);
        }
        
        popBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(pushBtn.snp.right).offset(10)
            make.width.height.equalTo(50);
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
