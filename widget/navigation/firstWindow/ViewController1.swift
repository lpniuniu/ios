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

class ViewController1: UIViewController {

    let pushBtn:UIButton = UIButton()
    let presentBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
            self.present(ViewController2(), animated: true, completion: nil)
        })
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
