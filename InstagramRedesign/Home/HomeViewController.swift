//
//  HomeViewController.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/10.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let padding: CGFloat = 16.0
    
    private let addStoryCellId = "addStoryCellId"
    private let storyCellId = "storyCellId"
    private let postCellId = "postCellId"
    
    private let v = HomeView()
    
    override func loadView() {
        super.loadView()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        v.backgroundColor = ColorScheme.backgroundColor
        
        setupNavigationItems()
        setupCollectionView()
    }
    
    // MARK: - UINavigationItem
    
    fileprivate func setupNavigationItems() {
        setupRemainingNavItem()
        setupLeftNavItem()
        setupRightNavItem()
    }
    
    fileprivate func setupRemainingNavItem() {
        let titleView = UIView()
        titleView.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        
        let logoImageView = UIImageView(image: UIImage(named: "logo")?.withRenderingMode(.alwaysTemplate))
        logoImageView.tintColor = ColorScheme.onPrimaryColor
        logoImageView.frame = titleView.frame
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true
        
        titleView.addSubview(logoImageView)
        
        navigationItem.titleView = titleView
        
        // Remove backbarButton text
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    }
    
    fileprivate func setupLeftNavItem() {
        let cameraButton = UIBarButtonItem(image: UIImage(named: "camera"), style: .done, target: self, action: #selector(handleCamera))
        navigationItem.leftBarButtonItem = cameraButton
    }
    
    fileprivate func setupRightNavItem() {
        let directMessagesButton = UIBarButtonItem(image: UIImage(named: "messages"), style: .done, target: self, action: #selector(handleDirectMessages))
        navigationItem.rightBarButtonItem = directMessagesButton
    }
    
    // MARK: - UICollectionView
    
    fileprivate func setupCollectionView() {
        v.storysCollectionView.register(AddStoryCell.self, forCellWithReuseIdentifier: addStoryCellId)
        v.storysCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: storyCellId)
        v.storysCollectionView.dataSource = self
        v.storysCollectionView.delegate = self
        
        v.postsCollectionView.register(PostCell.self, forCellWithReuseIdentifier: postCellId)
        v.postsCollectionView.dataSource = self
        v.postsCollectionView.delegate = self
    }
    
    // MARK: - Action Handling
    
    @objc func handleCamera() {
        print("camera")
    }
    
    @objc func handleDirectMessages() {
        print("direct messages")
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? 20 : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 0 && indexPath.item == 0 {
            let addStoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: addStoryCellId, for: indexPath) as! AddStoryCell
            return addStoryCell
        }
        
        if collectionView.tag == 0 && indexPath.item != 0 {
            let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellId, for: indexPath) as! StoryCell
            return storyCell
        }
        
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: postCellId, for: indexPath) as! PostCell
        postCell.delegate = self
        return postCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView.tag == 0 {
            return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        } else {
            return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.tag == 0 ? 20 : 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Story cell
        if collectionView.tag == 0 {
            let spacing: CGFloat = 20.0
            let width = (view.frame.width - (2 * padding) - (5 * spacing)) / 5
            return CGSize(width: width, height: 76)
        }
        
        let dummyCell = PostCell(frame: CGRect(x: 0, y: 0, width: view.frame.width - 2 * padding, height: 1000))
        dummyCell.layoutIfNeeded()
        
        let targetSize = CGSize(width: view.frame.width - 2 * padding, height: 1000)
        let estimatedSize = dummyCell.systemLayoutSizeFitting(targetSize)
        
        return CGSize(width: view.frame.width - 2 * padding, height: estimatedSize.height)
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Add story cell
        if collectionView.tag == 0 && indexPath.item == 0 {
            print("add story cell")
        }
        
        // Story cell　
        if collectionView.tag == 0 && indexPath.item != 0 {
            print("story cell")
        }
    }
}

// MARK: - PostCellDelegate

extension HomeViewController: PostCellDelegate {
    
    func didOptions(cell: PostCell) {
        let bottomSheetVC = BottomSheetViewController()
        bottomSheetVC.modalPresentationStyle = .overFullScreen
        bottomSheetVC.dismissOnBackgroundTap = true
        bottomSheetVC.dismissOnDraggingDownSheet = true
        present(bottomSheetVC, animated: false, completion: nil)
    }
    
    func didComment(cell: PostCell) {
        
    }
    
    func didFavorite(cell: PostCell) {
        
    }
}
