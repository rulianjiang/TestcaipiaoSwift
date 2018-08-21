//
//  ZXMSettingTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/21.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMSettingTableViewController: UITableViewController {
    
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
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return 4
        }
    
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        
        //搭建界面.
        if indexPath.section == 0 && indexPath.row == 0 {
            //第0组
            cell.imageView?.image = UIImage(named: "RedeemCode")
            cell.textLabel?.text = "使用兑换码"
        } else  if (indexPath.section == 1) {
            //第一组.
            if indexPath.row == 0 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "推送提醒"
            } else if indexPath.row == 1 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "使用摇一摇"
            }else if indexPath.row == 2 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "声音效果"
            } else if indexPath.row == 3 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "购彩小助手"
            }
            
        } else  if (indexPath.section == 2) {
            //第二组.
            if indexPath.row == 0 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "检查新版本"
            } else if indexPath.row == 1 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "分享"
            }else if indexPath.row == 2 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "产品推荐"
            } else if indexPath.row == 3 {
                cell.imageView?.image = UIImage(named: "RedeemCode")
                cell.textLabel?.text = "关于"
            }
        }
        
        
        
        
        
        
        
        return cell
    }
    
    
    
    
    
}
