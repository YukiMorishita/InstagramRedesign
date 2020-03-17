//
//  EditProfileView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/17.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol EditProfileViewDelegate: class {
    func didChangeProfileImage()
}

class EditProfileView: UIView {
    
    weak var delegate: EditProfileViewDelegate?
    
    public var user: User? {
        didSet {
            
        }
    }
    
    let profileImageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.surfaceColor
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "user")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    let changeProfileImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change Profile Photo", for: .normal)
        button.setTitleColor(ColorScheme.secondaryColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = TypographyScheme.body1.withSize(12)
        button.titleLabel?.numberOfLines = 1
        button.addTarget(self, action: #selector(handleChangeProfileImage), for: .touchUpInside)
        return button
    }()
    
    let inputFormContainerView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 24
        return sv
    }()
    
    let usernameTextField: EditProfileViewTextField = {
        let tf = EditProfileViewTextField()
        tf.descriptionText = "USERNAME"
        tf.placeholder = "Username"
        tf.updatePlaceholder()
        tf.textContentType = .username
        tf.textColor = ColorScheme.onSurfaceColor
        tf.font = TypographyScheme.body2
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.clearButtonMode = .whileEditing
        tf.returnKeyType = .done
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    
    let bioTextField: EditProfileViewTextField = {
        let tf = EditProfileViewTextField()
        tf.descriptionText = "BIO"
        tf.placeholder = "#bio"
        tf.updatePlaceholder()
        tf.textColor = ColorScheme.onSurfaceColor
        tf.font = TypographyScheme.body2
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.clearButtonMode = .whileEditing
        tf.returnKeyType = .done
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    
    let websiteTextField: EditProfileViewTextField = {
        let tf = EditProfileViewTextField()
        tf.descriptionText = "WEBSITE"
        tf.placeholder = "www.example.com"
        tf.updatePlaceholder()
        tf.textContentType = .URL
        tf.textColor = ColorScheme.onSurfaceColor
        tf.font = TypographyScheme.body2
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.clearButtonMode = .whileEditing
        tf.returnKeyType = .done
        tf.enablesReturnKeyAutomatically = true
        return tf
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        setupViews()
        setupLayers()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleChangeProfileImage))
        profileImageView.addGestureRecognizer(tapGesture)
    }
    
    fileprivate func setupViews() {
        addSubview(profileImageContainerView)
        addSubview(profileImageView)
        addSubview(changeProfileImageButton)
        addSubview(inputFormContainerView)
        
        inputFormContainerView.addArrangedSubview(usernameTextField)
        inputFormContainerView.addArrangedSubview(bioTextField)
        inputFormContainerView.addArrangedSubview(websiteTextField)
        
        profileImageContainerView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        profileImageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        profileImageView.anchor(top: profileImageContainerView.topAnchor, left: profileImageContainerView.leftAnchor, bottom: profileImageContainerView.bottomAnchor, right: profileImageContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        changeProfileImageButton.anchor(top: profileImageView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        changeProfileImageButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let textFieldHeight: CGFloat = 50.0
        let space: CGFloat = 24.0
        
        let inputFormContainerViewHeight: CGFloat = textFieldHeight * 3 + space * 2
        
        inputFormContainerView.anchor(top: changeProfileImageButton.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 48, paddingLeft: 48, paddingBottom: 0, paddingRight: 48, width: 0, height: inputFormContainerViewHeight)
    }
    
    fileprivate func setupLayers() {
        profileImageContainerView.layer.cornerRadius = 100 / 2
        profileImageContainerView.layer.applyShadow(color: .shadow, x: 0, y: 4, blur: 15, spread: 0, alpha: 0.5)
        
        profileImageView.layer.cornerRadius = 100 / 2
        profileImageView.layer.borderColor = ColorScheme.surfaceColor.cgColor
        profileImageView.layer.borderWidth = 2.0
    }
    
    // MARK: - Action Handling
    
    @objc func handleChangeProfileImage() {
        delegate?.didChangeProfileImage()
    }
}
