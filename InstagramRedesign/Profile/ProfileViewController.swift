//
//  ProfileViewController.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/15.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var isGrid = true
    
    private let padding: CGFloat = 16.0
    private let cellId = "cellId"
    
    private let v = ProfileView()
    
    override func loadView() {
        super.loadView()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        setupCollectionView()
        
        v.delegate = self
        v.scrollView.delegate = self
    }
    
    // MARK: - UINavigationItem
    
    fileprivate func setupNavigationItems() {
        setupRemainingNavItems()
        setupRightNavItem()
    }
    
    fileprivate func setupRemainingNavItems() {
        navigationItem.title = "Profile"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    fileprivate func setupRightNavItem() {
        let settingsButton = UIBarButtonItem(image: UIImage(named: "options"), style: .plain, target: self, action: #selector(handleSettings))
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    // MARK: - UICollectionView
    
    fileprivate func setupCollectionView() {
        v.collectionView.register(ProfileViewCell.self, forCellWithReuseIdentifier: cellId)
        v.collectionView.dataSource = self
        v.collectionView.delegate = self
    }
    
    // MARK: - Action Handling
    
    @objc func handleSettings() {
        print("settings")
    }
}

extension ProfileViewController: ProfileViewDelegate {
    
    func didEditProfile() {
        let editProfileVC = EditProfileViewController()
        editProfileVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
    func didChangeToGrid() {
        if isGrid {
            v.fullScreen()
        } else {
            isGrid = true
            v.select(isGrid: isGrid)
            v.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    func didChangeToPin() {
        if !isGrid {
            v.fullScreen()
        } else {
            isGrid = false
            v.select(isGrid: isGrid)
            v.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
}

extension ProfileViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY < 0 {
            scrollView.contentOffset.y = 0
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfileViewCell
        
        if indexPath.item % 2 == 0 {
            cell.image = UIImage(named: "user")
        } else {
            cell.images = [UIImage(named: "user")!, UIImage()]
        }
        
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 4 * padding) / 3
        return CGSize(width: size, height: size)
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
