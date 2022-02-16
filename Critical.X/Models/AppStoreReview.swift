//
//  AppStoreReview.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/13/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//
//


import Foundation
import StoreKit

struct StoreReviewHelper {
    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        guard var appOpenCount = UserDefaults.value(forKey:"APP_OPENED_COUNT") as? Int else {
            UserDefaults.standard.set(1, forKey: "APP_OPENED_COUNT")
            return
        }
        appOpenCount += 1
        UserDefaults.standard.set(appOpenCount, forKey: "APP_OPENED_COUNT")
    }
    static func checkAndAskForReview() { // call this whenever appropriate
        // this will not be shown everytime. Apple has some internal logic on how to show this.
        guard let appOpenCount = UserDefaults.value(forKey: "APP_OPENED_COUNT") as? Int else {
            UserDefaults.standard.set(1, forKey: "APP_OPENED_COUNT")
            return
        }
        
        // This checks when the app is opened 10 times or the 50th time, it will prompt the rating. 
        switch appOpenCount {
        case 10,20,50:
            StoreReviewHelper().requestReview()
        case _ where appOpenCount%100 == 0 :
            StoreReviewHelper().requestReview()
        default:
            print("App run count is : \(appOpenCount)")
            break;
        }
        
    }
    fileprivate func requestReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            // Try any other 3rd party or manual method here.
        }
    }
}
