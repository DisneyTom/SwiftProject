//
//  RootSingLineTabBar.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/27/22.
//

import UIKit

class RootSingLineTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        renderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func renderView(){
        //1.添加tabbar背景
        let backgroundImage = UIImageView(frame: CGRect(x: 20.0, y: 26, width: KScreenW - 40.0, height: 64))
        backgroundImage.image = UIImage(named: "sing_tabbar_background")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.isUserInteractionEnabled = true
        self.insertSubview(backgroundImage, at: 1)
        
        //2.去掉顶部横线
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
    }
}

extension RootSingLineTabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        let tabBarButtonW:CGFloat = (KScreenW - 30)/4
        var tabBarButtonIndex:CGFloat = 0
        for child in self.subviews {
            let childClass: AnyClass? = NSClassFromString("UITabBarButton")
            if child.isKind(of: childClass!) {
                let frame = CGRect(x: tabBarButtonIndex * tabBarButtonW + 15, y: 35, width: tabBarButtonW, height: 44)
                child.frame = frame
                tabBarButtonIndex = tabBarButtonIndex + 1
            }
        }
    }
}
