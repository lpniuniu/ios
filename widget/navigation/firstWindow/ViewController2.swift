//
//  ViewController2.swift
//  NavigationVC
//
//  Created by FanFamily on 2016/12/2.
//  Copyright © 2016年 niuniu. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    let popBtn:UIButton = UIButton()
    let dissmissBtn:UIButton = UIButton()
    let presentBtn:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        view.addSubview(popBtn)
        popBtn.setTitle("pop", for: .normal)
        popBtn.backgroundColor = UIColor.brown
        
        view.addSubview(dissmissBtn)
        dissmissBtn.setTitle("dissmissBtn", for: .normal)
        dissmissBtn.backgroundColor = UIColor.brown
        
        view.addSubview(presentBtn)
        presentBtn.setTitle("presentBtn", for: .normal)
        presentBtn.backgroundColor = UIColor.brown
        
        popBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(view).offset(10)
            make.width.height.equalTo(50);
        }
        
        popBtn.bk_(whenTapped: {
            _ = self.navigationController?.popViewController(animated: true)
        })
        
        dissmissBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(popBtn.snp.right).offset(10)
            make.width.height.equalTo(100);
        }
        
        dissmissBtn.bk_(whenTapped: {
            _ = self.dismiss(animated: true, completion: nil)
        })
        
        presentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.bottom)
            make.left.equalTo(dissmissBtn.snp.right).offset(10)
            make.width.height.equalTo(100);
        }
        
        presentBtn.bk_(whenTapped: {
            _ = self.navigationController?.present(UIViewController(), animated: true, completion: nil)
        })
        
        title = "v1"
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
