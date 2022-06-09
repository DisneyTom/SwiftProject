//
//  SingHomeSubController.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/28/22.
//

import UIKit

class SingHomeSubController: SingCeilingChildViewController {
    private lazy var dataList: [String] = {
        var items = [String]()
        for i in 0..<100 {
            items.append("UITableView====\(i)")
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseSetup()
        renderView()
        requestNetwork()
    }
    
    //MARK: Initail Methods
    //1.初始化设置
    fileprivate func baseSetup() {
        self.view.backgroundColor = .white
    }
    
    //2.视图渲染
    fileprivate func renderView() {
        self.tableView.register(SingHomeSubTableViewCell.self, forCellReuseIdentifier:"SingHomeSubTableViewCell")
    }
    
    //3.加载网络数据
    fileprivate func requestNetwork() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0, execute: {
            self.tableView.reloadData()
        })
    }
}

//MARK: Delegate Methods
extension SingHomeSubController {
    //1.UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:SingHomeSubTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SingHomeSubTableViewCell", for: indexPath) as! SingHomeSubTableViewCell
        cell.updateCellData(iconUrl: "http://mvimg2.meitudata.com/55fe3d94efbc12843.jpg", title: "Happier Than Ever", author: "Billie Eilish", heat: "4.0")
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
