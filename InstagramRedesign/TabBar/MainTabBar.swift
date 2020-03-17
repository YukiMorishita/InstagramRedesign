//
//  MainTabBar.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/12.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol MainTabBarDelegate: class {
    func didCreatePost()
}

class MainTabBar: UITabBar {
    
    weak var myDelegate: MainTabBarDelegate?
    
    lazy var centerButton: CenterButton = {
        let button = CenterButton(type: .system)
        button.tintColor = .white
        let image = UIImage(named: "add2")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(handleCreatePost), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(centerButton)
        
        centerButton.anchor(top: nil, left: nil, bottom: safeAreaLayoutGuide.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 4.5, paddingRight: 0, width: 40, height: 40)
        centerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let startGradient: UIColor = .rgb(red: 194, green: 53, blue: 132)
        let endGradient: UIColor = .rgb(red: 247, green: 119, blue: 55)
        
        let colors = [startGradient.cgColor, endGradient.cgColor]
        let size = CGSize(width: 40, height: 40)
        let startPoint = CGPoint(x: 1, y: 0)
        let endPoint = CGPoint(x: 0, y: 1)
        
        centerButton.backgroundColor = .gradientColor(colors: colors, size: size, startPoint: startPoint, endPoint: endPoint)
        
        centerButton.layer.cornerRadius = 40 / 2
        centerButton.layer.applyShadow(color: .shadow, x: 0, y: 4, blur: 5, spread: 0)
        centerButton.layer.masksToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action Handling
    
    @objc func handleCreatePost() {
        myDelegate?.didCreatePost()
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.isHidden {
            return super.hitTest(point, with: event)
        }
        
        // Center button mid x, mid y
        let midX: CGFloat = self.frame.midX
        let midY: CGFloat = 0.0
        
        let radius: CGFloat = 28.0
        
        // Center Button
        if sqrt((point.x - midX) * (point.x - midX) + (point.y - midY) * (point.y - midY)) <= radius {
            return centerButton
        } else {
            return super.hitTest(point, with: event)
        }
    }
}
