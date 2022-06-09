//
//  SingHomePageTitleView.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/28/22.
//

import UIKit
import SwiftUI

protocol SingHomePageTitleViewDelegate : NSObjectProtocol {
    func singHomePageTitleViewHandleSearch(_ view: SingHomePageTitleView)
    func singHomePageTitleViewHandleMatch(_ view: SingHomePageTitleView)
    func singHomePageTitleView(_ view:SingHomePageTitleView,didClickButtonWithTitle:String)
}

class SingHomePageTitleView: UIView {
    fileprivate var thisWeekBtn:UIButton!
    fileprivate var nextWeekBtn:UIButton!
    fileprivate var underLineView:UIImageView!
    fileprivate var searchBtn:UIButton!
    fileprivate var matchBtn:UIButton!
    fileprivate var currentBtn:UIButton!
    ///代理属性
    weak var delegate:SingHomePageTitleViewDelegate?
    ///选中
    var selectTitle:String {
        set{
            if newValue == "This Week" {
                handleClickWeekAction(sender: self.thisWeekBtn)
            } else if newValue == "Next Week Preview" {
                handleClickWeekAction(sender: self.nextWeekBtn)
            }
        }
        get{
            return self.currentBtn.currentTitle ?? ""
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        renderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //渲染视图
    fileprivate func renderView() {
        //1.thisWeek
        thisWeekBtn = UIButton(type: .custom)
        thisWeekBtn.setTitle("This Week", for: .normal)
        thisWeekBtn.setTitleColor(UIColor(hex: 0xD6D6D6), for: .normal)
        thisWeekBtn.setTitle("This Week", for: .selected)
        thisWeekBtn.setTitleColor(UIColor(hex: 0x1E1E1E), for: .selected)
        thisWeekBtn.contentHorizontalAlignment = .left
        thisWeekBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        thisWeekBtn.addTarget(self, action:#selector(handleClickWeekAction(sender:)), for: .touchUpInside)
        thisWeekBtn.isSelected = true
        currentBtn = thisWeekBtn
        self.addSubview(thisWeekBtn)
        thisWeekBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(78.0)
            make.height.equalTo(18.0)
        }
        
        //2.Next Week preview
        nextWeekBtn = UIButton(type: .custom)
        nextWeekBtn.setTitle("Next Week Preview", for: .normal)
        nextWeekBtn.setTitleColor(UIColor(hex: 0xD6D6D6), for: .normal)
        nextWeekBtn.setTitle("Next Week Preview", for: .selected)
        nextWeekBtn.setTitleColor(UIColor(hex: 0x1E1E1E), for: .selected)
        nextWeekBtn.contentHorizontalAlignment = .left
        nextWeekBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        nextWeekBtn.addTarget(self, action: #selector(handleClickWeekAction(sender:)), for: .touchUpInside)
        self.addSubview(nextWeekBtn)
        nextWeekBtn.snp.makeConstraints { make in
            make.left.equalTo(thisWeekBtn.snp.right).offset(20.0)
            make.top.bottom.equalTo(thisWeekBtn)
            make.width.equalTo(148.0)
        }
        
        //3.下划线
        underLineView = UIImageView(image:UIImage.init(named: "sing_home_line"))
        self.addSubview(underLineView)
        underLineView.snp.makeConstraints { make in
            make.width.equalTo(thisWeekBtn)
            make.top.equalTo(thisWeekBtn.snp.bottom).offset(2.0)
            make.height.equalTo(2.0)
            make.centerX.equalTo(thisWeekBtn)
        }
        
        //4.匹配
        self.matchBtn = UIButton(type: .custom)
        self.matchBtn.setImage(UIImage(named: "sing_home_match"), for: .normal)
        self.matchBtn.addTarget(self, action:#selector(handleMatchAction(sender:)), for: .touchUpInside)
        self.addSubview(self.matchBtn)
        self.matchBtn.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20.0)
            make.size.equalTo(CGSize(width: 18.0, height: 18.0))
        }
        
        //5.搜索
        self.searchBtn = UIButton(type: .custom)
        self.searchBtn.setImage(UIImage(named: "sing_home_search"), for: .normal)
        self.searchBtn.addTarget(self, action:#selector(handleSearchAction(sender:)), for: .touchUpInside)
        self.addSubview(self.searchBtn)
        self.searchBtn.snp.makeConstraints { make in
            make.right.equalTo(matchBtn.snp.left).offset(-10.0)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 18.0, height: 18.0))
        }
    }
}



//MARK: Target Methods
extension SingHomePageTitleView {
    //周
    @objc fileprivate func handleClickWeekAction(sender:UIButton) {
        guard !currentBtn.isEqual(sender) else {
            return
        }
        UIView.animate(withDuration: 0.3) { [self] in
            self.underLineView.snp.remakeConstraints { make in
                make.width.equalTo(sender)
                make.top.equalTo(sender.snp.bottom).offset(2.0)
                make.height.equalTo(2.0)
                make.centerX.equalTo(sender)
            }
            self.layoutIfNeeded()
        } completion: { _ in
            self.currentBtn.isSelected = false
            sender.isSelected = true
            self.currentBtn = sender
        }
        if let delegate = self.delegate {
            delegate.singHomePageTitleView(self, didClickButtonWithTitle: sender.currentTitle ?? "")
        }
    }
    
    //搜索
    @objc fileprivate func handleSearchAction(sender:UIButton) {
        if let delegate = self.delegate {
            delegate.singHomePageTitleViewHandleSearch(self)
        }
    }
    
    //匹配
    @objc fileprivate func handleMatchAction(sender:UIButton) {
        if let delegate = self.delegate {
            delegate.singHomePageTitleViewHandleMatch(self)
        }
    }
}
