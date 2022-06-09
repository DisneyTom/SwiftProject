//
//  UIViewController+Extension.swift
//  SingLine
//
//  Created by 梁晓龙 on 6/9/22.
//

import UIKit

extension UIViewController {
    //MARK: - 获取当前屏幕显示的viewController
    var currentViewController:UIViewController? {
        return getCurrentViewControllerFrom(rootVC: UIApplication.shared.currentWindow?.rootViewController)
    }

    //MARK: - 通过当前window 找到当前显示的viewcontroller
    func getCurrentViewControllerFrom(rootVC:UIViewController?) -> UIViewController? {
        if let nav = rootVC as? UINavigationController {
            return getCurrentViewControllerFrom(rootVC: nav.visibleViewController)
        }
        
        if let tab = rootVC as? UITabBarController {
            return getCurrentViewControllerFrom(rootVC: tab.selectedViewController)
        }
        
        if let presented = rootVC?.presentedViewController {
            return getCurrentViewControllerFrom(rootVC: presented)
        }
        
        if let split = rootVC as? UISplitViewController {
            return getCurrentViewControllerFrom(rootVC: split.presentingViewController)
        }
        return rootVC
    }
}

