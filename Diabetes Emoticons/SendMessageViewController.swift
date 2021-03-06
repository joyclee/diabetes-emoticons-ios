//
//  SendMessageViewController.swift
//  Diabetes Emoticons
//
//  Created by Connor Krupp on 11/30/15.
//  Copyright © 2015 Connor Krupp. All rights reserved.
//

import UIKit
import MessageUI

class SendMessageViewController : UIViewController, UITextViewDelegate, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        placeButton()
        textView.becomeFirstResponder()
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
    func placeButton() {
       
        let x = self.view.frame.width - 80
        let y = self.view.frame.height - 80 - self.tabBarController!.tabBar.frame.height
        print(self.tabBarController!.view.frame.height)
        let button = UIButton(frame: CGRect(x: x, y: y, width: 60, height: 60))
        button.setImage(UIImage(named: "circle_send_text"), forState: .Normal)
        button.tag = 1
        button.addTarget(self, action: "sendMessage:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    
    }
    
    func sendMessage(_: UIButton) {
        let emailTitle = "Diabetes Emoticons Feedback"
        // Email Content
        let messageBody = textView.text
        // To address
        let toRecipents = ["test@healthdesignby.us"]
        
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self;
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: false)
        mc.setToRecipients(toRecipents)
        self.presentViewController(mc, animated: true, completion: nil)

    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            let button = self.view.viewWithTag(1) as! UIButton
            let x = self.view.frame.width - 80
            let y = self.view.frame.height - 80 - keyboardSize.height
            button.frame = CGRect(x: x, y: y, width: 60, height: 60)

        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        let button = self.view.viewWithTag(1) as! UIButton
        let x = self.view.frame.width - 80
        let y = self.view.frame.height - 80 - self.tabBarController!.tabBar.frame.height
        button.frame = CGRect(x: x, y: y, width: 60, height: 60)
    }
    
}
