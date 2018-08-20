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
    
}
