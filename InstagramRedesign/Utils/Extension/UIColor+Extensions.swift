//
//  UIColor+Extensions.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha)
    }
    
    static var instagramRed: UIColor {
        return .rgb(red: 233, green: 105, blue: 105)
    }
    
    static var instagramBlue: UIColor {
        return .rgb(red: 17, green: 154, blue: 237)
    }
    
    static var separator: UIColor {
        if #available(iOS 13.0, *) {
            return .opaqueSeparator
        }
        return rgb(red: 198, green: 198, blue: 200)
    }
    
    static var tag: UIColor {
        if #available(iOS 13.0, *) {
            let color = UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return rgb(red: 236, green: 246, blue: 255)
                } else {
                    return rgb(red: 19, green: 58, blue: 101)
                }
            }
            return color
        }
        return rgb(red: 19, green: 58, blue: 101)
    }
    
    static var hyperlink: UIColor {
        if #available(iOS 13.0, *) {
            return .link
        }
        return rgb(red: 0, green: 122, blue: 255)
    }
    
    static var shadow: UIColor {
        return .black
    }
}
