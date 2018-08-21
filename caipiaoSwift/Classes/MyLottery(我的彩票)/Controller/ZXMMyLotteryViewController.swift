//
//  ZXMMyLotteryViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMMyLotteryViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //1.设置button背景图片.

//        //1.1获取到button的背景图片.
//        var image = self.loginBtn.currentBackgroundImage
//        //1.2.拉伸图片.
//        image =  image?.stretchableImage(withLeftCapWidth: Int((image?.size.width)! * 0.5), topCapHeight: Int((image?.size.height)! * 0.5))
//        //1.3.设置背景图片.
//        self.loginBtn.setBackgroundImage(image, for: .normal)
        
      let imageNor =  UIImage.imageWithStretImage(image: self.loginBtn.currentBackgroundImage!, button: loginBtn)
        
      let imageHigh =  UIImage.imageWithStretImage(image: self.loginBtn.currentBackgroundImage!, button: loginBtn)
        
      self.loginBtn.setBackgroundImage(imageNor, for: .normal)
      self.loginBtn.setBackgroundImage(imageHigh, for: .highlighted)
        
        //2.设置导航条左侧按钮.
        let button = UIButton()
        button.setImage(UIImage(named: "kf"), for: .normal)
        button.setTitle("客服", for: .normal)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        //3.设置右侧设置按钮.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.imageWithRenderingModeOriginalName(name: "setting"), style: .plain, target: self, action: #selector(config))
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  /// 导航栏右侧点击按钮监听事件.
  @objc func config()  {
    
        let settingVC = ZXMSettingTableViewController()
        settingVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(settingVC, animated: true)
    }

}








