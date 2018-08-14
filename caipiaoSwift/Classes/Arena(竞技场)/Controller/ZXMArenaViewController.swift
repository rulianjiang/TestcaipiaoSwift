//
//  ZXMArenaViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMArenaViewController: UIViewController {
    
    //第一次加载view的时候调用.
    //如果自定义view,重写这个方法.
    override func loadView() {
         //在这个方法里面不能调用self.view.bounds,如果调用,会造成死循环.
        //let imageView = UIImageView(frame: self.view.bounds)
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        //self.view.addSubview(imageView)
        self.view = imageView
        imageView.image = UIImage(named: "NLArenaBackground")
        
        //设置允许与用户交互
        imageView.isUserInteractionEnabled = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.设置titleView.
        let segMentController = UISegmentedControl(items: ["足球","篮球"])
        self.navigationItem.titleView = segMentController
        
        //2.设置背景图片.
        segMentController.setBackgroundImage(UIImage(named: "sbg"), for: .normal, barMetrics: UIBarMetrics.default)
        segMentController.setBackgroundImage(UIImage(named: "sbg2"), for: .selected, barMetrics: UIBarMetrics.default)
        
        //3.设置字体颜色
        segMentController.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: .normal)
        
        //4.设置选中的索引
        segMentController.selectedSegmentIndex = 0
        
        //5.设置前景色
        segMentController.tintColor = UIColor(red: 185 / 255.0, green: 159 / 255.0, blue: 125 / 255.0, alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
