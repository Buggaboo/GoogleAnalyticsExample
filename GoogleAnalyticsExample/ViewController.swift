//
//  ViewController.swift
//  GoogleAnalyticsExample
//
//  Created by MoonSangJoon on 2016. 2. 15..

//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        #if DEBUG
            
            print("ViewController")
            
        #endif
        
        // I called trackerWithTrackingId method in AppDelegate,
        // but defaultTracker value could be nil.
        // So, you got a error message like this :
        // fatal error: unexpectedly found nil while unwrapping an Optional value
        // According to google analytics documents, trackerWithTrackingId has an
        // initial value with nil, and then will be set with return value
        // from trackerWithTrackingId method call.
        // But it doesn't look work well.
        // To avoid this issue, I use trackerWithTrackingId once again instead of defaultTracker.
        
        guard GAI.sharedInstance().defaultTracker.isEqual(nil) else{
            #if DEBUG
                
                print("It's a default tracker")
                return
            #endif
        }
        
        self.sendScreenView("MyScreen")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

