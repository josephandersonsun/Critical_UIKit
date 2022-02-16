//
//  ClinicalReferences.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 11/1/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
import StoreKit
import SCLAlertView
import Lottie

class ClinicalReferences: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var toggleMenuButton: UIButton!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var darkFillView: UIView!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var infoBUtton: UIButton!
    @IBOutlet weak var lineViewLeft: UIView!
    @IBOutlet weak var lineViewRight: UIView!
    
    @IBOutlet weak var bookView: AnimationView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var startsView: AnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailButton.alpha = 0
        ratingButton.alpha = 0
        infoBUtton.alpha = 0
        
        infoLabel.alpha = 0
        rateLabel.alpha = 0
        emailLable.alpha = 0
        
        lineViewRight.alpha = 0
        lineViewLeft.alpha = 0
        
        menuView.clipsToBounds = true
        menuView.layer.cornerRadius = 6
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 6
        
        // Sets the lottie animation to play
        bookView.animation = Animation.named("books")
        // Executes the play
        bookView.play()
        
    }
    
    func  toggleButton()  {
        
        // 1 If alpha is 0 then make it 1 else make it zero
        let setNewAlpha = CGFloat (emailButton.alpha == 0 ? 1 : 0)
        
        
        emailButton.alpha = setNewAlpha
        
        ratingButton.alpha = setNewAlpha
        
        infoBUtton.alpha = setNewAlpha
        
        infoLabel.alpha = setNewAlpha
        
        rateLabel.alpha = setNewAlpha
        
        emailLable.alpha = setNewAlpha
        
        // 2
        animateLeftAndRightLines()
    }
    
    // Take 2 lines and animate linear one to left and right and go off screen
    func animateLeftAndRightLines()  {
        
        self.lineViewRight.alpha = 1
        
        self.lineViewLeft.alpha = 1
        
        UIView.animate(withDuration: 0.2, delay: 0.3, animations: {
            //1 show the view
            //Sets the lottie animation to play
            self.startsView.animation = Animation.named("stars")
            
            // Executes the play
            self.startsView.play()
            
            //2 animate one side of the view to the side of the menuView
            self.lineViewLeft.frame.size.width -= self.menuView.frame.size.width
            self.lineViewRight.frame.size.width += self.menuView.frame.size.width
            
            //3 - change the color of the view
            self.lineViewRight.backgroundColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            self.lineViewLeft.backgroundColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            
            print("Initial left Right line animation exectute")
            
        }) {(true) in
            
            // When the above is done animating then do this.
            //3 animate the other side of the view to the side of the menuView
            
            UIView.animate(withDuration: 0.5, animations: {
                //1 The backend of the view goes off screen
                self.lineViewLeft.frame.origin.x -= 350
                
                //2 The backend of the view goes off screen
                self.lineViewRight.center.x += 350
                
                //5- fade the lines
                self.lineViewRight.alpha = 0
                self.lineViewLeft.alpha = 0
                
                print("Completion animation of left Right line animation exectute")
                
            }, completion: {(true) in
                //completion code
            })
        }
    }
    
    
    @IBAction func toggleMenu(_ sender: Any) {
        
        // If the the button is default and  == idently, meaning no transform has been applied and its in its starting position
        if darkFillView.transform == .identity {
            
            // Dark Fill Filling up the menu view when we click the button
            UIView.animate(withDuration: 1, animations: {
                
                // 1 Transform the view and make it bigger using scale to make 11X bigger
                self.darkFillView.transform = CGAffineTransform(scaleX: 11, y: 11)
                
                //2  Translation is to change the object from one position to another without rotating or changing the objectself. go up use -Y and down + Y and keep x the same. Use how much Y is under the View controller
                self.menuView.transform = CGAffineTransform(translationX: 0, y: -69)
                
                //3 - Lets rotate the button in radians, using the func below .
                self.toggleMenuButton.transform = CGAffineTransform(rotationAngle: radians(degrees:180))
                
                // 4 - Animate the lines to go Left and Right
                self.animateLeftAndRightLines()
                
            }) { (true) in
                
                // Competion code
                UIView.animate(withDuration: 0.5, animations: {
                    
                    //1 - toggle button animated
                    self.toggleButton()
                    
                    //2 animate left and right
                    self.animateLeftAndRightLines()
                    
                })
                
            }
        }
            // When we click the button again, put the view back into a circle and make it transform back to the original position.
        else
        {
            UIView.animate(withDuration: 1, animations: {
                
                //1 Set the dark fill back to the starting position
                self.darkFillView.transform = .identity
                
                //2 set the menu back to the origional place
                self.menuView.transform = .identity
                
                //3 set the button back to the origional place
                self.toggleMenuButton.transform = .identity
                
                //4 Fade all of the buttons and labels to zero
                self.emailButton.alpha = 0
                self.ratingButton.alpha = 0
                self.infoBUtton.alpha = 0
                
                self.infoLabel.alpha = 0
                self.rateLabel.alpha = 0
                self.emailLable.alpha = 0
                
                
            }) { (true) in
                // Completion code
                UIView.animate(withDuration: 0.5, animations: {
                    // Enter complettion code
                })
            }
        }
        
        
        // takes the degrees and converts into radians
        func radians (degrees: Double) -> CGFloat {
            return CGFloat (degrees * .pi / 180)
        }
        
        
    } // end of class
    
    @IBAction func emailUs(_ sender: Any) {
        let mailComposeViewController = configureMailComposer()
        
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
            
        } else {
            print("Can't send email")
        }
    }
    
    
    //MARK: - Configure email
    func configureMailComposer() -> MFMailComposeViewController {
        
        let mailComposeVC = MFMailComposeViewController()
        mailComposeVC.mailComposeDelegate = self
        mailComposeVC.setToRecipients(["criticalusa@gmail.com"])
        mailComposeVC.setSubject("Critical-ABG feedback v1.0")
        mailComposeVC.setMessageBody("Hi, Great app. I would love to offer some constructive feedback to improve the functionality!", isHTML: false)
        print("Email was sent")
        
        return mailComposeVC
        
    }
    
    //MARK: - MFMail compose method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // 1 After the message has been sent dismiss the View Controller
        controller.dismiss(animated: true, completion: nil)
        
        //2 Show the alert that the message was sent
        // RED ALERT After the email view closes out we get a Thank you alert view.
        SCLAlertView().showTitle("Thank you!",
                                 subTitle: "Your message was sent to the Critical Team!",
                                 timeout: nil,
                                 completeText: "Done",
                                 style: .success,
                                 colorStyle: 0xD93829,//Critical Red
            colorTextButton: 0xFFFFFF, // White color
            circleIconImage: UIImage.init(named: "CriticalABG"),
            animationStyle: .topToBottom)
    }
    
    //MARK: - Rating button pressed
    @IBAction func ratingButton (_ sender: AnyObject) {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    // The code that will be exectued when someone taps the first button of the refresh Screen
    @objc func firstButton() {
        
        let disclaimer = """
        Please be aware that all information as provided as part of Critical – ABG programs are not meant for definitive diagnostic purposes. They should be rechecked and confirmed against your facilities guidelines, and protocols. Critical's program is not a substitute for clinical judgment or the standard–of–care. While the authors and producers of Critical strive to provide you with useful and accurate tools contained in this product, The Barringer group does not warrant and expressively disclaim that the information provided by this product is up–to–date, complete, or accurate.
        
        You agree to use the product only as an education aid and not to diagnose or treat a condition or as a substitute for any or to override the exercise of professional judgment by a healthcare professional. Given these possibilities of human errors or changes in medical science, you should confirm the information in the product through independent sources. The Barringer Group is not responsible for misdiagnosis of an element or misuse of treatment due to typographical or other errors in the product, user negligence or otherwise.
        
        You agree and acknowledge that you will, at all times, advise patients to seek professional diagnosis and treatment for any medical condition and to discuss information obtained for the product with healthcare providers. This product is, to the extent permitted by law, provided on an "as is" basis without warranties of any kind, express or implied, in the authors and producers of Critical ABG disclaims any liability, loss, or damage caused by it or its content. By continuing to use this product, you indicate your acceptance of these terms. Updated November 7, 2018
        """
        
        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        
        _ = SCLAlertView(appearance: appearance).showNotice("Disclaimer", subTitle: disclaimer)
        
        print("Discalimer the screen button tapped")
        // func that clears the screen and resets the values
    }
    
 
    
    // Alert
    @IBAction func infoButtonPressed(_ sender: Any) {
        
        let kSubtitle = "Thanks to all who helped made this app special!\n\n Check out our other comprehensive app on the AppStore \nCritical-Medical Guide \n\n Visit us at Critical-usa.com for more info, updates and feedback!"
        
        
        let alert = SCLAlertView()
        //1  add the first button and direct the tap to the functioncalled firstButton
        _ = alert.addButton("Disclaimer", target:self, selector:#selector(ABGViewController.firstButton))
        
        // 2 Opens  the critical app in the appStore
        _ = alert.addButton("Critical App") {
            print("Second button tapped")
            
            guard let url = URL(string: "https://itunes.apple.com/us/app/critical-medical-guide/id504065732?ls=1&mt=8") else {
                return //be safe
            }
            
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
            
            // Criticl Website
            print("Critical App button tapped")
            
        }
        
        // 3 Initiate the text to be passes
        let popUpTitle = "Info"
        
        // 4 Show the text on the alert
        _ = alert.showSuccess(popUpTitle, subTitle: kSubtitle)
        
    }
    
    // Dismiss the view
    @IBAction func disMIssReferenceVC(_ sender: Any) {
        
        UIView.animate(withDuration: 1.5) {
            self.dismiss(animated: true, completion: nil)
            print("Reference View Controller was dismissed")
        }
    }
    
    
    
    
}// End of the class
