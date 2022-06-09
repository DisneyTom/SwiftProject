//
//  SingCeilingChildViewController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/25/22.
//

import UIKit
import SnapKit

class SingCeilingChildViewController: CeilingChildViewController {
    public var tableView:UITableView!
    override var offsetY: CGFloat{
        set{
            tableView.contentOffset = CGPoint(x: 0, y: newValue)
        }
        get{
            return tableView.contentOffset.y
        }
    }
    
    override var isCanScroll: Bool{
        didSet{
            if isCanScroll{
                tableView.setContentOffset(CGPoint(x: 0, y: offsetY), animated: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderView()
    }
    
    // 渲染视图
    fileprivate func renderView() {
        tableView = UITableView(frame: .zero, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(0)
        }
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SingCELL")
    }
    
    // 获取滚动视图
    override func getScrollView() -> UIScrollView? {
        return tableView
    }
}


extension SingCeilingChildViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingCELL", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.000
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.000
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.ceilingChildViewController(self, scrollViewDidScroll: scrollView)
    }
}
