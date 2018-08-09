//
//  ZXMNavigationViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/9.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI()  {
        
        //设置背景图片,forBarMetrics只能用默认模式.
        //默认模式,控制器的尺寸是从nav下面开始的.
        //如果用其他模式,会占据整个屏幕,也就是全屏
        self.navigationBar.setBackgroundImage(UIImage(named: "NavBar64"), for: UIBarMetrics.default)
        
        //设置字体颜色与大小.
        let dictM = NSMutableDictionary()
        //大小
        dictM[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 21)
        dictM[NSAttributedStringKey.foregroundColor] = UIColor.white
        //颜色
        self.navigationBar.titleTextAttributes = dictM as? [NSAttributedStringKey : Any]
        
    }
    

  

}
