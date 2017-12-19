//
//  HomeDataSource.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/18/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        let scottUser = User(name: "Scott Anguish", username: "@sanguish", bioText: "Ex-Apple (13yrs, remote). iOS & macOS senior engineer. Published author. Looking for long term employment in a great, creative environment.", profileImage: #imageLiteral(resourceName: "Scott_Anguish"))
        
        let kindleCourseUser = User(name: "Kindle Course", username: "@kindleCourse", bioText: "This recently released course on https://videos.letsbuildthatapp.com/basic-training provides some excellent guidance on how to use UITableView and UICollectionView.  This course also teaches some basics on the Swift language, for example If Statements and For Loops.  This will be an excellent purchase for you.", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [brianUser, rayUser, scottUser, kindleCourseUser]
    }()
    
    let tweets: [Tweet] = {
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet = Tweet(user: brianUser, message: "Welcome to episode 9 of the Twitter Series, really hope you guys are enjoying the series so far. I really really need a long text block to render out so we're going to stop here.")
        
        let tweet2 = Tweet(user: brianUser, message: "This is the second tweet message for our sample project. Very very exciting message ...")
        
        return [tweet, tweet2]
    }()

    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return indexPath.section == 0 ? users[indexPath.item] : tweets[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return  section == 0 ? users.count : tweets.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
}
