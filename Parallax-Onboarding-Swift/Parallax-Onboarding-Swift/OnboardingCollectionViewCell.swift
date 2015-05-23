//
//  OnboardingCollectionViewCell.swift
//  Parallax-Onboarding-Swift
//
//  Created by Josh Lieberman on 5/23/15.
//  Copyright (c) 2015 Josh Lieberman. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    
    @IBAction func getStarted(sender: AnyObject) {
        
    NSNotificationCenter.defaultCenter().postNotificationName("kDismissOnboardingNotification", object: self)
    }
}
