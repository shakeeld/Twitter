//
//  User.swift
//  Twitter
//
//  Created by Shakeel Daswani on 2/26/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class User: NSObject {
    
    
    var user: User?
    
    var name: String?
    var screenname: String!
    var profileUrl: NSURL?
    var tagline: NSString?
    var tweetCount: Int = 0
    var following: Int = 0
    var followers: Int = 0
    var profileBackgroundUrl: NSURL?
    
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        
        
        self.dictionary = dictionary
        
        tweetCount = (dictionary["statuses_count"] as? Int)!
        following = (dictionary["friends_count"] as? Int)!
        followers = (dictionary["followers_count"] as? Int)!
        let profileBackgroundURlString = dictionary["profile_background_image_url_https"] as? String
        if let profileBackgroundUrlString = profileBackgroundURlString {
            profileBackgroundUrl = NSURL(string: profileBackgroundUrlString)
        }
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = NSURL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? String
        
    }
    
     static let userDidLogoutNotification = "UserDidLogout"
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            if _currentUser == nil {
            let defaults = NSUserDefaults.standardUserDefaults()
            
            
            let userData = defaults.objectForKey("currentUserData") as? NSData
        
            if let userData = userData {
                let dictionary = try! NSJSONSerialization.JSONObjectWithData(userData, options: []) as! NSDictionary
                  _currentUser = User(dictionary: dictionary)
                
        }
        
      
        
        }
            
            return _currentUser
        
        
        }
        set(user) {
            _currentUser = user
            let defaults = NSUserDefaults.standardUserDefaults()
            
            if let user = user {
           let data = try! NSJSONSerialization.dataWithJSONObject(user.dictionary!, options: [])
                
                defaults.setObject(data, forKey: "currentUserData")
            } else {
                defaults.setObject(nil, forKey: "currentUserData")
            }
            
            //defaults.setObject(user, forKey: "currentUser")
            
            defaults.synchronize()
        }
        
    }

}
