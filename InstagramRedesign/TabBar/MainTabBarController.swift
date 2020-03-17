//
//  MainTabBarController.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/12.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setValue(MainTabBar(frame: self.tabBar.frame), forKey: "tabBar")
        
        setupTabBar()
        setupViewControllers()
        
        self.delegate = self
    }
    
    // MARK: - UITabBar
    
    fileprivate func setupTabBar() {
        guard let mainTabBar = self.tabBar as? MainTabBar else { return }
        mainTabBar.myDelegate = self
        
        // Remove top border
        if #available(iOS 13, *) {
            let appearance = mainTabBar.standardAppearance
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = ColorScheme.primaryColor
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            mainTabBar.standardAppearance = appearance
        } else {
            // iOS 12 and below:
            mainTabBar.barTintColor = ColorScheme.primaryColor
            mainTabBar.shadowImage = UIImage()
            mainTabBar.backgroundImage = UIImage()
        }
        
        mainTabBar.tintColor = ColorScheme.onPrimaryColor
        mainTabBar.unselectedItemTintColor = .rgb(red: 209, green: 209, blue: 214)
        mainTabBar.isTranslucent = false
        
        mainTabBar.layer.applyShadow(color: .shadow, x: 0, y: -8, blur: 10, spread: 1)
        mainTabBar.layer.masksToBounds = false
    }
    
    func setupViewControllers() {
        let homeViewController = HomeViewController()
        let homeNavController = templateNavController(rootViewController: homeViewController, image: #imageLiteral(resourceName: "home"))
        
        let searchViewController = UIViewController()
        let searchNavController = templateNavController(rootViewController: searchViewController, image: #imageLiteral(resourceName: "search"))
        
        let centerSpace = UIViewController()
        
        let activityViewController = UIViewController()
        let activityNavController = templateNavController(rootViewController: activityViewController, image: #imageLiteral(resourceName: "favorite"))
        
        let profileViewController = ProfileViewController()
        let profileNavController = templateNavController(rootViewController: profileViewController, image: #imageLiteral(resourceName: "profile"))
        
        self.viewControllers = [homeNavController, searchNavController, centerSpace, activityNavController, profileNavController]
        
        // Modify tab bar image insets
        let items = tabBar.items ?? []
        items.forEach { $0.imageInsets = .init(top: 4, left: 0, bottom: -4, right: 0) }
    }
    
    fileprivate func templateNavController(rootViewController: UIViewController, image: UIImage) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.navigationBar.barTintColor = ColorScheme.primaryColor
        navController.navigationBar.tintColor = ColorScheme.onPrimaryColor
        navController.navigationBar.isTranslucent = false
        
        // Remove separator
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navController.navigationBar.shadowImage = UIImage()
        
        navController.tabBarItem.image = image
        return navController
    }
    
    // MARK: - UITabBarControllerDelegate
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        let index = viewControllers?.firstIndex(of: viewController)
        return index == 2 ? false : true
    }
}

// MARK: - MainTabBarDelegate

extension MainTabBarController: MainTabBarDelegate {
    
    func didCreatePost() {
        print("create post")
    }
}
