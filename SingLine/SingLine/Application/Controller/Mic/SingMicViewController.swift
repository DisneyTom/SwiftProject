//
//  SingMicViewController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/27/22.
//

import UIKit

class SingMicViewController: RootViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetup()
        renderView()
        requestNetwork()
    }
    
    //MARK: Initail Methods
    //1.基础设置
    fileprivate func baseSetup () {
        self.view.backgroundColor = .yellow
    }
    
    //2.视图渲染
    fileprivate func renderView() {
        
    }
    
    //3.网络请求
    fileprivate func requestNetwork() {
        
    }
}


//MARK: Private Methods
extension SingMicViewController {
    
}
