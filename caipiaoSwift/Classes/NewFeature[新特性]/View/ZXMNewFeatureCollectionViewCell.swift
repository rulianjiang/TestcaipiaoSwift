//
//  ZXMNewFeatureCollectionViewCell.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/18.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

/// 新特性cell
class ZXMNewFeatureCollectionViewCell: UICollectionViewCell {
    
    /// 立即体验按钮.
    lazy var startBtn:UIButton = {
        let startBtn = UIButton()
        startBtn.setBackgroundImage(UIImage(named: "guideStart"), for: UIControlState.normal)
        //注意startBtn.sizeToFit()放的位置.
        startBtn.sizeToFit()
        //startBtn.frame  = CGRect(x: 100, y: 100, width: 100, height: 100)
        startBtn.center = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.9)
        self.contentView.addSubview(startBtn)
        //监听方法
        startBtn.addTarget(self, action: #selector(buttonOnClick(button:)), for: UIControlEvents.touchUpInside)
        return startBtn
    }()
    
    /// 懒加载背景图片ImageView.
    lazy var bgImageView:UIImageView = {
        let bgImageView = UIImageView(frame: self.bounds)
        self.contentView.addSubview(bgImageView)
        return bgImageView
    }()
    
    /// 背景图片.
    var image:UIImage? {
        didSet {
            self.bgImageView.image = image
        }
        
    }
    
    

    /// 设置立体体验的方法.
    ///
    /// - Parameters:
    ///   - indexPath: indexPath.
    ///   - count: 数目.
    func setIndexPath(indexPath:IndexPath,count:Int)  {
            //最后一个cell.添加立即体验按钮.
            if (indexPath.item == count - 1) {
                //最后一个cell
                self.startBtn.isHidden = false
            } else {
                //不是最后一个cell
                //隐藏立即体验按钮.
                self.startBtn.isHidden = true
        
            }
    }
    
   /// 点击立即体验监听按钮.
   ///
   /// - Parameter button: 传入的button.
   @objc func buttonOnClick(button:UIButton) {
    //切换界面
    //方式:1.push(navgationcontroller导航控制器) 2.tabBar 3.modal(控件不行,必须要控制器).
    //在cell中不能modal,通过代理,让控制器modal.
    //谁Modal出来的控制器,就会强引用这个控制器,因此这个新特性控制器还在.但是这个只用一次,因此没有必要再占用内存.
    //因此不能用Modal
    //想要新特性控制器销毁.
    //切换窗口的根控制器.
    let tabBarVC = ZXMTabBarViewController()
    UIApplication.shared.keyWindow?.rootViewController = tabBarVC
    
    }
}
