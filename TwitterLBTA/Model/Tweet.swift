//
//  Tweet.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/19/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }

}
