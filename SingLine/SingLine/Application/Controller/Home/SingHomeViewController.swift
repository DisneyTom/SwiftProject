//
//  SingHomeViewController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/27/22.
//

import UIKit

class SingHomeViewController: RootViewController {
    var cellingViewController:SingCeilingViewController!
    fileprivate var thisWeekViewController:SingHomeSubController!
    fileprivate var nextWeekViewController:SingHomeSubController!
    //1. 顶部Header
    lazy var topHeaderView: UIView = {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: APP_FRAME_WIDTH, height: 300)
        headerView.backgroundColor = .red
        return headerView
    }()
    
    //2. 分段控制器
    lazy var pageTitleView: SingHomePageTitleView = {
        let titleView = SingHomePageTitleView()
        titleView.delegate = self
        titleView.frame.size = CGSize(width: view.frame.width, height: 66.0)
        return titleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetup()
        renderView()
    }
    
    //MARK: Initail Methods
    //1.基础设置
    fileprivate func baseSetup() {
        self.view.backgroundColor = .white
    }
    
    //2.视图渲染
    fileprivate func renderView() {
        /// 添加子控制器
        var viewControllers = [SingHomeSubController]()
        self.thisWeekViewController = SingHomeSubController()
        viewControllers.append(self.thisWeekViewController)
        self.nextWeekViewController = SingHomeSubController()
        viewControllers.append(self.nextWeekViewController)
        /// 添加分页控制器
        cellingViewController = SingCeilingViewController(viewControllers, topHeaderView, pageTitleView)
        cellingViewController.delegate = self
        cellingViewController.view.frame = CGRect(x: 0, y: 0, width: APP_FRAME_WIDTH, height: APP_FRAME_HEIGHT)
        addChild(cellingViewController)
        view.addSubview(cellingViewController.view)
    }
}

//MARK: Private Methods
extension SingHomeViewController {
    
}


//MARK: Delegate Methods
extension SingHomeViewController : CeilingPageViewControllerDelegate {
    func mainTableViewDidScroll(scrollView: UIScrollView, isMainCanScroll: Bool) {
        
    }
    
    func ceilingPageViewController(_ viewController: SingCeilingViewController, scrollViewDidScroll scrollView: UIScrollView) {
    }
    
    func ceilingPageViewController(_ viewController: SingCeilingViewController, scrollViewDidEndDecelerating scrollView: UIScrollView) {
       
//        if viewController.isEqual(self.thisWeekViewController) {
//            self.pageTitleView.selectTitle = "This Week"
//        } else if viewController.isEqual(self.nextWeekViewController) {
//            self.pageTitleView.selectTitle = "Next Week Preview"
//        }
    }
}

extension SingHomeViewController : SingHomePageTitleViewDelegate {
    // 点击匹配
    func singHomePageTitleViewHandleMatch(_ view: SingHomePageTitleView) {
        
    }
    
    //点击搜索
    func singHomePageTitleViewHandleSearch(_ view: SingHomePageTitleView) {
        
    }
    
    //点击segment
    func singHomePageTitleView(_ view: SingHomePageTitleView, didClickButtonWithTitle: String) {
        if didClickButtonWithTitle == "This Week" {
            cellingViewController.move(to: 0, animated: true)
        } else if didClickButtonWithTitle == "Next Week Preview" {
            cellingViewController.move(to: 1, animated: true)
        }
    }
}

//MARK: Target Methods
extension SingHomeViewController {
    @objc func buttonClick(btn: UIButton) {
        cellingViewController.move(to: btn.tag-100, animated: true)
    }
}
