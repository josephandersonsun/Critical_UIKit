//
//  RSIMain.swift
//  Critical_X_RSI
//
//  Created by Jadie Barringer III on 12/27/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class RSIMain: UIViewController {
   
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it into a circle
            /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
            closeButton.clipsToBounds = true
            closeButton.layer.cornerRadius = 6
        }
        
    }
    @IBOutlet weak var rsiTextField: UITextField! 
    @IBOutlet weak var rsiTitle: AKLabel!
    @IBOutlet weak var lungPicture: UIImageView!
    
    //Rounds the edges of the round button. 
    @IBOutlet weak var calculateButtonRadius : UIView! {
        didSet {
            calculateButtonRadius.clipsToBounds = true
            calculateButtonRadius.layer.cornerRadius = 4
        }
    }
    
    
    func animateNavBar()  {
        
        let fadeTextAnimation = CATransition()
        
        fadeTextAnimation.duration = 0.3
        
        fadeTextAnimation.type = CATransitionType.moveIn
        
        //        kCATransitionFade
        //        kCATransitionMoveIn
        //        kCATransitionPush
        //        kCATransitionReveal
        //
        
        /*
         The different date formats
         Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
         09/12/2018                        --> MM/dd/yyyy
         09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
         Sep 12, 2:11 PM                   --> MMM d, h:mm a
         September 2018                    --> MMMM yyyy
         Sep 12, 2018                      --> MMM d, yyyy
         Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
         2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
         12.09.18                          --> dd.MM.yy
         10:41:02.112                      --> HH:mm:ss.SSS
         */
        
        let date : Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d  |  h:mm a"
        let todaysDate = dateFormatter.string(from: date)
        
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        
        // Set the navigation title to the current date configuration.
        navigationController?.navigationBar.topItem?.title = todaysDate
        
        // navigationItem.title = "The Barringer Group ©"
    }
//    var calculatedNumber: String = ""
    
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1209579483, green: 0.1654035449, blue: 0.1951536536, alpha: 1)
    
        
        animateNavBar()

    }
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rsiTextField.textColor = #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1)
       
        //Function to run the RSI animation title.
        animateRSI()
        // Set the navigatin title
        //self.navigationItem.title = "The Barringer Group ©"
        
   
        


    }
    
  
    
    // Animates the rsiSubtitle once the view is loaded.
    func animateRSI() -> Void {
        
        //gets the name from the initial login and stores it.""
        //let username = UserDefaults.standard.value(forKey: "name")
        
        rsiTitle.font = UIFont(name: "HelveticaNeue-CondensedBold", size: 13)
        
        #if CALSTAR
        
        rsiTitle.animate(text: "CalStar - Rapid Sequence Intubation protocol", duration: 1, completion: nil)
        
        #else
        
        rsiTitle.animate(text: "Rapid Sequence Induction and Intubation", duration: 1, completion: nil)

        #endif
    }
    
    
    

    @IBAction func SettingClick(_ sender: Any) {
        
        // Presents the settings VC via Storyboard identifier to instantiate the view controller.
        let settingController = self.storyboard?.instantiateViewController(withIdentifier: "RSISetting") as! RSISetting
        self.present(settingController, animated: true, completion: nil)
    }
    
    
    
    
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        calculatedNumber = rsiTextField.text!
        
            ///// Checks the segue destination, grabs the number value from the textfield and passes the data.
            if let destination = segue.destination as? RSIDetail {
                
                //Takes the Double (weightEntered) variable from the detail page, and parses it as the textFireld (Double) becuase the textField is origionally casted as a string.
                destination.weightEntered = Double (rsiTextField.text!)
                
            }

        }
    
    @IBAction func calcualteGuard(_ sender: Any) {
        
        guard let txt = rsiTextField else {
            
         
            // Yellow Warning Alert // Takes the button and makes it into a circle
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")

            print("texfield is empty")
            
            return  }
    }
    
    
    
    /// Cancels the segue transition if the textBox is empty
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "RSI" {
            if (rsiTextField.text?.isEmpty)! || (rsiTextField.text == "0.0") {
                print("segue cancelled")
                
                // Yellow Warning Alert // Takes the button and makes it into a circle
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")

                return false
            }
        }
        
        // by default, transition
        return true
    }
    


    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    @IBAction func RSIVCDismiss(_ sender: Any) {
        self.view.endEditing(true) //This will hide the keyboard

        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
}


