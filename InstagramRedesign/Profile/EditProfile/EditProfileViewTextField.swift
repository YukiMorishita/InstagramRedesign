//
//  EditProfileViewTextField.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/17.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditProfileViewTextField: UITextField {
    
    private let padding: CGFloat = 24.0
    
    public var descriptionText: String? {
        didSet {
            guard let descriptionText = self.descriptionText else { return }
            descriptionLabel.text = descriptionText
        }
    }
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = ColorScheme.surfaceColor
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = TypographyScheme.body1.withSize(11)
        label.numberOfLines = 1
        return label
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        setup()
    }
    
    fileprivate func setup() {
        self.borderStyle = .none

        addSubview(descriptionLabel)
        
        descriptionLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 28, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        descriptionLabel.centerYAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    // MARK: - Placeholder
    
    public func updatePlaceholder() {
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray, .font: TypographyScheme.body2]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: attributes)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /// Problem: Border is displayed above the description label
        /// Add a border layer to the bottom layer
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        borderLayer.cornerRadius = frame.height / 2.0
        borderLayer.borderWidth = 1.0
        borderLayer.borderColor = UIColor.lightGray.cgColor
        self.layer.insertSublayer(borderLayer, at: 0)
    }
    
    // MARK: - Rect
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding))
    }
}
