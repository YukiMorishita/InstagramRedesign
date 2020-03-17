//
//  BottomSheet.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    public var dismissOnBackgroundTap = true
    public var dismissOnDraggingDownSheet = true
    
    private let panGestureHelper = PanGestureHelper()
    
    private let itemNum: Int = 4
    private let cellHeight: CGFloat = 56.0
    private let headerViewHeight: CGFloat = 24.0
    
    private let cellId = "cellId"
    private let headerId = "headerId"
    
    private var estimatedCollectionViewHeight: CGFloat = .zero
    private let collectionViewOriginalTopConstraint = -350
    
    private let v = BottomSheetView()
    
    override func loadView() {
        super.loadView()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        // Improved that there is no way to dismiss
        if dismissOnBackgroundTap == false && dismissOnDraggingDownSheet == false {
            dismissOnBackgroundTap = true
        }
        
        if dismissOnBackgroundTap {
            registerForTapGesture()
        }
        
        if dismissOnDraggingDownSheet {
            panGestureHelper.registerForPanGesture(v)
            panGestureHelper.didDismiss = { [weak self] in
                self?.dismiss()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .curveEaseInOut, animations: {
            self.v.overlayView.alpha = 1.0
            self.v.layoutIfNeeded()
        }, completion: nil)
    }
    
    // MARK: - UICollectionView
    
    fileprivate func setupCollectionView() {
        let collectionViewHeight = caluculatedCollectionViewHeight()
        v.collectionViewTopConstraint.constant = -collectionViewHeight
        v.collectionViewHeightConstraint.constant = collectionViewHeight
        
        v.collectionView.register(BottomSheetCell.self, forCellWithReuseIdentifier: cellId)
        v.collectionView.register(BottomSheetHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        v.collectionView.dataSource = self
        v.collectionView.delegate = self
    }
    
    fileprivate func caluculatedCollectionViewHeight() -> CGFloat {
        let cellsHeight = CGFloat(itemNum) * cellHeight
        let safeAreaBottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0
        return headerViewHeight + cellsHeight + safeAreaBottom
    }
    
    // MARK: UIGestureRecognizer
    
    fileprivate func registerForTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        v.overlayView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - UIGestureRecognizer Handling
    
    @objc func handleTapGesture(_ recognizer: UITapGestureRecognizer) {
        dismiss()
    }
    
    // MARK: - Dismiss
    
    fileprivate func dismiss() {
        v.collectionViewTopConstraint.constant = 0
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.v.overlayView.alpha = 0.0
            self.v.layoutIfNeeded()
        }, completion: { finished in
            self.dismiss(animated: false, completion: nil)
        })
    }
}

// MARK: - UICollectionViewDataSource

extension BottomSheetViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BottomSheetCell
        cell.itemName = "Item \(indexPath.item + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! BottomSheetHeaderView
        headerView.isShowDragHandle = self.dismissOnDraggingDownSheet
        return headerView
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension BottomSheetViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: self.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        // height = padding top (10) + drag handle (4) + padding bottom (10)
        return CGSize(width: view.frame.width, height: dismissOnDraggingDownSheet ? headerViewHeight : 0)
    }
}

// MARK: - UICollectionViewDelegate

extension BottomSheetViewController: UICollectionViewDelegate {
    
}
