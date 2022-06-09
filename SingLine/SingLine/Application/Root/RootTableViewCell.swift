//
//  RootTableViewCell.swift
//  SingLine
//
//  Created by 梁晓龙 on 6/9/22.
//

import UIKit

class RootTableViewCell: UITableViewCell {
    //计算属性
    static var cellIdentify:String {
        return NSStringFromClass(RootTableViewCell.classForCoder())
    }
    
    //初始化
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
