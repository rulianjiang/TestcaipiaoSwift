//
//  ZXMSettingTableViewCell.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/24.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 设置界面自定义cell.
class ZXMSettingTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var item:ZXMSettingItem? {
        didSet {
            //设置数据
            self.imageView?.image = item?.icon
            self.textLabel?.text = item?.title
            self.detailTextLabel?.text = item?.subTitle
            
            
            self.setupRightView()
        }
        
    }
    
    
    
    /// 设置右侧视图
    func setupRightView() {
        //设置左侧视图.
        if (self.item?.isKind(of: ZXMSettingArrowItem.self))! {
            //代表是箭头的类.
            //右侧视图是箭头
            self.accessoryView = UIImageView(image: UIImage(named: "arrow_right"))
        }else if (self.item?.isKind(of: ZXMSettingSwitchItem.self))! {
            //右侧是视图开关
            //需要强制类型转换
            let swItem = item as! ZXMSettingSwitchItem
            let sw = UISwitch()
            self.accessoryView = sw
            sw.isOn = swItem.isOn
        }
    }
    
}
