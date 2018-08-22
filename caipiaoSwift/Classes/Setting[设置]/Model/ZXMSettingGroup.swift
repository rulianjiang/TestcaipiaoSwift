//
//  ZXMSettingGroup.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/22.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 组模型.
class ZXMSettingGroup: NSObject {
    
    /// 头部标题
    var headerTitle:String?
    
    /// 尾部标题.
    var footerTitle:String?
    
    /// 行模型数组
    var items:NSArray?
    
  
  /// 组模型方法.
  class  func groupWithHeaderAndFooterAndItems(headerTitle:String?,footerTitle:String?,items:NSArray) -> ZXMSettingGroup {
        let group = ZXMSettingGroup()
        group.headerTitle = headerTitle
        group.footerTitle = footerTitle
        group.items = items
        return group
    }
    
    

}
