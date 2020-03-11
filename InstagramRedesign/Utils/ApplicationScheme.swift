//
//  ApplicationScheme.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

/// Typealias for code prettiness
internal var ColorScheme: ColorScheming { return ApplicationScheme.shared.colorScheme }
internal var TypographyScheme: TypographyScheming { return ApplicationScheme.shared.typographyScheme }

class ApplicationScheme: NSObject {
    
    private static var singleton = ApplicationScheme()
    
    static var shared: ApplicationScheme {
        return singleton
    }
    
    override init() {
        super.init()
    }
    
    public let colorScheme: ColorScheming = {
        let scheme = SemanticColorScheme()
        scheme.primaryColor = .secondarySystemBackground//.systemBackground
        scheme.onPrimaryColor = .label
        scheme.secondaryColor = .instagramBlue
        scheme.onSecondaryColor = .white
        scheme.backgroundColor = .tertiarySystemBackground//.secondarySystemBackground
        scheme.onBackgroundColor = .label
        scheme.surfaceColor = .secondarySystemBackground//.systemBackground
        scheme.onSurfaceColor = .label
        return scheme
    }()
    
    public let typographyScheme: TypographyScheming = {
        let scheme = SemanticTypographyScheme()
        scheme.headline5 = UIFont.systemFont(ofSize: 24, weight: .regular)
        scheme.headline6 = UIFont.systemFont(ofSize: 20, weight: .medium)
        scheme.subtitle1 = UIFont.systemFont(ofSize: 16, weight: .regular)
        scheme.subtitle2 = UIFont.systemFont(ofSize: 14, weight: .medium)
        scheme.body1 = UIFont.systemFont(ofSize: 13, weight: .semibold)
        scheme.body2 = UIFont.systemFont(ofSize: 13, weight: .medium)
        scheme.button = UIFont.systemFont(ofSize: 14, weight: .semibold)
        scheme.caption = UIFont.systemFont(ofSize: 11, weight: .regular)
        return scheme
    }()
}
