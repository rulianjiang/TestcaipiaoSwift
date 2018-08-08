//
//  ZXMTabBarViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.setupAllChildViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ZXMTabBarViewController {
    
    
    func setupAllChildViewController()  {
        
        //1.购彩大厅
        let hall = ZXMHallTableViewController()
        hall.view.backgroundColor  = UIColor.orange
        
        setupOneChildViewController(vc: hall, image: UIImage(named: "TabBar_LotteryHall_new")!, selImage: UIImage(named: "TabBar_LotteryHall_selected_new")!)
        
        //2.竞技场
        let arena = ZXMArenaViewController()
        arena.view.backgroundColor  = UIColor.white
        setupOneChildViewController(vc: arena, image: UIImage(named: "TabBar_Arena_new")!, selImage: UIImage(named: "TabBar_Arena_selected_new")!)
        
        //3.发现
        let discover = ZXMDiscoverTableViewController()
        discover.view.backgroundColor  = UIColor.blue
        setupOneChildViewController(vc: discover, image: UIImage(named: "TabBar_Discovery_new")!, selImage: UIImage(named: "TabBar_Discovery_selected_new")!)
        
        //4.开奖信息.
        let history = ZXMHistoryTableViewController()
        history.view.backgroundColor  = UIColor.red
        setupOneChildViewController(vc: history, image: UIImage(named: "TabBar_History_new")!, selImage: UIImage(named: "TabBar_History_selected_new")!)
        
        //5.我的彩票.
        let myLottery = ZXMMyLotteryViewController()
        myLottery.view.backgroundColor  = UIColor.purple
        setupOneChildViewController(vc: myLottery, image: UIImage(named: "TabBar_MyLottery_new")!, selImage: UIImage(named: "TabBar_MyLottery_selected_new")!)
        
    }
    
    /// 添加单个控制器.
    ///
    /// - Parameters:
    ///   - vc: 传入的控制器
    ///   - image: 传入的正常图片.
    ///   - selImage: 出入的点击的时候的图片.
    func setupOneChildViewController(vc:UIViewController,image:UIImage,selImage:UIImage)  {
        
        self.addChildViewController(vc)
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selImage
    }
}







