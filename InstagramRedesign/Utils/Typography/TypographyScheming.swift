//
//  TypographyScheming.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol TypographyScheming {
    /// The largest text on the screen, reserved for short, important text or numerals.
    var headline1: UIFont { get }
    var headline2: UIFont { get }
    var headline3: UIFont { get }
    var headline4: UIFont { get }
    var headline5: UIFont { get }
    var headline6: UIFont { get }
    
    /// Smaller than headline, typically reserved for medium-emphasis text that is shorter in length.
    var subtitle1: UIFont { get }
    var subtitle2: UIFont { get }
    
    /// Typically used for long-form writing.
    var body1: UIFont { get }
    var body2: UIFont { get }
    
    /// One of the smallest font sizes, may be used sparingly to annotate other visual elements.
    var caption: UIFont { get }
    
    /// Used in calls to action, such as buttons or tabs.
    var button: UIFont { get }
    
    /// One of the smallest font sizes, might be used to introduce a headline.
    var overline: UIFont { get }
}
