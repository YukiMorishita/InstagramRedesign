//
//  UIPanGestureHelper.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/13.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class PanGestureHelper: NSObject {
    
    public var didDismiss: (() -> Void)?
    
    public var topConstant: CGFloat {
        get { return v.collectionViewTopConstraint.constant }
        set { v.collectionViewTopConstraint.constant = newValue }
    }
    
    public var heightConstant: CGFloat {
        get { return v.collectionViewHeightConstraint.constant }
        set { v.collectionViewHeightConstraint.constant = newValue }
    }
    
    private var collectionViewOriginalHeight: CGFloat = 0.0
    
    private var v: BottomSheetView!
    
    override init() {
        super.init()
    }
    
    public func registerForPanGesture(_ view: BottomSheetView) {
        v = view
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.collectionView.addGestureRecognizer(panGesture)
        
        collectionViewOriginalHeight = heightConstant
    }
    
    // MARK: - UIGestureRecognizer Handling
    
    @objc private func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: v.collectionView)
        
        switch recognizer.state {
        case .began:
            break
        case .changed:
            // Scroll up
            if translation.y < 0 {
                // Slow up
                topConstant = (translation.y * CGFloat(0.4)) - collectionViewOriginalHeight
                heightConstant = -((translation.y * CGFloat(0.4)) - collectionViewOriginalHeight)
            }
            // Scroll down
            if translation.y > 0 {
                topConstant = translation.y - collectionViewOriginalHeight
                heightConstant = -(translation.y - collectionViewOriginalHeight)
            }
        case .ended:
            if translation.y < 50  {
                resetPosition()
            } else {
                didDismiss?()
            }
        default:
            break
        }
    }
    
    fileprivate func resetPosition() {
        topConstant = -collectionViewOriginalHeight
        heightConstant = collectionViewOriginalHeight
        
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.v.layoutIfNeeded()
        }, completion: nil)
    }
}
