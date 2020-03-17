//
//  ProfileViewCell.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/15.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileViewCell: UICollectionViewCell {
    
    /// Single item
    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            photoImageView.image = image
            
            multipleIconImageView.alpha = 0.0
        }
    }
    
    /// Multiple items
    var images: [UIImage]? {
        didSet {
            guard let image = images?.first else { return }
            photoImageView.image = image
            multipleIconImageView.alpha = 1.0
        }
    }
    
    fileprivate let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let multipleIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.alpha = 0.0
        iv.tintColor = .white
        iv.image = UIImage(named: "grid")?.withRenderingMode(.alwaysTemplate)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ColorScheme.surfaceColor
        
        layer.cornerRadius = 4
        layer.applyShadow(color: .shadow, x: 0, y: 1, blur: 1, spread: 0)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(photoImageView)
        addSubview(multipleIconImageView)
        
        photoImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        multipleIconImageView.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 15, height: 15)
        
        photoImageView.layer.cornerRadius = 4
    }
}
