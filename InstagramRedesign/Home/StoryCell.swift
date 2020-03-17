//
//  StoryCell.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class StoryCell: UICollectionViewCell {
    
    var user: User? {
        didSet {
            //guard let user = self.user else { return }
        }
    }
    
    fileprivate let profileImageView: RingImageView = {
        let rv = RingImageView()
        rv.imageView.image = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal)
        rv.refreshBorder()
        return rv
    }()
    
    fileprivate let textLabel: UILabel = {
        let label = UILabel()
        label.text = "uid"
        label.textColor = ColorScheme.onSurfaceColor
        label.textAlignment = .center
        label.font = TypographyScheme.caption
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            //TODO: Judgment by isCheked of property of Model Story
            if self.isSelected {
                profileImageView.refreshBorder(enabled: !self.isSelected, animated: true)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(profileImageView)
        addSubview(textLabel)
        
        profileImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 56, height: 56)
        
        textLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.refreshBorder()
    }
}
