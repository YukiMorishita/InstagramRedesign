//
//  HomeView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    let storysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 0
        cv.backgroundColor = ColorScheme.surfaceColor
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.clipsToBounds = false
        return cv
    }()
    
    let postsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.tag = 1
        cv.backgroundColor = .clear
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = true
        return cv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(postsCollectionView)
        addSubview(storysCollectionView)
        
        storysCollectionView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 88)
        
        storysCollectionView.layer.applyShadow(color: .shadow, x: 0, y: 4, blur: 5, spread: 0)
        
        postsCollectionView.anchor(top: storysCollectionView.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
}
