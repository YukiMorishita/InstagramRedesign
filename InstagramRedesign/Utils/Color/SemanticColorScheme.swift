//
//  SemanticColorScheme.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SemanticColorScheme: NSObject, ColorScheming {
    var primaryColor: UIColor = .clear
    var primaryValiantColor: UIColor = .clear
    var onPrimaryColor: UIColor = .clear
    var secondaryColor: UIColor = .clear
    var secondaryValiantColor: UIColor = .clear
    var onSecondaryColor: UIColor = .clear
    var backgroundColor: UIColor = .clear
    var onBackgroundColor: UIColor = .clear
    var surfaceColor: UIColor = .clear
    var onSurfaceColor: UIColor = .clear
    var errorColor: UIColor = .clear
    var onErrorColor: UIColor = .clear
    
    override init() {
        super.init()
    }
}
