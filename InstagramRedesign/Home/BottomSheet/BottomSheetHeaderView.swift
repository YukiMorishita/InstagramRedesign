//
//  BottomSheetHeaderView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/13.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BottomSheetHeaderView: UICollectionReusableView {
    
    public var isShowDragHandle = true
    
    fileprivate let dragHandle: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        if isShowDragHandle {
            setupDragHandle()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupDragHandle() {
        addSubview(dragHandle)
        
        dragHandle.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 30, height: 4)
        dragHandle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        dragHandle.layer.cornerRadius = 4 / 2
    }
}
