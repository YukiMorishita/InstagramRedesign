//
//  BottomSheetCell.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/13.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BottomSheetCell: UICollectionViewCell {
    
    var itemName: String? {
        didSet {
            guard let text = itemName else { return }
            textLabel.text = text
        }
    }
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = ColorScheme.onSurfaceColor
        iv.image = #imageLiteral(resourceName: "options").withRenderingMode(.alwaysTemplate)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorScheme.onSurfaceColor
        label.font = TypographyScheme.subtitle1
        label.numberOfLines = 1
        return label
    }()
    
    fileprivate let selectionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.alpha = 0.0
        return view
    }()
    
    override var isSelected: Bool {
        didSet {
            refreshSelection()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            refreshSelection()
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
        addSubview(selectionView)
        addSubview(imageView)
        addSubview(textLabel)
        
        selectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        imageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 24, height: 24)
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        textLabel.anchor(top: nil, left: imageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    fileprivate func refreshSelection() {
        let isShow = isSelected || isHighlighted
        selectionView.alpha = isShow ? 0.3 : 0.0
    }
}
