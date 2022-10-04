//
//  TweetViewController.swift
//  Twitter
//
//  Created by Preston Barney on 10/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tweetTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: { self.dismiss(animated: true, completion: nil)}, failure: { Error in
                print("Error posting Tweet")
                self.dismiss(animated: true, completion: nil)
                
            })
        } else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    

}
