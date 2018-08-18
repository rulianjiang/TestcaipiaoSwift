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
    
    
    /// 重写初始化方法.
    init() {
        let layout = UICollectionViewFlowLayout()
        //item大小
        layout.itemSize = UIScreen.main.bounds.size
        
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
        return 4
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
        
        return cell;
    }


    // MARK: UICollectionViewDelegate





}
