//
//  ZXMHallTableViewController.swift
//  caipiaoSwift
//
//  Created by shine on 2018/8/8.
//  Copyright © 2018年 周兴明. All rights reserved.
//

import UIKit

class ZXMHallTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //1.设置导航栏左侧按钮.
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.imageWithRenderingModeOriginalName(name: "CS50_activity_image") , style: .plain, target: self, action: #selector(leftButtonOnClick))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /// 左侧按钮点击事件
   @objc func leftButtonOnClick()  {
    //1.弹出蒙版.占据整个屏幕,不允许用户交互.
    ZXMCover.show()
    
    
    //2.添加popMenu.
    //添加到主窗口上面.
    let popMenu = ZXMPopMenu.showInCenter(center: self.view.center)
    popMenu.delegate = self
    
  
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

// MARK: - 实现ZXMPopMenuDelegate协议方法.

extension ZXMHallTableViewController:ZXMPopMenuDelegate {
   
    func popMenuDidCloseBtn(popMenu: ZXMPopMenu) {
        // print("协议方法被执行..")
        
        //1.隐藏popMenu. () - ()
        popMenu.hideInCenter(center: CGPoint(x: 44, y: 44), comletion:
            { () -> ()  in
                //闭包代码.
                //2.移除蒙版.
                ZXMCover.hide()
                //当动画执行完成以后,移除蒙版.
                //block可以保持一端代码.在需要的时候调用
        })
        
        
    }
}
