//
//  ZXMScoreTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/27.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 比分直播
class ZXMScoreTableViewController: ZXMBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupGroup0()
        self.setupGroup1()
        self.setupGroup2()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK:- 设置分组数据.
extension ZXMScoreTableViewController {
    func setupGroup0()  {
        let item = ZXMSettingSwitchItem(title: "关注比赛")
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: "请关注比赛", items: [item] as NSArray)
        self.groups.add(group)
        
        
    }
    
    func setupGroup1()  {
        let item = ZXMSettingItem(title: "起始时间")
        item.subTitle = "10:00"
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: nil, items: [item] as NSArray)
        self.groups.add(group)
        
        
    }
    
    func setupGroup2()  {
        
        let item = ZXMSettingItem(title: "结束时间")
        item.subTitle = "23:10"
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: nil, items: [item] as NSArray)
        self.groups.add(group)
        
    }
}
