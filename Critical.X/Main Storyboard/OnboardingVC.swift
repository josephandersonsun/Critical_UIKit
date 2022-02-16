//
//  onboardingVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/11/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
import OnboardKit

var usernameEntered = String ()


class OnboardingVC: UIViewController, UITextFieldDelegate {
    
   
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var newButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var subTitleLabelLabel: AKLabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
    
    }
    
    lazy var onboardingPages: [OnboardPage] = {
        let pageOne = OnboardPage(title: "Welcome to Critical",
                                  imageName: "onboardingLogoCircle",
                                  description: "We hope you'll love the new update and features. We've added many customizable features to ensure the best clinical experience! Swipe to check out what's new!")
        
        let pageTwo = OnboardPage(title: "Customize Drip Doses",
                                  imageName: "updateDosages",
                                  description: "Now users have the ability to customize and to see the concentration of the medication and mL's to be administered. Simply just swipe left!")
        
        let pageThree = OnboardPage(title: "New Settings in RSI",
                                    imageName: "settingsDemo",
                                    description: "By going to the RSII settings, It's now possible to fully customize the RSI doses to match your local protocols")
        
        let pageFour = OnboardPage(title: "New Ultrasound",
                                   imageName: "onboardUltrasound",
                                   description:  "Are you new to using the ultrasound machine? No problem! We've got you covered with a comprehensive overview of the different landmarks and views!")
                                  
        let pageFive = OnboardPage(title: "Ventricular Assist Devices",
                                   imageName: "vadsDemo",
                                   description:  "Not up-to-date on vads? Check out the new information and guidlines on vads in the cardiac section!")
        
        
        
        let pageSix = OnboardPage(title: "All Ready",
                                   imageName: "Onboarding5",
                                   description: "You are all set up and ready to use Critical. Let's begin by adding your name.",
                                   advanceButtonTitle: "Done")
        
        return [pageOne, pageTwo, pageThree, pageFour, pageFive, pageSix]
    }()
    
    
    
    @IBAction func showOnboarding(_ sender: Any) {
        let onboardingVC = OnboardViewController(pageItems: onboardingPages)
        onboardingVC.modalPresentationStyle = .formSheet
        onboardingVC.presentFrom(self, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)

        nameTextField.delegate = self
        
        
       
        
        //animate the button
        showAnimateButton()
        print("Onbaording opening of the first time")

    }
    
// When someone types in the textField. We change the color of the letsgo button. 
    @IBAction func TextFieldValueChanged(_ sender: Any) {
        
        if ((sender as AnyObject).text?.count)! > 0 {
            letsGoButton.backgroundColor = #colorLiteral(red: 0.3411764706, green: 0.6549019608, blue: 0.4509803922, alpha: 1)
            print("Someone is typing their name")
        } else {
            letsGoButton.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            print("text is empty")

        }
        
    }
    
    
   
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimateButton()
    {
        // Animation for the Results UIView
        self.newButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.newButton.alpha = 0.0;
        UIView.animate(withDuration: 2.0, animations: {
            self.newButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            self.newButton.alpha = 1.0
            self.newButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
      
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    
// When the done button is pressed on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Dismiss the keyboard
        textField.resignFirstResponder()
        
        // Animation the lets go button
        self.letsGoButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.letsGoButton.alpha = 0.0;
        
        UIView.animate(withDuration: 1.0, animations: {
          
            self.letsGoButton.alpha = 1.0
            self.letsGoButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        return true
    }
    
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func hideKeyboard()  {
        nameTextField.resignFirstResponder()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 100)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 100)
    }
    
    
    /// Keyboard Dismissed after you touch the screen
 
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        
        let movementDuration:TimeInterval = 0.3
        
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(movementDuration )
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
    }
    
    
    /**
     Animate Label
     
     - Remark: Animates a UILabel using the AKLabel file.
     - SeeAlso: https://github.com/akshaysyaduvanshi/AKLabel
     - Requires: AKLabel.swift file to function. Need to also change the outlet to the AKLabel subclass.
     - Warning: If the subclass is not changed, or the IBOutlet doesnt reflect the AKLabel as well as importing the label, it will crash.
     **/
   
    override func viewDidAppear(_ animated: Bool) {
    
        let subtititleText = "Let's personalize your experience. Enter your name to get started ! "
        
        subTitleLabelLabel.animate(text: subtititleText, duration: 2, completion: nil)
     
        //animates the welcome label
        showAnimate()
    }
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimate()
    {
        // Animation for the Results UIView
        self.welcomeLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.welcomeLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 0.5, animations: {
            self.welcomeLabel.alpha = 1.0
            self.welcomeLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
       
        
    }

// Function for the button lets go.
    @IBAction func letsGoButtonTouched(_ sender: Any) {
        
        //Can add a guard statement is nothing is in the textbox to go to the main screen.
        guard let theText = nameTextField.text, theText.isEmpty else {
            // If the textField is filled in then do the following actions.
            self.performSegue(withIdentifier: "mainViewSegue", sender: self)
            
            // SEt the name to the userDefaults
            UserDefaults.standard.set(nameTextField.text, forKey: "name")
            
            // Print the name entered
            print("The name \(UserDefaults.standard.set(nameTextField.text, forKey: "name")) was enetered")

            return // or throw
        }
        
        
        
        //
        
        // If the textField is empty then do the following actions.
        nameTextField.text = ""
        
        _ = SCLAlertView().showError("Hold On...", subTitle:"Please enter your name so we can help personalize your experience. We promise that we don't save your info.", closeButtonTitle:"OK")
     
        
        print("The name \(UserDefaults.standard.set(nameTextField.text, forKey: "name")) was enetered")
    }
    
    @IBAction func skipButtonPressed(_ sender: Any) {
       
      //username = nil
        if (nameTextField.text?.isEmpty)! {
            
            // Set the name to be blank
            nameTextField.text = ""
            
            // Tranisition
            performSegue(withIdentifier: "mainViewSegue", sender: self)
            // Set the user default to blank
            UserDefaults.standard.set(nameTextField.text, forKey: "name")
            
            print("Name was left blank in the name field")

        }
      
    }
    

}// End of the class
