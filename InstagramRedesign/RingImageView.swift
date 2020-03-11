//
//  RingImageView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class RingImageView: UIView {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ColorScheme.surfaceColor
        clipsToBounds = true
        
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
        
        imageView.frame = CGRect(x: 4, y: 4, width: frame.width - 8, height: frame.height - 8)
        imageView.layer.cornerRadius = imageView.frame.height / 2
    }
    
    public func refreshBorder(enabled: Bool = true, animated: Bool = false) {
        if !animated {
            layer.borderWidth = enabled ? 2.0 : 1.0
            layer.borderColor = enabled ? UIColor.systemOrange.cgColor : UIColor.lightGray.cgColor
        } else {
            startBorderWidthAndBorderColorAnimation()
        }
    }
    
    private func startBorderWidthAndBorderColorAnimation() {
        let borderWidthAnimation = CABasicAnimation(keyPath: "borderWidth")
        borderWidthAnimation.fromValue = 2.0
        borderWidthAnimation.toValue = 1.0
        
        let borderColorAnimation = CABasicAnimation(keyPath: "borderColor")
        borderColorAnimation.fromValue = UIColor.systemOrange.cgColor
        borderColorAnimation.toValue = UIColor.lightGray.cgColor
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [borderWidthAnimation, borderColorAnimation]
        animationGroup.duration = 0.3
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        
        layer.add(animationGroup, forKey: "")
    }
}
