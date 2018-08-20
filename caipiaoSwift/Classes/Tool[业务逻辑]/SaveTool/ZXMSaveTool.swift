//
//  ZXMSaveTool.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/20.
//  Copyright © 2018年 周兴明. All rights reserved.
//  存贮工具类.

import UIKit

/// 保存工具类
class ZXMSaveTool: NSObject {
    
  /// 取出存储的版本号.
  ///
  /// - Parameter defaultName: 要取出的value
  /// - Returns: 返回结果.
  class func object(forKey defaultName: String) -> Any? {
      return  UserDefaults.standard.object(forKey: defaultName)
    }
    
    
    /// 存储当前版本号
    class  func set(_ value: Any?, forKey defaultName: String) {
        //屏蔽一下外界的行为,为nil的时候.
        //如果传入为nil,就不存储.
        guard let value = value else {return}
        UserDefaults.standard.set(value, forKey: defaultName)
        //强制存储
        UserDefaults.standard.synchronize()
    }
    

}
