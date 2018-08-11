//
//  ZXMCover.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/10.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit


class ZXMCover: UIView {
    
    /// 主窗口.
    let zxmKeyWindow = UIApplication.shared.keyWindow

  /// 弹出蒙版的类方法.
  class  func show()  {
    //1.创建蒙版
    let cover = ZXMCover()
    
    //2.添加蒙版.
    //只能添加到window上面.
    UIApplication.shared.keyWindow?.addSubview(cover)

    //3.设置尺寸.
    cover.frame = UIScreen.main.bounds
    cover.backgroundColor = UIColor.black
    cover.alpha = 0.5
    }
    
  /// 隐藏蒙版的方法.
  class  func hide()  {
    for view in (UIApplication.shared.keyWindow?.subviews)! {
        if view.isKind(of:ZXMCover.self) {
            //说明是当前类
            view.removeFromSuperview()
            break
        }
    }
    }
    

}
