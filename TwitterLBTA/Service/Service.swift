//
//  Service.swift
//  TwitterLBTA
//
//  Created by John Martin on 12/19/17.
//  Copyright © 2017 John Martin. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        print("Fetching home feed")
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.swiftyJSON.request("/twitter/home") // /twitter/home_with_error
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched our json objects")
            completion(homeDatasource, nil)
        }) { (err) in
            completion(nil, err)
        }
        
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
    
}


