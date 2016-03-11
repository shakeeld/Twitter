//
//  TweetInfoViewController.swift
//  Twitter
//
//  Created by Shakeel Daswani on 3/3/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class TweetInfoViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    
    
    var tweet: Tweet!

    override func viewDidLoad() {
  
        super.viewDidLoad()
        
        print(tweet)
        
        userImage.setImageWithURL((tweet!.user!.profileUrl)!)
        nameLabel.text = tweet.user?.name
        usernameLabel.text = "@\(tweet!.user!.screenname!)"
        timeStampLabel.text = "\(tweet!.timeStamp!)"
        retweetLabel.text = "\(tweet.retweetCount)"
        likeLabel.text = "\(tweet.favoritesCount)"
        tweetLabel.text = tweet.text as? String
        
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
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    @IBAction func retweetButton(sender: AnyObject) {
        
        print("retweet clicked")
        self.retweetButton.setImage(UIImage(named: "retweet-action-on-pressed"), forState: UIControlState.Normal)
        tweet.retweeted = true
        tweet.retweetCount += 1
        self.retweetLabel.text = String(self.tweet.retweetCount)
    }
    
    
    
    @IBAction func favoriteButton(sender: AnyObject) {
        
        print("favorite clicked")
        
        self.favoriteButton.setImage(UIImage(named: "like-action-on-pressed"), forState: UIControlState.Normal)
        tweet.liked = true
        tweet.favoritesCount = tweet.favoritesCount + 1
        self.likeLabel.text = String(self.tweet.favoritesCount)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
