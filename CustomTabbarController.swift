//
//  CustomTabbarController.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/22.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

class CustomTabbarController: TabbarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubViews()
    }

    
    func setupSubViews() -> Void {
        
        let firstVC = RecommendViewController()
        let secondVC = ProgrameViewController()
        let thirdVC = LiveViewController()
        let fourVC = MineViewController()
        /**
         *  添加tabbar的主控制器
         *
         *  @param firstVC                                 子控制器
         *  @param "first"                                 标题
         *  @param "first"                                 普通状态的图片
         *  @param "first_select"                          选中状态的图片
         *  @param TabbarHideStyle.TabbarHideWithAnimation 当push到下一界面tabbar的隐藏方式
         */
        self.setupChildVC(firstVC, title: "推荐", imageName: "btn_home_normal", selectImageName: "btn_home_selected", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
        self.setupChildVC(secondVC, title: "栏目", imageName: "btn_column_normal", selectImageName: "btn_column_selected", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
        self.setupChildVC(thirdVC, title: "直播", imageName: "btn_live_normal", selectImageName: "btn_live_selected", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
        self.setupChildVC(fourVC, title: "我的", imageName: "btn_user_normal", selectImageName: "btn_user_selected", isAnimation: TabbarHideStyle.tabbarHideWithNoAnimation)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
