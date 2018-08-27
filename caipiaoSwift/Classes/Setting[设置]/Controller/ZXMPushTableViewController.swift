//
//  ZXMPushTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/24.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 推送界面控制器.
class ZXMPushTableViewController: UITableViewController {
    
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
        
        //第0组.
        self.setupGroup0()
        
        //注册cell
        tableView.register(ZXMSettingTableViewCell.self, forCellReuseIdentifier: cellID)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}


// MARK: - 设置组数据.

extension ZXMPushTableViewController {
    
    func setupGroup0()  {
        
        let item = ZXMSettingArrowItem(title: "开奖推送")
        let item1 = ZXMSettingArrowItem(title: "比分直播")
        let item2 = ZXMSettingArrowItem(title: "中奖动画")
        let item3 = ZXMSettingArrowItem(title: "彩购大厅")
        
        let items = [item,item1,item2,item3]

        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: nil, items: items as NSArray)
        
        //将行模型数组添加到数组总数中
        self.groups.add(group)
    }
    
}

// MARK: - 实现数据源方法.
extension ZXMPushTableViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.groups.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let group = self.groups[section] as! ZXMSettingGroup
        return (group.items?.count)!
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ZXMSettingTableViewCell
        
        //1.取出行模型数组
        let group = self.groups[indexPath.section] as! ZXMSettingGroup
        
        //2.取出数据模型
        let item = group.items![indexPath.row] as! ZXMSettingItem
        
        //3.传递数据
        cell.item = item
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//
//        let group = self.groups[section] as! ZXMSettingGroup
//        return group.headerTitle
//
//
//    }
    
    
}

// MARK: - 实现代理源方法.
extension ZXMPushTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消选中状态.
        tableView.deselectRow(at: indexPath, animated: true)

        //1.取出组模型
        let group =  self.groups[indexPath.section] as! ZXMSettingGroup
        
        //2.取出item.
        let item = group.items![indexPath.row] as! ZXMSettingItem
        
        //做事情只能做一件.
        if item.operationBlock != nil {
            
            item.operationBlock!()
        } else {
            
            //3.判断Item类型,跳转控制
            if item.isKind(of: ZXMSettingArrowItem.self) {
                //箭头模型
                let arrowItem  = item as! ZXMSettingArrowItem
                
                //有控制器的时候才跳转,用守护语句守护一下.
                //用下面的语句直接会崩掉.
                //let vcType = arrowItem.desVC as! UIViewController.Type
                guard  let vcType = arrowItem.desVC as? UIViewController.Type else { return }
                
                let vc = vcType.init()
                vc.title = item.title
                //或者用下面的也可以!新版本不可以聊!
                //vc.navigationController?.title = "测试"
                
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            
        }
        
        
    }
}

