//
//  ZXMAwardTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/28.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 开奖推送
class ZXMAwardTableViewController: ZXMBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.setupGroup0()
        
        /// 可重用cell.
       // let cellID = "cellID"
        
        //注册cell
        //tableView.register(ZXMSettingTableViewCell.self, forCellReuseIdentifier: cellID)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupGroup0() {
        let item = ZXMSettingSwitchItem(title: "双色球")
        item.subTitle = "每天开奖"
        let item1 = ZXMSettingSwitchItem(title: "双色球")
        item1.subTitle = "每天开奖"
        let item2 = ZXMSettingSwitchItem(title: "双色球")
        item2.subTitle = "每天开奖"
        let item3 = ZXMSettingSwitchItem(title: "双色球")
        item3.subTitle = "每天开奖"
        let item4 = ZXMSettingSwitchItem(title: "双色球")
        item4.subTitle = "每天开奖"
        
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: nil, items: [item,item1,item2,item3,item4] as NSArray)
        
        self.groups.add(group)
        
    }


}

extension ZXMAwardTableViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = ZXMSettingTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellID)
    
        
        //1.取出行模型数组
        let group = self.groups[indexPath.section] as! ZXMSettingGroup
        
        //2.取出数据模型
        let item = group.items![indexPath.row] as! ZXMSettingItem
        
        //3.传递数据
        cell.item = item
        
        return cell
    }
}



