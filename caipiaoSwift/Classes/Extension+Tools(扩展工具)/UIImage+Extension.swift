//
//  UIImage+Extension.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/10.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

extension UIImage {
  
  /// 返回一张不要渲染的图片.
  ///
  /// - Parameter name: 图片的名字
  /// - Returns: 返回的图片.
  class func imageWithRenderingModeOriginalName(name: String) -> UIImage {
      let image = UIImage(named: name)
      return (image?.withRenderingMode(UIImageRenderingMode.alwaysOriginal))!
    }
}
