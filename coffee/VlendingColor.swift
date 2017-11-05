//
//  VlendingColor.swift
//  Vlending_Project
//
//  Created by TeddyKwak on 2017. 8. 9..
//  Copyright © 2017년 TeddyKwak. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var pulple: UIColor { return hexStringToUIColor(hex: "#A44CED", alpha: 1.0) }
    static var mainOrange: UIColor { return hexStringToUIColor(hex: "#FF8500", alpha: 1.0) }
    static var subGray: UIColor { return hexStringToUIColor(hex: "#C3C3C3", alpha: 1.0) }
    
    static var warmGray: UIColor { return hexStringToUIColor(hex: "#787878", alpha: 1.0) }
    static var orangeRed: UIColor { return hexStringToUIColor(hex: "#ff3737", alpha: 1.0) }
    static var darkSkyBlue: UIColor { return hexStringToUIColor(hex: "#3287dc", alpha: 1.0) }
    
    static var aquaMarine: UIColor { return hexStringToUIColor(hex: "#32dcc3", alpha: 1.0) }
    static var darkGray: UIColor { return hexStringToUIColor(hex: "#505050", alpha: 1.0) }
    static var brightLavender: UIColor { return hexStringToUIColor(hex: "#b946ff", alpha: 1.0) }
    
    static var black_10: UIColor { return hexStringToUIColor(hex: "#1e1e1e", alpha: 1.0) }
    static var black_01: UIColor { return hexStringToUIColor(hex: "#282828", alpha: 0.1) }
    static var black_03: UIColor { return hexStringToUIColor(hex: "#000000", alpha: 0.3) }
    static var black_04: UIColor { return hexStringToUIColor(hex: "#000000", alpha: 0.4) }
    static var black_06: UIColor { return hexStringToUIColor(hex: "#000000", alpha: 0.6) }
    static var black_08: UIColor { return hexStringToUIColor(hex: "#000000", alpha: 0.8) }
    
    static var white_10: UIColor { return hexStringToUIColor(hex: "#ffffff", alpha: 1.0) }
    static var white_03: UIColor { return hexStringToUIColor(hex: "#787878", alpha: 0.3) }
    static var white_05: UIColor { return hexStringToUIColor(hex: "#ffffff", alpha: 0.5) }
    
    
    
    
    static func hexStringToUIColor (hex:String, alpha: Float) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
}

