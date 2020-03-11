//
//  ColorScheming.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol ColorScheming {
    /// A primary color is the color displayed most frequently across your app’s screens and components.
    var primaryColor: UIColor { get }
    
    /// Your primary color can be used to make a color theme for your app, including dark and light primary color variants.
    var primaryValiantColor: UIColor { get }
    
    /// The color of the component displayed above the primary color.
    var onPrimaryColor: UIColor { get }
    
    /// A secondary color is the color used for buttons, sliders, switches, selected text, progress bars, links, headings, and so on.
    var secondaryColor: UIColor { get }
    
    /// Your secondary color can be used to make a color theme for your select parts, including dark and light secondary color variants.
    var secondaryValiantColor: UIColor { get }
    
    /// The color of the component displayed above the secondary color.
    var onSecondaryColor: UIColor { get }
    
    /// The background color appears behind scrollable content.
    var backgroundColor: UIColor { get }
    
    /// The color of the component displayed above the background color.
    var onBackgroundColor: UIColor { get }
    
    /// A surface color is the background color for components such as cards, sheets, and menus.
    var surfaceColor: UIColor { get }
    
    /// The color of the component displayed above the surface color.
    var onSurfaceColor: UIColor { get }
    
    /// A Error color indicates errors in components, such as invalid text in a text field.
    var errorColor: UIColor { get }
    
    /// The color of the component displayed above the error color.
    var onErrorColor: UIColor { get }
}
