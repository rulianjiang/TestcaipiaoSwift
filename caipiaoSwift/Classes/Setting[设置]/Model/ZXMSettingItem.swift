//
//  ZXMSettingItem.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/22.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 右边按钮枚举类型.
///
/// - NO: 没有
/// - Arrow: 箭头
/// - Switch: 滑块.
//enum ZXMSettingItemRightViewState {
//    case NO
//    case Arrow
//    case Switch
//}

//定义一个闭包.
typealias operationBlock = ()->();

/// 设置界面的模型.
class ZXMSettingItem: NSObject {
    
    /// 图片.
    var icon:UIImage?
    
    /// 标题
    var title:String?
    
    /// 点击这一行要做的事情:Block封装.
    //var  operationBlock: (() -> ())?
    //或者这样来
    var operationBlock:operationBlock?
    
     /// 创建Item的构造方法
     ///
     /// - Parameters:
     ///   - icon: 传入的图片.
     ///   - title: 返回界面模型Item.
     init(icon: UIImage?, title: String?) {
            self.icon = icon
            self.title = title
        }
    
    init(title: String?) {
        self.title = title
    }
    
 
    
    
    
 
}
