//
//  ZXMTabBar.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// tabBar代理协议.
protocol ZXMTabBarDelegate {
    
    /// tabBar协议方法.
    ///
    /// - Parameters:
    ///   - tabBar: 出入的tabBar.
    ///   - index: 出入的索引(点击的的按钮索引-点击了第几个图标.)
    func tabBar(tabBar:ZXMTabBar,index:Int)
    
}

class ZXMTabBar: UIView {
    
    /// tabBar代理
    var delegate:ZXMTabBarDelegate?
    
    //var count = 0
    
    /// 选中的按钮.
    lazy var selButton:ZXMTabBarButton = {
        let selButton = ZXMTabBarButton()
        return selButton
    }()
    
    
    
    /// 模型数组.
    var items = NSArray() {
        didSet {
            
            //添加子控件
            for i in 0..<items.count {
                let button = ZXMTabBarButton()
                
                let tabBarItem:UITabBarItem = items[i] as! UITabBarItem
                
                //这里默认显示image的尺寸,需要改为背景.
                //button.setImage(tabBarItem.image, for: UIControlState.normal)
                //button.setImage(tabBarItem.selectedImage, for: UIControlState.selected)
                button.setBackgroundImage(tabBarItem.image, for: .normal)
                button.setBackgroundImage(tabBarItem.selectedImage, for: .selected)
                
                self.addSubview(button)
                
                //添加button的监听事件.
                //这里不能用UIControlEventTouchUpInside,因为前面已经取消的了点击的事件.
                button.addTarget(self, action: #selector(buttonClick(button:)), for: UIControlEvents.touchDown)
            }
            
        }
    }
    
    
    //MARK: 按钮监听事件
    
    /// 按钮点击方法
    ///
    /// - Parameter button: 点击的按钮
   @objc func buttonClick(button:ZXMTabBarButton)  {
    
    //1.取消上一次选中
    self.selButton.isSelected = false
    
    //2.选中当前点击的按钮.
    button.isSelected = true
    
    //3.记录当前选中的按钮.
    self.selButton = button
    
    //4.通过外界,切换子控制器.
    //判断代理是否是先该方法.
    //与OC的写法不同
    delegate?.tabBar(tabBar: self, index: button.tag)
    
    }
    
    
    //调整子控件.
    override func layoutSubviews() {
        //调整子控件的frame.
        
        var buttonX:CGFloat = 0
        let buttonY:CGFloat = 0
        let buttonW:CGFloat = self.frame.size.width / CGFloat(self.subviews.count)
        let buttonH:CGFloat = self.frame.size.height
        
        var i = 0
        
        for button in self.subviews {
            
            buttonX = buttonW * CGFloat(i)
            
            //给button的tag赋值,方便代理使用.
            button.tag = i
            
            //判断是否是第0个,如果是第0个,设置为选中状态
            if i == 0 {
                
                self.buttonClick(button: button as! ZXMTabBarButton)
            }
    
            (button as! ZXMTabBarButton).frame = CGRect(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            
            i += 1
        }
    }

    

}













