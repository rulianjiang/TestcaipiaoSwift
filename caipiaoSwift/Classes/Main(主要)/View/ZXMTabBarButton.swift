//
//  ZXMTabBarButton.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/9.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMTabBarButton: UIButton {

    //重写选中的时候的按钮方法,让tabBar不可点击.
    override var isHighlighted: Bool {
        
        set {
        }
        
        get {
            
            return false
        }
        
    }

}
