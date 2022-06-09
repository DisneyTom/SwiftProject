//
//  UIImage+Extension.swift
//  SingLine
//
//  Created by 梁晓龙 on 6/9/22.
//

import UIKit

extension UIImage {
    static func fillColor(color:UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
