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
        self.setupGroup2()
        self.setupGroup2()
        self.setupGroup2()
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
        //设置block事件.注意循环引用!
        //只要把textField添加到cell上面,键盘处理,操作系统会帮我们处理.
                item.operationBlock = { [weak self] (indexPath:IndexPath)  in
                let cell = self?.tableView.cellForRow(at: indexPath)
                let textField = UITextField()
                //self?.view.addSubview(textField)
                cell?.addSubview(textField)
            
            //成为第一响应者
            textField.becomeFirstResponder()
            
        }
        let group = ZXMSettingGroup.groupWithHeaderAndFooterAndItems(headerTitle: nil, footerTitle: nil, items: [item] as NSArray)
        self.groups.add(group)
        
    }
}
