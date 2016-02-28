//
//  Tweet.swift
//  Twitter
//
//  Created by Shakeel Daswani on 2/26/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var text: NSString?
    var timeStamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var screenName: String?
    
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        screenName = dictionary["screen_name"] as? String
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        let timeStampString = dictionary["created_at"] as? String
        

        
        if let timeStampString = timeStampString {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        timeStamp = formatter.dateFromString(timeStampString)
        }
    }
    
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
        
    }
    
    
}
