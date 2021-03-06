//
//  AppDelegate.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 10/22/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var mainViewController: MenuViewController?
    var acceptViewController: AcceptViewController?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        mainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainView") as? MenuViewController
        acceptViewController = mainStoryboard.instantiateViewController(withIdentifier: "AcceptView") as? AcceptViewController
        
        
        if mainViewController == nil {
            print("mainViewController is nil")
        }
        if acceptViewController == nil {
            print("acceptViewController is nil")
        }
        
        let isAccepted = UserDefaults.standard.bool(forKey: "isAccepted")
        
        if isAccepted == false {
          switchToAcceptViewController()
       } else {
           switchToMainViewController()
       }
        return true
    }
    
    func switchToMainViewController() {
        //mainViewController?.selectedIndex = 0 // only needed if the main view controller is a tab view
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
    }
    func switchToAcceptViewController() {
        //mainViewController?.selectedIndex = 0 // only needed if the main view controller is a tab view
        self.window?.rootViewController = acceptViewController
        self.window?.makeKeyAndVisible()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

