//
//  ProfileView.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/15.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol ProfileViewDelegate: class {
    func didEditProfile()
    func didChangeToGrid()
    func didChangeToPin()
}

class ProfileView: UIView {
    
    weak var delegate: ProfileViewDelegate?
    
    /// Properties used until user authentication function implementation
    public let isMyself = true
    
    public var selectorCenterXConstraint: NSLayoutConstraint!
    public let profileContainerViewMinimalVisibleHeight: CGFloat = 50.0
    
    public var user: User? {
        didSet {
            //guard let user = self.user else { return }
            // setup edit profile button or follow button, message button
        }
    }
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.alwaysBounceVertical = true
        return sv
    }()
    
    let profileContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.surfaceColor
        view.clipsToBounds = false
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "user")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = ColorScheme.onBackgroundColor
        label.textAlignment = .center
        label.font = TypographyScheme.subtitle2
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "#Engineer"
        label.textColor = .instagramBlue2
        label.textAlignment = .center
        label.font = TypographyScheme.caption
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let websiteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("www.example.com", for: .normal)
        button.setTitleColor(.instagramBlue2, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = TypographyScheme.caption
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.lineBreakMode = .byTruncatingTail
        return button
    }()
    
    let postsCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        var attributes1: [NSAttributedString.Key: Any] = [.foregroundColor: ColorScheme.onBackgroundColor, .font: TypographyScheme.body1]
        var attributes2: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray, .font: TypographyScheme.body1]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attributes1.updateValue(paragraphStyle, forKey: .paragraphStyle)
        attributes2.updateValue(paragraphStyle, forKey: .paragraphStyle)
        let attributedText = NSMutableAttributedString(string: "500\n", attributes: attributes1)
        attributedText.append(NSAttributedString(string: "Posts", attributes: attributes2))
        label.attributedText = attributedText
        return label
    }()
    
    let followersCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        var attributes1: [NSAttributedString.Key: Any] = [.foregroundColor: ColorScheme.onBackgroundColor, .font: TypographyScheme.body1]
        var attributes2: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray, .font: TypographyScheme.body1]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attributes1.updateValue(paragraphStyle, forKey: .paragraphStyle)
        attributes2.updateValue(paragraphStyle, forKey: .paragraphStyle)
        let attributedText = NSMutableAttributedString(string: "120k\n", attributes: attributes1)
        attributedText.append(NSAttributedString(string: "Followers", attributes: attributes2))
        label.attributedText = attributedText
        return label
    }()
    
    let followingCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        var attributes1: [NSAttributedString.Key: Any] = [.foregroundColor: ColorScheme.onBackgroundColor, .font: TypographyScheme.body1]
        var attributes2: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.lightGray, .font: TypographyScheme.body1]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attributes1.updateValue(paragraphStyle, forKey: .paragraphStyle)
        attributes2.updateValue(paragraphStyle, forKey: .paragraphStyle)
        let attributedText = NSMutableAttributedString(string: "80k\n", attributes: attributes1)
        attributedText.append(NSAttributedString(string: "Following", attributes: attributes2))
        label.attributedText = attributedText
        return label
    }()
    
    let editProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.setTitleColor(ColorScheme.onSurfaceColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = TypographyScheme.button
        button.titleLabel?.numberOfLines = 1
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(handleEditProfile), for: .touchUpInside)
        return button
    }()
    
    @objc func handleEditProfile() {
        delegate?.didEditProfile()
    }
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorScheme.secondaryColor
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(ColorScheme.onSecondaryColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = TypographyScheme.button
        button.titleLabel?.numberOfLines = 1
        button.layer.cornerRadius = 4
        button.layer.applyShadow(color: .shadow, x: 0, y: 4, blur: 5, spread: 0)
        return button
    }()
    
    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorScheme.surfaceColor
        button.setTitle("Message", for: .normal)
        button.setTitleColor(ColorScheme.onSurfaceColor, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = TypographyScheme.button
        button.titleLabel?.numberOfLines = 1
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = ColorScheme.onSurfaceColor
        let image = UIImage(named: "grid")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(handleGrid), for: .touchUpInside)
        return button
    }()
    
    let pinButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = ColorScheme.onSurfaceColor
        let image = UIImage(named: "pin")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(handlePin), for: .touchUpInside)
        return button
    }()
    
    let selector: UIView = {
        let view = UIView()
        view.backgroundColor = .label
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) // 16 = padding
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.alwaysBounceVertical = true
        cv.showsVerticalScrollIndicator = true
        return cv
    }()
    
    convenience init() {
        self.init(frame: .zero)
        
        backgroundColor = ColorScheme.backgroundColor
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(profileContainerView)
        
        scrollView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        profileContainerView.anchor(top: scrollView.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        collectionView.anchor(top: profileContainerView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        setupProfileContainerView()
        
        profileContainerView.layer.applyShadow(color: .shadow, x: 0, y: 2, blur: 2, spread: 0)
    }
    
    fileprivate func setupProfileContainerView() {
        profileContainerView.addSubview(profileImageView)
        profileContainerView.addSubview(usernameLabel)
        profileContainerView.addSubview(bioLabel)
        profileContainerView.addSubview(websiteButton)
        
        if isMyself {
            profileContainerView.addSubview(editProfileButton)
        } else {
            profileContainerView.addSubview(followButton)
            profileContainerView.addSubview(messageButton)
        }
        
        profileContainerView.addSubview(gridButton)
        profileContainerView.addSubview(pinButton)
        profileContainerView.addSubview(selector)
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(postsCountLabel)
        stackView.addArrangedSubview(followersCountLabel)
        stackView.addArrangedSubview(followingCountLabel)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        profileContainerView.addSubview(stackView)
        
        let separator = UIView()
        separator.backgroundColor = UIColor.separator
        
        profileContainerView.addSubview(separator)
        
        profileImageView.anchor(top: nil, left: nil, bottom: nil, right: usernameLabel.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 32, width: 80, height: 80)
        profileImageView.centerYAnchor.constraint(equalTo: bioLabel.centerYAnchor).isActive = true
        
        profileImageView.layer.cornerRadius = 80 / 2
        
        usernameLabel.anchor(top: profileContainerView.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 24, width: 0, height: 0)
        usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        bioLabel.anchor(top: usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 24, width: 0, height: 0)
        
        websiteButton.anchor(top: bioLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: -2, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        stackView.anchor(top: profileImageView.bottomAnchor, left: profileContainerView.leftAnchor, bottom: nil, right: profileContainerView.rightAnchor, paddingTop: 24, paddingLeft: 48, paddingBottom: 0, paddingRight: 48, width: 0, height: 48)
        
        if isMyself {
            editProfileButton.anchor(top: stackView.bottomAnchor, left: profileContainerView.leftAnchor, bottom: nil, right: profileContainerView.rightAnchor, paddingTop: 24, paddingLeft: 48, paddingBottom: 0, paddingRight: 48, width: 0, height: 36)
        } else {
            followButton.anchor(top: stackView.bottomAnchor, left: profileContainerView.leftAnchor, bottom: nil, right: profileContainerView.centerXAnchor, paddingTop: 24, paddingLeft: 48, paddingBottom: 0, paddingRight: 12, width: 0, height: 36)
            
            messageButton.anchor(top: stackView.bottomAnchor, left: profileContainerView.centerXAnchor, bottom: nil, right: profileContainerView.rightAnchor, paddingTop: 24, paddingLeft: 12, paddingBottom: 0, paddingRight: 48, width: 0, height: 36)
        }
        
        separator.anchor(top: self.isMyself ? editProfileButton.bottomAnchor : followButton.bottomAnchor, left: profileContainerView.leftAnchor, bottom: nil, right: profileContainerView.rightAnchor, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
        
        gridButton.anchor(top: separator.bottomAnchor, left: profileContainerView.leftAnchor, bottom: profileContainerView.bottomAnchor, right: profileContainerView.centerXAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        pinButton.anchor(top: separator.bottomAnchor, left: profileContainerView.centerXAnchor, bottom: profileContainerView.bottomAnchor, right: profileContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
        
        selector.anchor(top: nil, left: nil, bottom: profileContainerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: UIScreen.main.bounds.width / 6, height: 2)
        
        selectorCenterXConstraint = selector.centerXAnchor.constraint(equalTo: gridButton.centerXAnchor)
        selectorCenterXConstraint.isActive = true
        
        selector.layer.cornerRadius = 2 / 2
    }
    
    /// Switching the contents of the collection view
    public func select(isGrid: Bool) {
        selectorCenterXConstraint.isActive = false
        
        if isGrid {
            selectorCenterXConstraint = selector.centerXAnchor.constraint(equalTo: gridButton.centerXAnchor)
        } else {
            selectorCenterXConstraint = selector.centerXAnchor.constraint(equalTo: pinButton.centerXAnchor)
        }
        
        selectorCenterXConstraint.isActive = true
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    /// Display collection view full screen
    public func fullScreen() {
        let contentOffset: CGPoint = CGPoint(x: 0, y: profileContainerView.frame.height - profileContainerViewMinimalVisibleHeight)
        scrollView.setContentOffset(contentOffset, animated: true)
    }
    
    // MARK: - Action Handling
    
    @objc func handleGrid() {
        delegate?.didChangeToGrid()
    }
    
    @objc func handlePin() {
        delegate?.didChangeToPin()
    }
}
