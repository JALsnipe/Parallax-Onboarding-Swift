//
//  AppDelegate.swift
//  Parallax-Onboarding-Swift
//
//  Created by Josh Lieberman on 5/11/15.
//  Copyright (c) 2015 Josh Lieberman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // Setup skip onboarding notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "skipOnboarding:", name: "kDismissOnboardingNotification", object: nil)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "kDismissOnboardingNotification", object: nil)
    }

    func skipOnboarding(notification: NSNotification) {
        
        if let appContentVC = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("appContentVC") as? UIViewController {
            let overlayView: UIView = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
            appContentVC.view.addSubview(overlayView)
            self.window?.rootViewController = appContentVC
            UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
                overlayView.alpha = 0
            }, completion: { (finished) -> Void in
                overlayView.removeFromSuperview()
            })
        }
    }
}

