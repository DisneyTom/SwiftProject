//
//  RootViewController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/25/22.
//

import UIKit

class RootViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        if #available(iOS 11.0, *) {
//            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
//        } else {
//            automaticallyAdjustsScrollViewInsets = false
//        }
//    }
}

//MARK: Override Methods
extension RootViewController {
    //1.导航栏的颜色
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
