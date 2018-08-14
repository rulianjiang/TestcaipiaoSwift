//
//  ZXMArenaNavViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/14.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

//导航栏只是运行一次的解决方法.
protocol ZXMArenaViewControllerDelegate {
    static func navAwake()
}

class ZXMArenaNavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func navsSetupUI()  {
        
        //print("测试...")
        let bar = UINavigationBar.appearance(whenContainedInInstancesOf: [ZXMArenaNavViewController.self])

        bar.setBackgroundImage(UIImage.imageWithStretImage(image: UIImage(named: "bg")!), for: UIBarMetrics.default)
        
    }
    

}


