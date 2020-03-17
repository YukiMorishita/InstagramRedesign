//
//  CenterButton.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/12.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class CenterButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
                self.alpha = self.isHighlighted ? 0.8 : 1.0
            }, completion: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
