//
//  ZXMSettingSwitchItem.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/23.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 开关模型
class ZXMSettingSwitchItem: ZXMSettingItem {
    
    var on:Bool = false
    
    ///开关状态.
    var isOn:Bool {
        get {
            return on
        }
        set {
            on = newValue
        }
        
    }
    

}
