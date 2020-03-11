//
//  BottomSheet.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    public var dismissOnBackgroundTap = false
    public var dismissOnDraggingDownSheet = false
    
    private let v = BottomSheetView()
    
    override func loadView() {
        super.loadView()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if dismissOnBackgroundTap {
            setupTapGesture()
        }
        
        if dismissOnDraggingDownSheet {
            setupPanGesture()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        v.startOverlayViewAlphaAnimation()
    }
    
    fileprivate func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        v.overlayView.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        
    }
    
    // MARK: - UIGestureRecognizer Handling
    
    @objc func handleTapGesture() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handlePanGesture() {
        
    }
}


class PanGestureHelper: NSObject {
    
    
}
