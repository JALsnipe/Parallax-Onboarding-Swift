//
//  ViewController.swift
//  Parallax-Onboarding-Swift
//
//  Created by Josh Lieberman on 5/11/15.
//  Copyright (c) 2015 Josh Lieberman. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    @IBOutlet weak var onboardingPageControl: UIPageControl!
    
    @IBOutlet weak var onboardingSkipButton: UIButton!
    
    var onboardingBackgroundScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.onboardingCollectionView.delegate = self
        self.onboardingCollectionView.dataSource = self
        
        // Register cells
        
        // Background view setup
        let backgroundImage: UIImage! = UIImage(named: "bg_onboarding_gradient")
        let backgroundImageView: UIImageView! = UIImageView(image: backgroundImage)
        backgroundImageView.frame = CGRectMake(0.0, 0.0, backgroundImageView.frame.size.width, backgroundImageView.frame.size.height)
        
        // Set scroll view frame to the size of the image
        self.onboardingBackgroundScrollView.frame = self.view.frame
        self.onboardingBackgroundScrollView.addSubview(backgroundImageView)
        self.onboardingBackgroundScrollView.contentSize = backgroundImage.size
        self.onboardingBackgroundScrollView.userInteractionEnabled = false
        self.onboardingBackgroundScrollView.showsHorizontalScrollIndicator = false
        self.onboardingBackgroundScrollView.showsVerticalScrollIndicator = false
        
        // Set origin and height of scroll view to devivice-specific values
        self.onboardingBackgroundScrollView.frame = CGRectMake(0.0, 0.0, self.onboardingBackgroundScrollView.frame.size.width, self.onboardingBackgroundScrollView.frame.size.height)
        
        self.view.addSubview(self.onboardingBackgroundScrollView)
        self.view.sendSubviewToBack(self.onboardingBackgroundScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func skipOnboarding(sender: AnyObject) {
        NSNotificationCenter.defaultCenter().postNotificationName("kDismissOnboardingNotification", object: self)
    }
}

// MARK: UICollectionViewDelelgate Methods

extension OnboardingViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell :UICollectionViewCell!
        
        switch indexPath.row {
        case 0:
            // TODO: cell 1
            return cell
            
        case 1:
            // TODO: cell 2
            return cell
            
        case 3:
            // TODO: cell 3
            return cell
            
        default:
            return cell;
        }
    }
}

// MARK: UICollectionViewFlowLayout Methods

extension OnboardingViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.onboardingCollectionView.frame.size.width, self.onboardingCollectionView.frame.size.height)
    }
}

// MARK: UIScrollVewDelegate for UIPageControl

extension OnboardingViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if (scrollView.isKindOfClass(UICollectionView)) {
            let percentScrolled: CGFloat! = fabs(scrollView.contentOffset.x / scrollView.contentSize.width)
            
            // TODO: Math here
        }
    }
}

