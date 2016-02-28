//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Shakeel Daswani on 2/27/16.
//  Copyright © 2016 Shakeel Daswani. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var tweets: [Tweet]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
       // tableView.rowHeight = UITableViewAutomaticDimension
     //   tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeLine({ (tweets:[Tweet]) -> () in
            
            
            self.tweets = tweets
            for tweet in tweets {
                self.tableView.reloadData()
                print(tweet.text)
            }
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets!.count
        } else {
            return 0
        }
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
            cell.tweet = tweets![indexPath.row]
      
        
        return cell
        }
    
    
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
        
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
