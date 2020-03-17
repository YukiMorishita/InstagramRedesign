//
//  CALayer+Extensions.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension CALayer {
    
    func applyShadow(color: UIColor, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat, alpha: Float = 0.14) {
        self.shadowColor = color.cgColor
        self.shadowOffset = CGSize(width: x, height: y)
        self.shadowOpacity = alpha
        self.shadowRadius = blur / 2
        
        if spread == 0 {
            self.shadowPath = nil
        } else {
            let rect = bounds.insetBy(dx: -spread, dy: -spread)
            self.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
