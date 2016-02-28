//
//  TweetCell.swift
//  Twitter
//
//  Created by Shakeel Daswani on 2/27/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetcountLabel: UILabel!
    @IBOutlet weak var favoritecountLabel: UILabel!
    
    
    var tweet: Tweet! {
        didSet {
       tweetLabel.text = tweet.text as? String
        nameLabel.text = tweet.screenName
        retweetcountLabel.text = "\(tweet.retweetCount)"
        favoritecountLabel.text = "\(tweet.favoritesCount)"
        }
    }
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
