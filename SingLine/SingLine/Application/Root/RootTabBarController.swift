//
//  RootTabBarController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/25/22.
//

import UIKit

class RootTabBarController: UITabBarController {
    //底部高度
    var bottomHeight:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetup()
        renderView()
    }
    
    //1.基础设置
    fileprivate func baseSetup() {
        self.setValue(RootSingLineTabBar(), forKey: "tabBar")
        self.tabBar.tintColor = UIColor(red: 34 / 255, green: 34 / 255, blue: 34 / 255, alpha: 1.0)
    }
    
    //2.视图渲染
    fileprivate func renderView(){
        createSubViewController()
    }
}

//MARK: - Private Methods
extension RootTabBarController {
    //1.创建子视图控制器
    fileprivate func createSubViewController() {
        //1.唱歌
        let homeVC = RootNavigationController(rootViewController: SingHomeViewController())
        let homeTabBarItem : UITabBarItem = UITabBarItem(title: "", image: UIImage.init(named: "sing_home_unselcted"), selectedImage:UIImage.init(named: "sing_home_selcted"))
        homeVC.tabBarItem = homeTabBarItem
        
        //2.麦克风
        let micrVC = RootNavigationController(rootViewController: SingMicViewController())
        let micrTabBarItem : UITabBarItem = UITabBarItem(title: "", image: UIImage.init(named: "sing_mic_unselcted"), selectedImage: UIImage.init(named: "sing_mic_unselcted"))
        micrVC.tabBarItem = micrTabBarItem
        
        //3.商城
        let marketVC = RootNavigationController(rootViewController: SingMarketViewController())
        let marketTabBarItem = UITabBarItem(title: "", image: UIImage.init(named: "sing_market_unselcted"), selectedImage: UIImage.init(named: "sing_market_selcted"));
        marketVC.tabBarItem = marketTabBarItem;
        
        //4.我的
        let mineVC = RootNavigationController(rootViewController: SingMineViewController())
        let mineTabBarItem : UITabBarItem = UITabBarItem(title: "", image: UIImage.init(named: "sing_mine_unselcted"), selectedImage: UIImage.init(named: "sing_mine_selcted"))
        mineVC.tabBarItem = mineTabBarItem
        
        self.viewControllers = [homeVC,micrVC,marketVC,mineVC];
    }
}

extension RootTabBarController {
    override func viewDidLayoutSubviews() {
        if isiPhoneXScreen() {
            bottomHeight = 34
        }else{
            bottomHeight = 21
        }
        
        var frame = self.tabBar.frame
        frame.size.height = 90
        frame.origin.y = self.view.frame.size.height - frame.size.height - CGFloat(bottomHeight!)
        self.tabBar.frame = frame
    }
}



