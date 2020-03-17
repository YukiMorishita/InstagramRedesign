//
//  BottomSheetView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BottomSheetView: UIView {
    
    public var collectionViewTopConstraint: NSLayoutConstraint!
    public var collectionViewHeightConstraint: NSLayoutConstraint!
    
    let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        view.alpha = 0.0
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = ColorScheme.surfaceColor
        cv.isScrollEnabled = false
        cv.clipsToBounds = false
        return cv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(overlayView)
        addSubview(collectionView)
        
        overlayView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: bottomAnchor)
        collectionViewTopConstraint.isActive = true
        
        collectionViewHeightConstraint = collectionView.heightAnchor.constraint(equalToConstant: 0)
        collectionViewHeightConstraint.isActive = true
        
        collectionView.layer.cornerRadius = 10
        collectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        collectionView.layer.applyShadow(color: .shadow, x: 0, y: -8, blur: 10, spread: 1)
    }
}
