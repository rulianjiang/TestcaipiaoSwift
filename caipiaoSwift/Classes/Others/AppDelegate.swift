//
//  AppDelegate.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 shine. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /// 版本号
    let zxmVersion = "version"
    
    //var lastVersion:String = "0.0"


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //1.创建窗口
        window = UIWindow(frame: UIScreen.main.bounds)
        
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
        
        //let layout = UICollectionViewFlowLayout()
        
        //let rootVc = UICollectionViewController(collectionViewLayout: layout)
        
        //let rootVc = ZXMNewFeatureCollectionViewController()
        
        //2.设置窗口的根控制器
        //2.1.创建根控制器.
        //let tabBarVc = ZXMTabBarViewController()
        //window?.rootViewController = tabBarVc
        window?.rootViewController = rootVc
        
        //3.让窗口可见.
        window?.makeKeyAndVisible()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//MARK:让UINavigationBar,ZXMArenaNavViewController执行一次的方法.
extension UIApplication {
    private static let runOnce: Void = {
        ZXMNavigationViewController.setupUI()
        ZXMArenaNavViewController.navsSetupUI()
    }()
    
    override open var next: UIResponder? {
        // Called before applicationDidFinishLaunching
        UIApplication.runOnce
        return super.next
    }
}

extension UIApplication:ZXMNavigationViewControllerDelegate,ZXMArenaViewControllerDelegate {
    static func awake() {
        
    }
    
    static func navAwake() {
        
    }
    
}





