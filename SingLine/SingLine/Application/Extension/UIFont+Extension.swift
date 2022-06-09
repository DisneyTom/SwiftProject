//
//  UIFont+Extension.swift
//  SingLine
//
//  Created by 梁晓龙 on 6/9/22.
//

import UIKit

extension UIFont {
    static func allSystemFontsNames() {
        for fontfamilyname in UIFont.familyNames {
            print("-------------")
            print("family:'\(fontfamilyname)'")
            for fontName in UIFont.fontNames(forFamilyName: fontfamilyname) {
                print("\tfont:'\(fontName)'")
            }
        }
    }
}
