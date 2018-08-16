//
//  ZXMNavigationViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/9.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

//只是运行一次的解决方法.
protocol ZXMNavigationViewControllerDelegate {
    static func awake()
}


class ZXMNavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //重写系统的方法.设置返回按钮.
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        //print("控制器为:\(viewController)")
        
        if self.viewControllers.count > 1 {
            //非根控制器,设置导航条左侧返回按钮.
            //如果在导航控制器统一设置返回按钮.就没有滑动返回的功能.
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.imageWithRenderingModeOriginalName(name: "NavBack"), style: .plain, target: self, action: #selector(back))
        }
    }
    
    /// 返回按钮监听事件
       @objc func back()  {
        self.popViewController(animated: true)
    
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  static func setupUI()  {
    
       // print("执行了...哈哈...")
        
        //设置背景图片,forBarMetrics只能用默认模式.
        //默认模式,控制器的尺寸是从nav下面开始的.
        //如果用其他模式,会占据整个屏幕,也就是全屏
    
        //1.获取导航条标识.获取app所有的跳行条标志.
        //appearances 是一个协议.只要遵守这个协议.都有这个方法.
        //let bar = UINavigationBar.appearance()
        let bar = UINavigationBar.appearance(whenContainedInInstancesOf: [ZXMNavigationViewController.self])
        bar.setBackgroundImage(UIImage(named: "NavBar64"), for: UIBarMetrics.default)
        
        //设置字体颜色与大小.
        let dictM = NSMutableDictionary()
        //大小
        dictM[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 21)
        dictM[NSAttributedStringKey.foregroundColor] = UIColor.white
        //颜色
        bar.titleTextAttributes = dictM as? [NSAttributedStringKey : Any]
        
    }
    
}


