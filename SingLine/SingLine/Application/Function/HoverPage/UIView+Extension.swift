//
//  UIView+Extension.swift
//  SingLine
//
//  Created by 梁晓龙 on 5/25/22.
//

import UIKit

//屏幕的高
let APP_FRAME_HEIGHT : CGFloat! = UIScreen.main.bounds.height
//屏幕的宽
let APP_FRAME_WIDTH : CGFloat = UIScreen.main.bounds.width
//是否为刘海屏
let ISPHONE_X = APP_FRAME_HEIGHT >= 812.0
//导航栏高度
let NAVIGATION_BAR_HEIGHT:CGFloat = ISPHONE_X ? 88.0 : 64.0

extension UIView {
    ///左右下边圆角（不能喝topRadius方法一起使用，否则不生效）
    @IBInspectable var bottomRadius: NSNumber? {
        get {
            return self.layer.cornerRadius as NSNumber
        }
        set {
            let radius = CGFloat(newValue?.floatValue ?? 0.00)
            let maskPath = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: [.bottomLeft,.bottomRight],
                                        cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    // 边界线颜色
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor.init(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    public var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newLeft) {
            var frame = self.frame
            frame.origin.x = newLeft
            self.frame = frame
        }
    }
    
    public var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set(newTop) {
            var frame = self.frame
            frame.origin.y = newTop
            self.frame = frame
        }
    }
    
    public var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set(newWidth) {
            var frame = self.frame
            frame.size.width = newWidth
            self.frame = frame
        }
    }
    
    public var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set(newHeight) {
            var frame = self.frame
            frame.size.height = newHeight
            self.frame = frame
        }
    }
    
    public var right:CGFloat {
        get {
            return self.x + self.width
        }
    }
    
    public var bottom:CGFloat {
        get {
            return self.y + self.height
        }
    }
    
    public var centerX:CGFloat {
        get {
            return self.center.x
        }
        
        set(newCenterX) {
            var center = self.center
            center.x = newCenterX
            self.center = center
        }
    }
    
    public var centerY:CGFloat {
        get {
            return self.center.y
        }
        set(newCenterY) {
            var center = self.center
            center.y = newCenterY
            self.center = center
        }
    }
}

extension UIView {
    //1.切圆角
    public func layerCornerRadius(_ radius:CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    //2.切圆
    public func layerRoundedCorners(){
        layerCornerRadius(bounds.size.width/2)
    }
    
    //3.边框
    public func layerBorder(_ width:CGFloat, color:UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

