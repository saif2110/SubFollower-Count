//
//  AppDelegate.swift
//  SubFollower Count
//
//  Created by Junaid Mukadam on 17/05/21.
//

import UIKit
import IQKeyboardManager
import WidgetKit
import InAppPurchase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UserDefaults.standard.settimesOpen(value: UserDefaults.standard.gettimesOpen() + 1)
        
        IQKeyboardManager.shared().isEnabled = true
        
        let iap = InAppPurchase.default
        iap.addTransactionObserver(fallbackHandler: {_ in
            // Handle the result of payment added by Store
            // See also `InAppPurchase#purchase`
        })
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}

