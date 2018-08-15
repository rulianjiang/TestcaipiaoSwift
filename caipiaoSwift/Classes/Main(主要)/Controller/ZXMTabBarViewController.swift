//
//  ZXMTabBarViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMTabBarViewController: UITabBarController {
    
    /// 懒加载模型数组.方便把items的数据模型传递到自定义的tabBar里面.
    lazy var items:NSMutableArray = {
        let items = NSMutableArray()
        return items
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.添加子控制器.
        self.setupAllChildViewController()
        
        //2.自定义tabBar.
        setupTabBar()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //移除tabBar的子控件.
        
        for view in self.tabBar.subviews {
            //print("所有控件为:\(view)")
            //判断当前的控件是否是ZXMTabBar.如果不是,直接移除.
            if !view.isKind(of: ZXMTabBar.self) {
                view.removeFromSuperview()
            }
        }
        
    }
    
    //需要再次移除一下,不然会出问题.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //移除tabBar的子控件.
        for view in self.tabBar.subviews {
            //print("所有控件为:\(view)")
            //判断当前的控件是否是ZXMTabBar.如果不是,直接移除.
            if !view.isKind(of: ZXMTabBar.self) {
                view.removeFromSuperview()
            }
        }
        
        
    }


}

extension ZXMTabBarViewController {
    
    //MARK:自定义的tabBar.
    
    /// 添加自定义的tabBar.
    func setupTabBar()  {
        
        //1.移除系统的tabBar.
        //tabBar.removeFromSuperview()
        //IOS11无法移除.只能隐藏.
        //self.tabBar.isHidden = true
        
        let zxmTabBar = ZXMTabBar()
        //zxmTabBar.count = self.childViewControllers.count
        //这里不能用frame,不然就跑下面去了,需要改为bounds
        //zxmTabBar.frame = self.tabBar.frame
        zxmTabBar.frame = self.tabBar.bounds
        zxmTabBar.backgroundColor = UIColor.red
        zxmTabBar.delegate = self
        //这里不能添加到view上, 添加到tabbar上面.
        //self.view.addSubview(zxmTabBar)
        self.tabBar.addSubview(zxmTabBar)
        
        
        //2.添加自定义的tabBar.
        //这里是自定义个tabBar等于系统的tabBar的frame.
        //这里系统的tabBar并不销毁.
        
        zxmTabBar.items = self.items
        

        //1.自定义.
        //1.1 继承uiview,自定义.
        //1.2 用UIButton代替
        //1.3 切换子控制器. selectedIndex
    }
    
    
    func setupAllChildViewController()  {
        
        /**
         系统无法满足tabBar要求,解决方法.
         1.自定义.
         1.1 继承uiview,自定义.
         1.2 用UIButton代替
         1.3 切换子控制器. selectedIndex
         
         2.移除tabBar子控件..
         */
        
        //1.购彩大厅
        let hall = ZXMHallTableViewController()
        hall.view.backgroundColor  = UIColor.orange
        
        setupOneChildViewController(vc: hall, image: UIImage(named: "TabBar_LotteryHall_new")!, selImage: UIImage(named: "TabBar_LotteryHall_selected_new")!, title: "购彩大厅")
        
        //2.竞技场
        let arena = ZXMArenaViewController()
        arena.view.backgroundColor  = UIColor.darkGray
        setupOneChildViewController(vc: arena, image: UIImage(named: "TabBar_Arena_new")!, selImage: UIImage(named: "TabBar_Arena_selected_new")!, title: nil)
        
        //3.发现
        //用stroyboard加载.
        //3.1 加载StoryBoard.
        let stroyboard = UIStoryboard(name: "ZXMDiscoverTableViewController", bundle: nil)
        
        //3.2 初始化箭头指向的控制器.
        //因此需要在storybord中加入箭头所指.
        
        let discover =  stroyboard.instantiateInitialViewController()
        
        //代码加载.
        //let discover = ZXMDiscoverTableViewController()
        
        //discover?.view.backgroundColor  = UIColor.blue
        setupOneChildViewController(vc: discover!, image: UIImage(named: "TabBar_Discovery_new")!, selImage: UIImage(named: "TabBar_Discovery_selected_new")!, title: "发现")
        
        //4.开奖信息.
        let history = ZXMHistoryTableViewController()
        history.view.backgroundColor  = UIColor.red
        setupOneChildViewController(vc: history, image: UIImage(named: "TabBar_History_new")!, selImage: UIImage(named: "TabBar_History_selected_new")!, title: "开奖信息")
        
        //5.我的彩票.
        let myLottery = ZXMMyLotteryViewController()
        //myLottery.view.backgroundColor  = UIColor.purple
        setupOneChildViewController(vc: myLottery, image: UIImage(named: "TabBar_MyLottery_new")!, selImage: UIImage(named: "TabBar_MyLottery_selected_new")!, title: "我的彩票")
        
    }
    
    /// 添加单个控制器.
    ///
    /// - Parameters:
    ///   - vc: 传入的控制器
    ///   - image: 传入的正常图片.
    ///   - selImage: 出入的点击的时候的图片.
    ///   - title:出入的控制器的名字.
    func setupOneChildViewController(vc:UIViewController,image:UIImage,selImage:UIImage,title:String?)  {
    
        var nav = UINavigationController()
        //判断导航导航条不同的种类,设置不同的导航条背景色.
        
        if vc.isKind(of: ZXMArenaViewController.self) {
            //代表是竞技场的类.用默认的导航控制器.
          nav = ZXMArenaNavViewController(rootViewController: vc)
        } else {
            //其他的类用定制的导航控制器.
           nav = ZXMNavigationViewController(rootViewController: vc)
        }
        
        
        //此时已经不能用vc添加控制了.
        // self.addChildViewController(vc)
        vc.navigationItem.title = title
        self.addChildViewController(nav)
    
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selImage
        
        //添加items模型到数组.
        self.items.add(vc.tabBarItem)
    }
}

//MARK:实现ZXMTabBarDelegate的代理协议方法.
extension ZXMTabBarViewController:ZXMTabBarDelegate {
    
    func tabBar(tabBar: ZXMTabBar, index: Int) {
        //print("选中的按钮是:\(index)")
        
        //切换子控制器.
        self.selectedIndex = index
        
    }
    
}







