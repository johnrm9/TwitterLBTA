//
//  UserCell.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            usernameLabel.text = user.username
            bioTextView.text = user.bioText
            
            profileImageView.loadImage(urlString: user.profileImageUrl)
        }
    }
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: LBTALabel = {
        let label = LBTALabel(text: "Brian Voong", font: UIFont.boldSystemFont(ofSize: 16))
        return label
    }()
    
    let usernameLabel: LBTALabel = {
        let label = LBTALabel(text: "@buildthatapp", font: UIFont.systemFont(ofSize: 14))
        label.textColor = UIColor.lightGrayText
        return label
    }()
    
    let bioTextView: LBTATextView = {
        let textView = LBTATextView()
        textView.text = "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!"
        textView.font = UIFont.systemFont(ofSize: 15)
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1 //UIScreen.main.nativeScale
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.veryLightGray
        
        addSubviews(profileImageView, nameLabel, usernameLabel, bioTextView, followButton)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, topConstant: 12, leftConstant: 12, widthConstant: 50, heightConstant: 50)
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, right: followButton.leftAnchor, leftConstant: 8, rightConstant: 12, heightConstant: 20)
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, right: nameLabel.rightAnchor, topConstant: 0, heightConstant: 20)
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -4, leftConstant: -4)
        followButton.anchor(topAnchor, right: rightAnchor, topConstant: 12, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}



