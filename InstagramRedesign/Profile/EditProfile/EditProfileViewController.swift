//
//  EditProfileViewController.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/17.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    private let v = EditProfileView()
    
    override func loadView() {
        super.loadView()
        view = v
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        v.backgroundColor = ColorScheme.surfaceColor
        
        setupNavigationItem()
        
        v.delegate = self
        v.usernameTextField.delegate = self
        v.bioTextField.delegate = self
        v.websiteTextField.delegate = self
    }
    
    // MARK: - UINavigationItem
    
    fileprivate func setupNavigationItem() {
        setupRemainingNavItem()
        setupRightNavItem()
    }
    
    fileprivate func setupRemainingNavItem() {
        navigationItem.title = "Edit Profile"
        navigationController?.navigationBar.layer.applyShadow(color: .shadow, x: 0, y: 4, blur: 5, spread: 0)
    }
    
    fileprivate func setupRightNavItem() {
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(handleDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func handleDone() {
        // Any process
        navigationController?.popViewController(animated: true)
    }
}

extension EditProfileViewController: EditProfileViewDelegate {
    
    func didChangeProfileImage() {
        print("change profile photo")
    }
}

extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let username = v.usernameTextField.text ?? "Username"
        let bio = v.bioTextField.text ?? "#bio"
        let website = v.websiteTextField.text ?? "www.example.com"
        
        print("\(username), \(bio), \(website)")
        
        return true
    }
}
