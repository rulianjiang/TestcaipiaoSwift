//
//  ZXMPushTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/24.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 推送界面控制器.
class ZXMPushTableViewController: ZXMBaseTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //第0组.
        self.setupGroup0()
        
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
        item.desVC = ZXMScoreTableViewController.self
        
        let item1 = ZXMSettingArrowItem(title: "比分直播")
        let item2 = ZXMSettingArrowItem(title: "中奖动画")
        let item3 = ZXMSettingArrowItem(title: "彩购大厅")
        
        let items = [item,item1,item2,item3]

        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: "推送时间", footerTitle: nil, items: items as NSArray)
        
        //将行模型数组添加到数组总数中
        self.groups.add(group)
    }
    
}



