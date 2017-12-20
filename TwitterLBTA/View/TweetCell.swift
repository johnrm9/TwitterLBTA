//
//  TweetCell.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
            
            attributedText.append(NSAttributedString(string: 2.spaces + tweet.user.username, attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.gray]))
            attributedText.appendNewLine()
            attributedText.setLineSpacing(4)
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
        }
    }
    
    let profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let messageTextView: LBTATextView = {
        let textView = LBTATextView()
        textView.text = "SOME SAMPLE TEXT"
        return textView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()

    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor.veryLightGray
        
        addSubviews(profileImageView, messageTextView)
        
        profileImageView.anchor(topAnchor, left: leftAnchor, topConstant: 12, leftConstant: 12, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4)
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        let buttons = [replyButton, retweetButton, likeButton, directMessageButton]
        let buttonContainerViews = [UIView](count: buttons.count, elementCreator: UIView())
        
        let buttonStackView = UIStackView(arrangedSubviews: buttonContainerViews)
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, bottomConstant: 4, heightConstant: 20)
        
        buttons.enumerated().forEach { (index, button) in
            addSubview(button)
            let containerView = buttonStackView.arrangedSubviews[index]
            button.anchor(containerView.topAnchor, left: containerView.leftAnchor, widthConstant: 20, heightConstant: 20)
        }
    }
}

