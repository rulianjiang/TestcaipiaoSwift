//
//  ZXMBaseTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/27.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 表格控制器基类.
class ZXMBaseTableViewController: UITableViewController {

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
        
        //注册cell
        tableView.register(ZXMSettingTableViewCell.self, forCellReuseIdentifier: cellID)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: - 实现数据源方法.
extension ZXMBaseTableViewController {
    
    
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
    

}

// MARK: - 实现代理源方法.
extension ZXMBaseTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //取消选中状态.
        tableView.deselectRow(at: indexPath, animated: true)
        
        //1.取出组模型
        let group =  self.groups[indexPath.section] as! ZXMSettingGroup
        
        //2.取出item.
        let item = group.items![indexPath.row] as! ZXMSettingItem
        
        //做事情只能做一件.
        if item.operationBlock != nil {
            
            item.operationBlock!(indexPath)
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

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        let group = self.groups[section] as! ZXMSettingGroup
        return group.headerTitle
        
        
    }

    //开始滑动的时候调用.
    override func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        //处理键盘
        self.view.endEditing(true)

    }
    
}

