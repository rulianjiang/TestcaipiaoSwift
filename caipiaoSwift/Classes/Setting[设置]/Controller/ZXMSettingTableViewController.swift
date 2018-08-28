//
//  ZXMSettingTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/21.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMSettingTableViewController: ZXMBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置头部标题
        self.navigationItem.title = "设置"
        
        //添加分组.
        self.setupGroup0()
        self.setupGroup1()
        self.setupGroup2()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        //print("循环引用解除!!!")
    }

}

// MARK: - 设置组数据.

extension ZXMSettingTableViewController {
    
    func setupGroup0()  {
        //注意,第一个items1可以不用NSMutableArray(),目的是方便查看.
        
        //第0组.
        let items1 = NSMutableArray()
        let item =  ZXMSettingArrowItem(icon: UIImage(named: "RedeemCode")!, title: "使用兑换码")
        item.desVC = ZXMPushTableViewController.self
        items1.add(item)
        
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: "优惠券相关", footerTitle: nil, items: items1)
        
        //将行模型数组添加到数组总数中
        self.groups.add(group)
    }
    
    func setupGroup1()  {
        //第1组.

        let item11 = ZXMSettingArrowItem(icon: UIImage(named: "MorePush")!, title: "推送提醒")
        item11.desVC = ZXMPushTableViewController.self
       
        
        ////传递参数.[闭包直接可以传递参数.]
        //闭包循环引用的解决.!
        //[weak self] 和[unowned self] 的区别是 [weak self]处理的时候是一个可选类型。
//        item11.operationBlock = { [weak self] in
//            let vc = UIViewController()
//            vc.title = "周兴明测试...."
//            vc.view.backgroundColor = UIColor.purple
//            self?.navigationController?.pushViewController(vc, animated: true)
//
//        }

        let item12 = ZXMSettingSwitchItem(icon: UIImage(named: "more_homeshake")!, title: "使用摇一摇选机")
        item12.on = true
        

        let item13 =  ZXMSettingSwitchItem(icon: UIImage(named: "sound_Effect")!, title: "声音效果")
        item13.on = false
       

        let item14 =  ZXMSettingSwitchItem(icon: UIImage(named: "More_LotteryRecommend")!, title: "购彩小助手")
        let items2 = [item11,item12,item13,item14];

        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: "提醒相关", footerTitle: nil, items: items2 as NSArray)

        //将行模型数组添加到数组总数中.
         self.groups.add(group)
    }
    
    func setupGroup2()  {
        //第2组.
        let item21 = ZXMSettingArrowItem(icon: UIImage(named: "MoreUpdate")!, title: "检查新版本")
        
        //闭包循环引用的解决.!
        //[weak self] 和[unowned self] 的区别是 [weak self]处理的时候是一个可选类型。
        item21.operationBlock = { [weak self] (indexPath:IndexPath) in
            self?.setupAler()
            //print("检查新版本啊...!!!!")
        }
        
        
        let item22 =  ZXMSettingArrowItem(icon: UIImage(named: "MoreShare")!, title: "分享")
        let item23 =  ZXMSettingArrowItem(icon: UIImage(named: "MoreNetease")!, title: "产品推荐")
        let item24 =  ZXMSettingArrowItem(icon: UIImage(named: "MoreAbout")!, title: "关于")
        

        let items3 = [item21,item22,item23,item24];
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: "版本相关", footerTitle: nil, items: items3 as NSArray)
        
        //将行模型数组添加到数组总数中.
        self.groups.add(group)
   }

}

//MARK:alter弹窗方法.

extension ZXMSettingTableViewController {
   
    /// 弹窗方法.
    func setupAler()  {
        let alertController = UIAlertController(title: "版本提示", message: "暂无版本", preferredStyle: .actionSheet)
        
        // let yesAction = UIAlertAction(title: "确定", style: .default, handler: nil) //不执行任何操作.
        let yesAction = UIAlertAction(title: "确定", style: .default, handler: { (nil) in
            //让程序再回到第0个问题.

        })
        let hahaAction = UIAlertAction(title: "哈哈", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "★取消★", style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(hahaAction)
        alertController.addAction(cancelAction)
        
        //以动画方式呈现.
        self.present(alertController, animated: true, completion: nil)
    }
}





