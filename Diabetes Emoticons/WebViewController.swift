//
//  WebViewController.swift
//  Diabetes Emoticons
//
//  Created by Connor Krupp on 11/30/15.
//  Copyright © 2015 Connor Krupp. All rights reserved.
//

import UIKit

class WebViewController : UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    
    var url = "http://healthdesignby.us"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = NSURLRequest(URL: NSURL(string: url)!)
        webView.loadRequest(request)
    }
}
