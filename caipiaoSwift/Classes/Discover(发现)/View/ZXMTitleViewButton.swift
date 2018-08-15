//
//  ZXMTitleViewButton.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/15.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 自定义UIButton.
class ZXMTitleViewButton: UIButton {

    //调整子控件的位置.
    
    //调整IamgeView的位置.
//    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
//
//    }
    
    
    //调整label的位置.
//    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
//        <#code#>
//    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //这里会调用2次
        //print("调整button按钮位置")
        
        if (self.imageView?.frame.origin.x)! < (self.titleLabel?.frame.origin.x)!  {
            //说明是此一次.
            //调整子控件的位置.
            //label
            self.titleLabel?.frame.origin.x = (self.imageView?.frame.origin.x)!
            
            //imageView.
            self.imageView?.frame.origin.x = (self.titleLabel?.frame.maxX)!
        }
        
        
    }


    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)
        self.sizeToFit()
        
    }
    
    override func setImage(_ image: UIImage?, for state: UIControlState) {
        super.setImage(image, for: state)
        self.sizeToFit()
    }
}
