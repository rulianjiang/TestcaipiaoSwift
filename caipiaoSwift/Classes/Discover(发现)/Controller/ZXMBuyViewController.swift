//
//  ZXMBuyViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/15.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMBuyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.设置titleView
        let button = ZXMTitleViewButton()
        button.setImage(UIImage(named: "down"), for: .normal)
        button.setTitle("全部彩种", for: .normal)
        button.sizeToFit()
        self.navigationItem.titleView = button
        
        //2.设置左侧返回按钮.
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.imageWithRenderingModeOriginalName(name: "NavBack"), style: .plain, target: self, action: #selector(back))
    }
    
   /// 返回按钮监听事件
//   @objc func back()  {
//    self.navigationController?.popViewController(animated: true)
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
