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
    
}
