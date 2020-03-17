//
//  AddStoryCell.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class AddStoryCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            //guard let user = self.user else { return }
        }
    }
    
    fileprivate let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "user").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let addImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "add")
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2.0
        iv.layer.borderColor = ColorScheme.surfaceColor.cgColor
        return iv
    }()
    
    fileprivate let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Story"
        label.textColor = ColorScheme.onSurfaceColor
        label.textAlignment = .center
        label.font = TypographyScheme.caption
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(profileImageView)
        addSubview(addImageView)
        addSubview(textLabel)
        
        profileImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 48, height: 48)
        
        addImageView.anchor(top: nil, left: nil, bottom: profileImageView.bottomAnchor, right: profileImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: -4, width: 20, height: 20)
        
        textLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupLayers() {
        profileImageView.layer.cornerRadius = 48 / 2
        addImageView.layer.cornerRadius = 20 / 2
    }
    
    // MARK: - UITraitCollection
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        addImageView.layer.borderColor = ColorScheme.surfaceColor.cgColor
    }
}
