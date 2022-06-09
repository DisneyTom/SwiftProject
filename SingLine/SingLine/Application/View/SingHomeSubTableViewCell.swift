//
//  SingHomeSubTableViewCell.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/28/22.
//

import UIKit
import Kingfisher

class SingHomeSubTableViewCell: UITableViewCell {
    
    fileprivate var iconImageView:UIImageView!
    fileprivate var titleLbl:UILabel!
    fileprivate var authorLbl:UILabel!
    fileprivate var markImageView:UIImageView!
    fileprivate var heatLbl:UILabel!
    fileprivate var singBtn:UIButton!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        renderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func renderView() {
        //1.封面
        iconImageView = UIImageView(frame: CGRect.zero)
        iconImageView.layer.cornerRadius = 20.0
        iconImageView.layer.masksToBounds = true
        self.contentView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20.0)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 70.0, height: 70.0))
        }
        
        //2.唱歌
        singBtn = UIButton(type: .custom)
        singBtn.setImage(UIImage(named: "sing_home_singBtn"), for: .normal)
        singBtn.addTarget(self, action: #selector(handleClickSingAction(sender:)), for: .touchUpInside)
        self.contentView.addSubview(singBtn)
        singBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20.0)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 45.0, height: 28.0))
        }
        
        //3.标题
        titleLbl = UILabel(frame: CGRect.zero)
        titleLbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLbl.textColor = UIColor(hex: 0x1E1E1E)
        self.contentView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(20.0)
            make.top.equalTo(iconImageView)
            make.right.equalTo(singBtn.snp.left).offset(-5.0)
            make.height.equalTo(18)
        }
        
        //4.作者
        authorLbl = UILabel(frame: CGRect.zero)
        authorLbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        authorLbl.textColor = UIColor(hex: 0x1E1E1E)
        self.contentView.addSubview(authorLbl)
        authorLbl.snp.makeConstraints { make in
            make.left.right.equalTo(titleLbl)
            make.top.equalTo(titleLbl.snp.bottom).offset(4.0)
            make.height.equalTo(18.0)
        }
        
        //5.标识
        markImageView = UIImageView(image: UIImage.init(named: "sing_home_mark"))
        self.contentView.addSubview(markImageView)
        markImageView.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(25.0)
            make.bottom.equalTo(iconImageView.snp.bottom)
            make.size.equalTo(CGSize(width: 8.5, height: 15.0))
        }
        
        //6.热度
        heatLbl = UILabel(frame: CGRect.zero)
        heatLbl.textColor = UIColor(hex: 0x1E1E1E)
        heatLbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.contentView.addSubview(heatLbl)
        heatLbl.snp.makeConstraints { make in
            make.left.equalTo(markImageView.snp.right).offset(8.0)
            make.top.bottom.equalTo(markImageView)
            make.right.equalTo(titleLbl)
        }
    }
    
    
    public func updateCellData(iconUrl:String,title:String,author:String,heat:String) {
        //1.封面
        if let url = URL(string:iconUrl) {
            iconImageView.kf.setImage(with: url, placeholder:UIImage(named: "sing_home_icon"), options: nil, completionHandler: nil)
        }
        //2.标题
        titleLbl.text = title
        //3.作者
        authorLbl.text = author
        //4.热度
        heatLbl.text = heat
    }
}


extension SingHomeSubTableViewCell {
    @objc fileprivate func handleClickSingAction(sender:UIButton){
        
    }
}
