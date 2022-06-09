//
//  Const.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/25/22.
//

import UIKit

//MARK: 获取屏幕大小
let KScreenSize = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? CGSize(width: UIScreen.main.nativeBounds.size.width / UIScreen.main.nativeScale, height: UIScreen.main.nativeBounds.size.height / UIScreen.main.nativeScale) : UIScreen.main.bounds.size
let KScreenW = KScreenSize.width
let KScreenH = KScreenSize.height
let KScreenBounds = UIScreen.main.bounds


//MARK: 获取状态栏，标题栏，导航栏的高度
// 1.顶部
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
let kSafeTop = (isiPhoneXScreen() ? 24.0 : 0.0)
let kSafeTopStatus = (kSafeTop + 20.0)
let kSafeTopNavgation = (kSafeTopStatus + 44.0)
// 2.底部
let KSafeBottom = (isiPhoneXScreen() ? 34.0 : 0.0)
let KSafeBottomTabBar = (KSafeBottom + 49.0)
// 3.适配
// 图屏幕适配设计宽（以6s为原型）
func kAutoLayoutWidth(_ width: CGFloat) -> CGFloat {
    return width*KScreenW / 375
}
// 屏幕适配设计图宽（以6s为原型）
func kAutoLayoutHeigth(_ height: CGFloat) -> CGFloat {
    return height*KScreenH / 667
}


//MARK: 判断机型
// 1.判断是否为iphone
let kDeviceIsIphone = (UI_USER_INTERFACE_IDIOM() == .phone)
// 2.判断是否为iPad
let kDeviceIsIPad = (UI_USER_INTERFACE_IDIOM() == .pad)
// 3.判断是不是刘海屏
func isiPhoneXScreen() -> Bool {
    guard #available(iOS 11.0,*) else {
        return false
    }
    let isX = UIApplication.shared.windows[0].safeAreaInsets.bottom > 0
    return isX
}


// MARK: 通知相关
// 1.注册通知
func kNOTIFY_ADD(observer: Any, selector: Selector, name: String) {
    return NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
}
// 2.发送通知
func kNOTIFY_POST(name: String, object: Any) {
    return NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
}
// 3.移除通知
func kNOTIFY_REMOVE(observer: Any, name: String) {
    return NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: name), object: nil)
}


// MARK: 打印输出
//开发的时候打印，但是发布的时候不打印,使用方法，输入print(message: "输入")
func print<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    //获取当前时间
    let now = Date()
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    // 要把路径最后的字符串截取出来
    let lastName = ((fileName as NSString).pathComponents.last!)
    print("\(dformatter.string(from: now)) [\(lastName)][第\(lineNumber)行] \n\t\t \(message)")
    #endif
}


// MARK: 颜色
public extension UIColor {
    convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
       self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
     }
    
    convenience init(hex: Int) {
       self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
    }
    
    convenience init(hex: Int, alpha:CGFloat) {
        self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: alpha)
    }
}


// MARK: 字符串，数组，字典判空
// 1.字符串是否为空
func kStringIsEmpty(_ str: String!) -> Bool {
    if str.isEmpty {
        return true
    }
    if str == nil {
        return true
    }
    if str.count < 1 {
        return true
    }
    if str == "(null)" {
        return true
    }
    if str == "null" {
        return true
    }
    return false
}
// 1.1字符串判空 如果为空返回@“”
func kStringNullToempty(_ str: String) -> String {
    let resutl = kStringIsEmpty(str) ? "" : str
    return resutl
}
// 1.2字符串判空 如果为空返回@“替换字符串”
func kStringNullToReplaceStr(_ str: String,_ replaceStr: String) -> String {
    let resutl = kStringIsEmpty(str) ? replaceStr : str
    return resutl
}

// 2.数组是否为空
func kArrayIsEmpty(_ array: [String]) -> Bool {
    let str: String! = array.joined(separator: "")
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if array.count == 0 {
        return true
    }
    if array.isEmpty {
        return true
    }
    return false
}

// 3.字典是否为空
func kDictIsEmpty(_ dict: NSDictionary) -> Bool {
    let str: String! = "\(dict)"
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if dict .isKind(of: NSNull.self) {
        return true
    }
    if dict.allKeys.count == 0 {
        return true
    }
    return false
}

