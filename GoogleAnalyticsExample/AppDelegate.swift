//
//  AppDelegate.swift
//  GoogleAnalyticsExample
//
//  Created by MoonSangJoon on 2016. 2. 15..

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // config google analytics
        setupGoogleAnalytics()
        
        return true
    }

    /**
     configure Google Analytics
     */
    // -references
    // https://blog.hello-world.jp.net/ios/3560/
    // http://ichigoro.hatenablog.com/entry/2016/02/06/093613
    
    func setupGoogleAnalytics() {
        
        // pod 'Google/Analytics'
//        let configureError:NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(configureError)")
//        
//        let gai = GAI.sharedInstance()
//        gai.trackUncaughtExceptions = true  // report uncaught exceptions
//        gai.logger.logLevel = GAILogLevel.Verbose  // remove before app release
        
        
        // pod 'GoogleAnalytics'
        let tracker = GAI.sharedInstance().trackerWithTrackingId(kMyTrackingID)
        GAI.sharedInstance().trackUncaughtExceptions = true;
        
        // default dispatchInterval is 120
        
        #if DEBUG
            
            GAI.sharedInstance().dispatchInterval = 1
            GAI.sharedInstance().logger.logLevel = .Warning //.Verbose
            
            // disable sending data to Google. 
            // very useful option for debugging.
            GAI.sharedInstance().dryRun = true
            
        #endif

        
        // check defaultTacker property
        let firstTracker = GAI.sharedInstance().defaultTracker
        
        if tracker.isEqual(firstTracker) {
            #if DEBUG
                
                print("same Tracker")
                
            #endif
        }
    }
    
    
    // optimzation for dispatching queue
    // default dispatchInterval is 120
    // dispatch(), which lets you send all the hits that are currently in the dispatch queue. 
    // So, by combining these two, you can empty the queue whenever the app is about to enter 
    // the background or terminate!
    // - reference : http://www.simoahava.com/analytics/useful-gtm-for-ios-tips/
    
    func applicationDidEnterBackground(application: UIApplication) {
        GAI.sharedInstance().dispatch()
    }


    func applicationWillTerminate(application: UIApplication) {
        GAI.sharedInstance().dispatch()
    }


}

