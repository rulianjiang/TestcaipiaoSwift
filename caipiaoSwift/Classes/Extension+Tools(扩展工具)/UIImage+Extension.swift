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
    
    
    

   /// 出入一张图片以及一个按钮,返回拉升后的图片.
   ///
   /// - Parameters:
   ///   - image: 出入原始图片
   ///   - button: 按钮
   /// - Returns: 拉升后图片
  class func imageWithStretImage(image:UIImage,button:UIButton) -> UIImage {
        guard let image = button.currentBackgroundImage else {return UIImage()}
        let newImage = image.stretchableImage(withLeftCapWidth: Int(image.size.width * 0.5), topCapHeight: Int(image.size.height * 0.5))
        return newImage
    }
}


