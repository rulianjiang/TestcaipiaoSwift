//
//  ZXMSettingTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/21.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMSettingTableViewController: UITableViewController {
    
    /// 懒加载行模型数组.
    lazy var items = { () -> NSMutableArray in 
        let items = NSMutableArray()
        return items
    }()
    
    /// 懒加载数组总数.
    lazy var groups = { () -> NSMutableArray in
        let groups = NSMutableArray()
        return groups
    }()
    
    //重写init方法,在我的彩票界面不用再设置界面的布局样式.
    init() {
    super.init(style: .grouped)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 可重用cell.
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //注意,第一个items1可以不用NSMutableArray(),目的是方便查看.
        
        //第0组.
        let items1 = NSMutableArray()
        let item =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "使用兑换码")
        items1.add(item)
        //将行模型数组添加到数组总数中.
        self.groups.add(items1)
        
        //第1组.
        let item11 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        self.items.add(item11)
        
        let item12 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        self.items.add(item12)
        
        let item13 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        self.items.add(item13)
        
        let item14 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        
        let items2 = [item11,item12,item13,item14];
        //self.items.add(items2)
        
        //将行模型数组添加到数组总数中.
        self.groups.add(items2)
        
        //第2组.
        let item21 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "检查新版本")
        self.items.add(item21)
        
        let item22 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        self.items.add(item22)
        
        let item23 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        self.items.add(item23)
        
        let item24 =  ZXMSettingItem.itemWithIcon(icon: UIImage(named: "RedeemCode")!, title: "推送提醒")
        //self.items.add(item24)
        
        let items3 = [item21,item22,item23,item24];
        
        //将行模型数组添加到数组总数中.
        self.groups.add(items3)
        
        
        //注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ZXMSettingTableViewController {
    
    // MARK: - 实现数据源方法.
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.groups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return 1
//        } else {
//            return 4
//        }
        
        //1.取出行模型数组
        let items:NSArray = self.groups[section] as! NSArray
        
        return items.count
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        //1.取出行模型数组
        let items:NSArray = self.groups[indexPath.section] as! NSArray
        
        //取出数据模型
        let item = items[indexPath.row] as! ZXMSettingItem
        
        //设置数据
        cell.imageView?.image = item.icon
        cell.textLabel?.text = item.title
        
        //搭建界面.
//        if indexPath.section == 0 && indexPath.row == 0 {
//            //第0组
//            cell.imageView?.image = UIImage(named: "RedeemCode")
//            cell.textLabel?.text = "使用兑换码"
//        } else  if (indexPath.section == 1) {
//            //第一组.
//            if indexPath.row == 0 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "推送提醒"
//            } else if indexPath.row == 1 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "使用摇一摇"
//            }else if indexPath.row == 2 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "声音效果"
//            } else if indexPath.row == 3 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "购彩小助手"
//            }
//            
//        } else  if (indexPath.section == 2) {
//            //第二组.
//            if indexPath.row == 0 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "检查新版本"
//            } else if indexPath.row == 1 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "分享"
//            }else if indexPath.row == 2 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "产品推荐"
//            } else if indexPath.row == 3 {
//                cell.imageView?.image = UIImage(named: "RedeemCode")
//                cell.textLabel?.text = "关于"
//            }
//        }
        
        
        
        
        
        
        
        return cell
    }
    
    
    
    
    
}
