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


class ZXMNavigationViewController: UINavigationController,UINavigationControllerDelegate,UIGestureRecognizerDelegate {
    
    /// 手势代理
    var popGesture:UIGestureRecognizerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //想统一设置返回按钮,滑动移除控制.
        //清空手势代理就嫩实现滑动.
        //self.interactivePopGestureRecognizer?.delegate = nil
        
        //记录手势代理
        self.popGesture = self.interactivePopGestureRecognizer?.delegate
        
        //当是根控制的时候,还原代理.如果是非根控制器,清空代理.
        self.delegate = self
        
        //全屏滑动移除控制器
        //1.新先修改系统的手势.系统没有提供属性.无解.
        
        //2.只能自己添加手势.
//        let pan = UIPanGestureRecognizer(target: self, action: nil)
//        self.view.addGestureRecognizer(pan)
        
        //print("全局手势:\(self.interactivePopGestureRecognizer)")
        //UIScreenEdgePanGestureRecognizer: 0x7fa71641caf0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fa71641a2d0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fa71641c9b0
        
        //缺Target 系统的私有属性.
        //KVC [get valueForKeyPath:""];
        //不知道Target真实类型
        //oc runtime机制只能动态获取当前类的成员属性.不能获取其子类或者父类的属性.
        //__unsafe_unretained cls 要获取哪一个类的成员属性.
        
        //OC的方法.
        //unsigned int * _Nullable outCount 要获取Class下面的所有成员属性的个数.
//        unsigned int outCount = 0;
//        Ivar *ivars = class_copyIvarList([UIGestureRecognizer class], &outCount);
//
//        for (int i = 0; i < outCount; i++) {
//            NSString *name = @(ivar_getName(ivars[i]));
//            NSLog(@"%@",name);
//        }
        
        //利用运行时动态拿到系统的侧滑手势 action + target  手动创建一个全屏的pan手势，响应事件用系统的
        //拿到interactivePopGestureRecognizer这个对象里面全部的属性
        //        var count:UInt32 = 0
        //        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
        //        for i in 0..<count {
        //             //拿到ivar指针
        //            let nameP = ivar_getName(ivars[Int(i)])
        //            //根据指针找到对应的属性的字符串
        //            let name = String(cString: nameP!)
        //            print(name)
        //        }
        guard  let targets = interactivePopGestureRecognizer?.value(forKey: "_targets") as?[AnyObject] else {
            return
        }
        //拿到 action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7ff515c0dc80>
        
        let dict = targets[0]
        //拿到action
        let target = dict.value(forKey: "target") as Any
        //通过字典无法拿到action，这里通过Selector方法包装action
        let action = Selector(("handleNavigationTransition:"))
        
        //拿到target action 创建pan手势并添加到全屏view上
        let gesture = UIPanGestureRecognizer(target: target, action: action)
        view.addGestureRecognizer(gesture)
        
        
    }
    
   
    
    
    //重写系统的方法.设置返回按钮.
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count != 0 {
            self.navigationController?.hidesBottomBarWhenPushed = true
        }
        
        
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
    
    //MARK: 实现代理方法.
    
    //当控制器显示完毕的时候调用.
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        //print("控制器为:\(viewController)")
        
        //判断根控制器.
        //先进后出,所以第0个就是根控制器.
        if self.viewControllers[0] == viewController {
            //根控制器还原代理
            self.popGesture = self.interactivePopGestureRecognizer?.delegate
        } else {
            //非根控制器,清空代理
            self.interactivePopGestureRecognizer?.delegate = nil
        }
    }
}


