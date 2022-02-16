//
//  onboardingVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/11/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

var usernameEntered = String ()


class OnboardingVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var subTitleLabelLabel: AKLabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//
//        if segue.identifier == "mainViewSegue" {
//            // We segue to ACLSVC and pass the infomation from which row is pressed
//            if let mainMenuController = segue.destination as? MainMenu_Collection {
//
//                // This is where we reference the object on the rec VC and set it to what we need to.
//                mainMenuController.usernameReceived = (nameTextField.text!)
//                print("user was selected")
//            }
//    }
   



}// End of the class
