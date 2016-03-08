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
        
     //   let refreshControl = UIRefreshControl()
        
    
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        TwitterClient.sharedInstance.homeTimeLine({ (tweets:[Tweet]) -> () in
            self.tweets = tweets
            for tweet in tweets {
             //   self.tableView.reloadData()
                print(tweet.text)
                self.tableView.reloadData()
            }
            }) { (error: NSError) -> () in
                print(error.localizedDescription)
        }
    }


        // Do any additional setup after loading the view.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    
    func refreshControlAction(refreshControl: UIRefreshControl) {
        
        // ... Create the NSURLRequest (myRequest) ...
        
        // Configure session so that completion handler is executed on main UI thread
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (data, response, error) in
                
                // ... Use the new data to update the data source ...
                
                // Reload the tableView now that there is new data
                self.myTableView.reloadData()
                
                // Tell the refreshControl to stop spinning
                refreshControl.endRefreshing()	
        });
        task.resume()
    }
    
*/
    
    
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
      
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
        }
    
    
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
         self.tableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "details") {
            
       let cell = sender as! UITableViewCell
       let indexPath = tableView.indexPathForCell(cell)
       let tweet = tweets![indexPath!.row]
       let detailViewController = segue.destinationViewController as! TweetInfoViewController
        detailViewController.tweet = tweet
            print("prepare for segue called")
            
        }
        
        if(segue.identifier == "profile") {
            
       let cell = sender as! UIButton
          //let tweet = tweets![indexPath!.row]
          //  let detailViewController = segue.destinationViewController as! TweetInfoViewController
          //  detailViewController.tweet = tweet
            print("prepare for segue called")
            
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
