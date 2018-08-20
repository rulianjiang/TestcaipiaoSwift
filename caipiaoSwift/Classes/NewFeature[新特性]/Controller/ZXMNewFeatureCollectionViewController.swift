//
//  ZXMNewFeatureCollectionViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/17.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ZXMNewFeatureCollectionViewController: UICollectionViewController {
    
    /// 总的页数.
    let pageCount:Int = 4
    
    /// 上一次的偏移量.
    var lastOffsetX:CGFloat = 0
    
    /// 球的偏移量.
    lazy var guide:UIImageView = {
        let guide = UIImageView()
        return guide
    }()
    
    /// 重写初始化方法.
    init() {
        let layout = UICollectionViewFlowLayout()
        //item大小
        layout.itemSize = UIScreen.main.bounds.size
        
        //设置间距
        layout.minimumLineSpacing = 0;
        
        //修改滚动方向
        layout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.view != self.collectionView
        self.view.backgroundColor = UIColor.green
        self.collectionView?.backgroundColor = UIColor.green
        
        //注册cell
        collectionView?.register(ZXMNewFeatureCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //设置分页
        self.collectionView?.isPagingEnabled = true
        
        //禁止弹簧效果
        self.collectionView?.bounces = false
        
        //隐藏滚动条
        self.collectionView?.showsHorizontalScrollIndicator = false
        
        setupChildImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: 数据源方法.
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ZXMNewFeatureCollectionViewCell
        cell.backgroundColor = UIColor.purple
        
        //cell创建出来就有imageView
        //创建image
        //拼接图片名字.
        let name = String(format: "guide\(indexPath.item + 1)Background")
        let image = UIImage(named: name)
        
        //接收图片
        cell.image = image!
        
        //    //最后一个cell.添加立即体验按钮.
        //    if (indexPath.item == pageCount - 1) {
        //        //最后一个cell
        //    } else {
        //        //不是最后一个cell
        //        //隐藏立即体验按钮.
        //
        //    }
        
      cell.setIndexPath(indexPath: indexPath, count: pageCount)

        return cell;
    }


}

extension ZXMNewFeatureCollectionViewController {
    
    /// 设置图片视图
    func setupChildImageView()  {
        
        //1.添加线
        let guideLine = UIImageView(image: UIImage(named: "guideLine"))
        self.collectionView?.addSubview(guideLine)
        guideLine.frame.origin.x -= 150

        
        //2.添加球.
        let guide = UIImageView(image: UIImage(named: "guide1"))
        self.collectionView?.addSubview(guide)
        guide.frame.origin.x += 50
        self.guide = guide
        
        //3.添加大标题
        let guideLargeText = UIImageView(image: UIImage(named: "guideLargeText1"))
        self.collectionView?.addSubview(guideLargeText)
        guideLargeText.center = CGPoint(x: self.view.frame.size.width * 0.5, y: self.view.frame.size.height * 0.7)

        //4.添加小标题.
        let guideSmallText = UIImageView(image: UIImage(named: "guideSmallText1"))
        self.collectionView?.addSubview(guideSmallText)
        guideSmallText.center = CGPoint(x: self.view.frame.size.width * 0.5, y: self.view.frame.size.height * 0.8)

    }
}

extension ZXMNewFeatureCollectionViewController {
    
    //减速的时候调用.
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print(self.collectionView?.contentOffset.x)
        let offsetX = collectionView?.contentOffset.x
        
        
        
        //偏移子控件.
        let del = offsetX!  - self.lastOffsetX
        
        //切换图片
        let i = abs(offsetX!/del) + 1
        let name = "guide\(i)"
        self.guide.image = UIImage(named: name)
        
        
        self.lastOffsetX = offsetX!
        //print("单次偏移量:\(del)")
        
        //设置子控件的偏移量
        //先偏移2倍,然后在减少成1倍.
        self.guide.frame.origin.x += del * 2
        
        UIView.animate(withDuration: 0.5) {
            self.guide.frame.origin.x -= del;
        }
        
        
        
    }
}










