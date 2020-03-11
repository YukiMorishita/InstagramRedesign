//
//  PostCell.swift
//  InstagramRedesign
//
//  Created by admin on 2020/03/11.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

protocol PostCellDelegate: class {
    func didOptions(cell: PostCell)
    func didComment(cell: PostCell)
    func didFavorite(cell: PostCell)
}

class PostCell: UICollectionViewCell {
    
    weak var delegate: PostCellDelegate?
    
    
    /// Test binding property
    var isFavorite = false
    
    fileprivate let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "user").withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = ColorScheme.onSurfaceColor
        label.font = TypographyScheme.body1
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    fileprivate let timestampLabel: UILabel = {
        let label = UILabel()
        label.text = "5 minutes ago"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "options")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handleOptions), for: .touchUpInside)
        return button
    }()
    
    fileprivate let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "Amazing holiday starts on a perfect paradise island in Thailand!"
        label.textColor = ColorScheme.onSurfaceColor
        label.font = TypographyScheme.body2
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    fileprivate let tagsLabel: UILabel = {
        let label = UILabel()
        label.text = "#holiday, #thailand"
        label.textColor = .tag
        label.font = TypographyScheme.body2
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    fileprivate let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "user")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    fileprivate let commentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "32"
        label.textColor = ColorScheme.onSurfaceColor
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    fileprivate let favoriteCountLabel: UILabel = {
        let label = UILabel()
        label.text = "128"
        label.textColor = ColorScheme.onSurfaceColor
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = ColorScheme.onSurfaceColor
        button.setImage(UIImage(named: "comment")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handleComment), for: .touchUpInside)
        return button
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = ColorScheme.onSurfaceColor
        button.setImage(UIImage(named: "unfavorite")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.addTarget(self, action: #selector(handleFavorite), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = ColorScheme.surfaceColor
        
        setupViews()
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        addSubview(profileImageView)
        addSubview(usernameLabel)
        addSubview(timestampLabel)
        addSubview(optionsButton)
        addSubview(captionLabel)
        addSubview(tagsLabel)
        addSubview(photoImageView)
        addSubview(commentCountLabel)
        addSubview(commentButton)
        addSubview(favoriteCountLabel)
        addSubview(favoriteButton)
        
        profileImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 40, height: 40)
        
        usernameLabel.anchor(top: nil, left: profileImageView.rightAnchor, bottom: profileImageView.centerYAnchor, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 1, paddingRight: 0, width: 0, height: 0)
        
        timestampLabel.anchor(top: profileImageView.centerYAnchor, left: usernameLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 1, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        optionsButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 24, height: 24)
        optionsButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        
        captionLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0)
        
        tagsLabel.anchor(top: captionLabel.bottomAnchor, left: captionLabel.leftAnchor, bottom: nil, right: captionLabel.rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        photoImageView.anchor(top: tagsLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 10, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 200)
        
        commentCountLabel.anchor(top: photoImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 16, paddingRight: 16, width: 0, height: 0)
        
        commentButton.anchor(top: photoImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: commentCountLabel.leftAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 16, paddingRight: 8, width: 24, height: 24)
        
        favoriteCountLabel.anchor(top: photoImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: commentButton.leftAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 16, paddingRight: 16, width: 0, height: 0)
        
        favoriteButton.anchor(top: photoImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: favoriteCountLabel.leftAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 16, paddingRight: 8, width: 24, height: 24)
    }
    
    fileprivate func setupLayers() {
        layer.cornerRadius = 8
        layer.applyShadow(color: .shadow, x: 0, y: 2, blur: 2, spread: 0)
        profileImageView.layer.cornerRadius = 40 / 2
    }
    
    fileprivate func refreshFavoriteButton() {
        let image = UIImage(named: self.isFavorite ? "favorite" : "unfavorite")
        favoriteButton.setImage(image, for: .normal)
        favoriteButton.tintColor = .clear
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: {
            self.favoriteButton.tintColor = self.isFavorite ? .instagramRed : ColorScheme.onSurfaceColor
            self.favoriteButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { finished in
            self.favoriteButton.transform = .identity
        })
    }
    
    // MARK: - Action Handling
    
    @objc func handleOptions() {
        delegate?.didOptions(cell: self)
    }
    
    @objc func handleComment() {
        delegate?.didComment(cell: self)
    }
    
    @objc func handleFavorite() {
        isFavorite = !isFavorite
        refreshFavoriteButton()
        delegate?.didFavorite(cell: self)
    }
}
