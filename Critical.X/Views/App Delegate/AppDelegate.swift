//
//  AppDelegate.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 10/22/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import Siren
import IQKeyboardManagerSwift

extension UIApplication {
    
    class func isFirstLaunch() -> Bool {
       
        if UserDefaults.standard.bool(forKey: "name") {
            UserDefaults.standard.set(true, forKey: "name")
            UserDefaults.standard.synchronize()
            return true
        }
        return false
    }
}

@UIApplicationMain


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
 
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UserDefaults.standard.value(forKey: "APP_OPENED_COUNT")
        
        UINavigationBar.appearance().tintColor = UIColor.white //your desired color here

      print("Did Finish launching")
        
        // Create the window for the onboarding screen
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // We make the call to check for anupdate only after the window
//        let siren = Siren.shared
//        siren.checkVersion(checkType: .immediately)

        Siren.shared.wail()
        
        #if CALSTAR
        let storyboard = UIStoryboard(name: "Main_CalStar", bundle: nil)
        #else
        // Here we say what story board we are coming from.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        #endif
        
        
        // Creating a variable for the viewController
        var vc: UIViewController
        
        // Conditional to set the name typed in and also to show it for the first time when the app is launched.
        if (UserDefaults.standard.value(forKey: "name") as? String) == nil {
            
            print("Username was entered- appDelegate")
            // show the onboarding screen, with the SB ID thats declared in the ViewController
            vc = storyboard.instantiateViewController(withIdentifier: "obBoardingVC")
        } else {
            // show the main menu screen
            vc = storyboard.instantiateInitialViewController()!
            print("Username was left blank - appDelegate")

            //vc = storyboard.instantiateViewController(withIdentifier: "obBoardingVC")
            
        }
        
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
        
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        
    
        
        return true
    }
    
}
    



