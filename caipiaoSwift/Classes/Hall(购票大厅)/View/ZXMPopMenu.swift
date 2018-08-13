//
//  ZXMPopMenu.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/10.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

typealias MyBlock = ()->()

/// ZXMPopMenu协议
protocol ZXMPopMenuDelegate {
    
    /// ZXMPopMenu协议方法.
    ///
    /// - Parameter popMenu: 传入的popMenu
    func popMenuDidCloseBtn(popMenu: ZXMPopMenu)
}

class ZXMPopMenu: UIView {
    
    ///ZXMPopMenu代理属性.
    var delegate:ZXMPopMenuDelegate?
    
  /// 添加PopMenu的类方法.
  ///
  /// - Parameter center: 出入的center.
  class func showInCenter(center:CGPoint) -> ZXMPopMenu {
        let popMenu = Bundle.main.loadNibNamed("ZXMPopMenu", owner: nil, options: nil)?.first as! ZXMPopMenu
        popMenu.center = center
    
        //超过父控件部分裁剪
        popMenu.layer.masksToBounds = true
        popMenu.clipsToBounds = true
        
        /// 主窗口.
        //这里移动到最上面不可以.
        UIApplication.shared.keyWindow?.addSubview(popMenu)
    
         return popMenu
    }

  
    @IBAction func close(_ sender: UIButton) {
        //点击关闭按钮.popMenu慢慢缩小.边平移,缩小到一定的尺寸.移除蒙版.
//        UIView.animate(withDuration: 0.5) {
//            //这个方案有问题.
//            //self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//            //self.setNeedsDisplay()
//
//            //解决方案.
//            //缩小方法.
//            self.center = CGPoint(x: 40, y: 40)//随意的点.
//            self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//        }
        
        //通知外界,点击了关闭按钮.
        //判断代理是否执行该方法.
        //Swift协议协议OC的写法不同
        delegate?.popMenuDidCloseBtn(popMenu: self)
        
    }
   
    
    
    
//    func hideInCenter(center:CGPoint,comletion:MyBlock) {
//        //点击关闭按钮.popMenu慢慢缩小.边平移,缩小到一定的尺寸.移除蒙版.
//
//        UIView.animate(withDuration: 0.5, animations: {
//            //这个方案有问题.
//            //self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
//            //self.setNeedsDisplay()
//
//            //解决方案.
//            //缩小方法.
//            self.center = CGPoint(x: 40, y: 40)//随意的点.
//            self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
//
//        }) { (finished) in
//            //动画完成以后.
//            //1.移除自己.
//            self.removeFromSuperview()
//            //2.移除蒙版.
//            //ZXMCover.hide()
//
//        }
//
//
//    }
    
    func hideInCenter(center:CGPoint,comletion:@escaping MyBlock)  {
                //点击关闭按钮.popMenu慢慢缩小.边平移,缩小到一定的尺寸.移除蒙版.
                UIView.animate(withDuration: 0.5, animations: {
                    //这个方案有问题.
                    //self.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                    //self.setNeedsDisplay()
        
                    //解决方案.
                    //缩小方法.
                    self.center = CGPoint(x: 40, y: 40)//随意的点.
                    self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        
                }) { (finished) in
                    //动画完成以后.
                    //1.移除自己.
                    self.removeFromSuperview()
                    
                    //2.移除蒙版.
                    comletion()
                
                }
    }
    
    
    
    
    
    
    
}
