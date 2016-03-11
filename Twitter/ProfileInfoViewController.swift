//
//  ProfileInfoViewController.swift
//  Twitter
//
//  Created by Shakeel Daswani on 3/7/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class ProfileInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var user : User?
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    var tweets: [Tweet]?
    @IBOutlet weak var followersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         profileImage.setImageWithURL(user!.profileUrl!)
        tweetCount.text = String(user!.tweetCount)
        followingLabel.text = "\(user!.following)"
        followersLabel.text = "\(user!.followers)"
        backgroundImage.setImageWithURL(user!.profileBackgroundUrl!)
        
         tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
      TwitterClient.sharedInstance.userTimeLine((user!.screenname!), success: { (tweets:[Tweet]) -> () in
            self.tweets = tweets
                print(self.tweets)
                self.tableView.reloadData()
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        cell.tweet = tweets![indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }

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
