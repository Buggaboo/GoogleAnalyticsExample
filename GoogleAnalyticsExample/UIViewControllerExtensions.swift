//
//  UIViewControllerExtensions.swift
//
//  Created by MoonSangJoon on 2016. 2. 15..
//  -reference
// http://stackoverflow.com/questions/35230442/viewcontroller-title-is-nil-after-init-of-google-analytics/35400485#35400485


extension UIViewController {
    
    func setScreeName(name: String) {
        self.title = name
        self.sendScreenView(name)
    }

    func sendScreenView(screenName : String) {
//        let tracker = GAI.sharedInstance().defaultTracker
        
        let tracker = GAI.sharedInstance().trackerWithTrackingId(kMyTrackingID)
        tracker.set(kGAIScreenName, value: screenName)
        let builder = GAIDictionaryBuilder.createScreenView()
        tracker.send(builder.build() as [NSObject : AnyObject])
    }
    
    func trackEvent(category: String, action: String, label: String, value: NSNumber?) {
        let tracker = GAI.sharedInstance().defaultTracker
        let trackDictionary = GAIDictionaryBuilder.createEventWithCategory(category, action: action, label: label, value: value)
        tracker.send(trackDictionary.build() as [NSObject : AnyObject])
    }
}
