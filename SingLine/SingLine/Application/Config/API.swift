//
//  API.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/27/22.
//

import UIKit

fileprivate let testEnvironment = "http://test-api.bhmc.com.cn"
fileprivate let releEnvironment = "https://pre-api.bhmc.com.cn"
fileprivate let mastEnvironment = "https://bm2-api.bluemembers.com.cn"
fileprivate func getURL(urlPostFix:String) -> String {
    let value = UserDefaults.value(forKey: Key.DefaultKey.UrlService) as! Int
    var ipSeverStr:String?
    if value == 1 {
        ipSeverStr = testEnvironment
    } else if value == 2 {
        ipSeverStr = releEnvironment
    } else {
        ipSeverStr = mastEnvironment
    }
    return ipSeverStr ?? mastEnvironment
}


