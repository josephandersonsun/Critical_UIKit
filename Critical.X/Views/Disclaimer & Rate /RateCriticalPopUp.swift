//
//  RateCriticalPopUp.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 12/4/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit
import OnboardKit




class RateCriticalPopUp: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var whatsNew: UIButton!
    
   
    
    @IBOutlet weak var popUpView: UIView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        /// Rounds the corners 15 pixels of the UIView named: popUpView
//        popUpView.clipsToBounds = true
//        popUpView.layer.cornerRadius = 15
      

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rateCritical (_ sender: Any) {
        
        /// Rating pops up to rate the app.
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
    }
    
    
    
    @IBAction func dismissPopUpVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
       
    }
    @IBAction func sendEmailFeedback(_ sender: Any) {
        
        sendEmail()

    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController()
            
            // Swift 4
            let version : Any! = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
            let build : Any! = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
            
            
            mail.mailComposeDelegate = self
            
            mail.setToRecipients(["criticalusa@gmail.com"])
            
            // Subject that puts the build in the email.
            mail.setSubject("Critical Feedback: IOS Version: \(String(describing: build!))")
            
            //mail.setMessageBody("<p>Hi, Great app. I would love to offer some constructive feedback to improve the functionality.</p>", isHTML: true)
            
            
            print("Version: \(String(describing: version))")
            
            print("Build: \(String(describing: build))")
            
            present(mail, animated: true)
        
        } else {
            // show failure alert
        }
      
        }
    
    
 
    // Dismissed the controller
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        // Dismiss the email controller
        controller.dismiss(animated: true)
        
        // Show the alert
        SCLAlertView().showTitle("Thank you!",
                                 subTitle: "Your message was sent to the Critical Team!",
                                 timeout: nil,
                                 completeText: "Thanks!",
                                 style: .success,
                                 colorStyle: 0xD93829,//Critical Red
            colorTextButton: 0xFFFFFF, // White color
            circleIconImage: UIImage.init(named: "Critical_Logo_OutlineNavy"),
            animationStyle: .topToBottom)

    }
    

    
    //MARK: - Critical Dream Team Button
    @IBAction func criticalDreamTeamButtonClicked(_ sender: Any) {
        
        // Bitly link for dream-critical.com, Opens the webView outside the app no VC
        if let url = URL(string: "https://bit.ly/2EB2M9b") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    //MARK: - Onboarding SetUp
    
    lazy var onboardingPages: [OnboardPage] = {
        let pageOne = OnboardPage(title: "Welcome to Critical",
                                  imageName: "onboardingLogoCircle",
                                  description: "We hope you'll love the new update and features. We've added many customizable features to ensure the best clinical experience! Swipe to check out what's new!")
        
        let pageTwo = OnboardPage(title: "Customize Drip Doses",
                                  imageName: "updateDosages",
                                  description: "Now have the ability customize and to see the concentration of the medication and mL's to be administered. Simply just swipe left!")
        
        let pageThree = OnboardPage(title: "New Settings in RSI",
                                    imageName: "settingsDemo",
                                    description: "By going to the RSI settings, It's now possible to fully customize the RSI doses to match your local protocols")
        
        let pageFour = OnboardPage(title: "New Ultrasound",
                                   imageName: "onboardUltrasound",
                                   description:  "Are you new to using the ultrasound machine? No problem! We've got you covered with a comprehensive overview of the different landmarks and views!")
        
        let pageFive = OnboardPage(title: "Ventricular Assist Devices",
                                   imageName: "vadsDemo",
                                   description:  "Not up-to-date on Vads? Check out the new information and guidlines on VADs in the cardiac section!")
        
        
        
        let pageSix = OnboardPage(title: "All Ready",
                                  imageName: "Onboarding5",
                                  description: "That's it! Enjoy all of the new features. Let us know if you have any general issues or feedback. Thanks for using Critical!",
                                  advanceButtonTitle: "Done")
        
        return [pageOne, pageTwo, pageThree, pageFour, pageFive, pageSix]
    }()
    
    
    
    //MARK: - Click Whats new
    @IBAction func clickedWhatsNew(_ sender: Any) {
        
        let onboardingVC = OnboardViewController(pageItems: onboardingPages)
        onboardingVC.modalPresentationStyle = .formSheet
        onboardingVC.presentFrom(self, animated: true)
        

    }
    
    
    

}
