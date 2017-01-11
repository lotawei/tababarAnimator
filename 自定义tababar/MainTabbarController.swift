//
//  MainTabbarController.swift
//  自定义tababar
//
//  Created by lotawei on 17/1/10.
//  Copyright © 2017年 lotawei. All rights reserved.
//

import UIKit

class MainTabbarController: LLAnimationTabBarController,UITabBarControllerDelegate {

    var  isfirstLoadMaintabarcontroller : Bool =   true
    override func viewDidLoad() {
        delegate = self
        buildMainTabarChildViewController()
    }
    func buildMainTabarChildViewController()  {
        
        tabBarControllerAddChildViewController(ViewController() , title: "直播视频", imagename: "bee", selectimagename: "bird", tag: 0)
        tabBarControllerAddChildViewController(ViewController() , title: "我的", imagename: "bird", selectimagename: "bee", tag: 1)
        
        
        
    }
    override  func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isfirstLoadMaintabarcontroller {
            let   containers = createViewContainers()
            createCustomIcons(containers)
            isfirstLoadMaintabarcontroller = false
        }
    }
    


}

extension   MainTabbarController{
    func tabBarControllerAddChildViewController(_ childView: UIViewController, title: String, imagename: String, selectimagename: String, tag: Int)
    {
        let vcItem = RAMAnimatedTabBarItem(title: title, image: UIImage(named: imagename), selectedImage: UIImage(named: selectimagename))
        vcItem.tag = tag
        /**
         *  设置            动画效果
         
         *
         *  @param rootViewController:childView
         *
         *  @return   有旋转  弹跳  翻转
         */
        
        vcItem.animation = RAMBounceAnimation()
        childView.tabBarItem = vcItem
        
        let navigationVC = UINavigationController(rootViewController:childView)
        addChildViewController(navigationVC)
    }
}

