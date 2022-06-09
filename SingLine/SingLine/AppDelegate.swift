//
//  AppDelegate.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/27/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //1.统一管理第三方库
        ThirdPartyManager.shared.setup()
        //2.创建Window
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.window?.backgroundColor = .white
        self.window?.rootViewController = RootTabBarController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

