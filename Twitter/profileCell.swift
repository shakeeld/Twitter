//
//  profileCell.swift
//  Twitter
//
//  Created by Shakeel Daswani on 3/8/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit
import AFNetworking

class profileCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetcountLabel: UILabel!
    @IBOutlet weak var favoritecountLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            profileImageView.setImageWithURL((tweet!.user!.profileUrl)!)
            tweetLabel.text = tweet.text as? String
            self.nameLabel.text = tweet.user?.name
            self.usernameLabel.text = "@\(tweet.user!.screenname!)"
            retweetcountLabel.text = "\(tweet.retweetCount)"
            timestampLabel.text = "\(tweet!.timeStamp!)"
            favoritecountLabel.text = "\(tweet.favoritesCount)"
            if(tweet.liked == true) {
                self.favoriteButton.setImage(UIImage(named: "like-action-on-pressed"), forState: UIControlState.Normal)
            } else {
                self.favoriteButton.setImage(UIImage(named: "like-action"), forState: UIControlState.Normal)
            }
            if(tweet.retweeted == true) {
                self.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed"), forState: UIControlState.Normal)
            }
            else {
                self.retweetButton.setImage(UIImage(named: "retweet-action"), forState: UIControlState.Normal)
            }
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.width
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
