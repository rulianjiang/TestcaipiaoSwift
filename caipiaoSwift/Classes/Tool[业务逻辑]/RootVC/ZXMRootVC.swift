//
//  ZXMRootVC.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/21.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 设置根控制器.
class ZXMRootVC: NSObject {
    
  /// 设置根控制器
  ///
  /// - Returns: 返回控制器.
  class func chooseWindowRootVC() -> UIViewController {
    
    /// 版本号
    let zxmVersion = "version"
        
    //当有新版本更新的时候,或者第一次安装的时候,显示新特性界面.
    //1.获取当前版本号.
    let currentVersion:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    //print(currentVersion)
    
    //获取上一次的版本号.如果没有值,就为空
    //let lastVersion:String = UserDefaults.standard.object(forKey: zxmVersion) as? String ?? ""
    
    let lastVersion:String = ZXMSaveTool.object(forKey: zxmVersion) as? String ?? ""
    
    //设置根控制器
    var rootVc = UIViewController()
    
    //版本判断
    if currentVersion != lastVersion {
        //进入新界面
        rootVc = ZXMNewFeatureCollectionViewController()
        //rootVc.view.backgroundColor = UIColor.orange
        
        //存储当前版本号
        //UserDefaults.standard.set(currentVersion, forKey: zxmVersion)
        ZXMSaveTool.set(currentVersion, forKey: zxmVersion)
        
        //强制存储
        //UserDefaults.standard.synchronize()
        
    } else {
        //进入主框架.
        rootVc = ZXMTabBarViewController()
        
    }
        
        return rootVc
    }

}
