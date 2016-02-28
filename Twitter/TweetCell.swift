//
//  TweetCell.swift
//  Twitter
//
//  Created by Shakeel Daswani on 2/27/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetcountLabel: UILabel!
    @IBOutlet weak var favoritecountLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    
    var tweet: Tweet! {
        didSet {
        tweetLabel.text = tweet.text as? String
        self.nameLabel.text = tweet.user?.screenname
        self.usernameLabel.text = tweet.user?.name
        retweetcountLabel.text = "\(tweet.retweetCount)"
        timestampLabel.text = "\(tweet.timeStamp)"
        favoritecountLabel.text = "\(tweet.favoritesCount)"
        //profileImageView.setImageWithURL((tweet.user?.profileUrl)!)
            
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        
    }
    
    @IBAction func retweetButton(sender: AnyObject) {
        print("retweet clicked")
        self.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed"), forState: UIControlState.Normal)

        self.retweetcountLabel.text = String(self.tweet.retweetCount + 1)
    }
    
    
    @IBAction func favoriteButton(sender: AnyObject) {
        print("favorite clicked")
        
        self.favoriteButton.setImage(UIImage(named: "like-action-on-pressed"), forState: UIControlState.Normal)
        self.favoritecountLabel.text = String(self.tweet.favoritesCount + 1)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
