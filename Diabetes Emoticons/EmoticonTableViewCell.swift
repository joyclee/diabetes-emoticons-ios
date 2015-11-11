//
//  EmoticonTableViewCell.swift
//  Diabetes Emoticons
//
//  Created by Connor Krupp on 11/11/15.
//  Copyright © 2015 Connor Krupp. All rights reserved.
//

import UIKit

class EmoticonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func starPressed(sender: UIButton) {
        print("Star")
    }
    
    @IBAction func sharePressed(sender: UIButton) {
        print("Share")
    }
}
