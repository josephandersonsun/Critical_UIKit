//
//  UrineOutput.swift
//  UrineOutputCalculator
//
//  Created by Jadie Barringer III on 1/1/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit


class UrineOutput: UIViewController {
    
    // Outlets
    @IBOutlet weak var segmentWeight: CustomSegmentedController?
    @IBOutlet weak var segmentUrineOutput: CustomSegmentedController?
    @IBOutlet weak var liters_mL_Label: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var urineOurputTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var closeButtonMain: UIButton!

    @IBOutlet weak var calculateButton: UIButton!
    
    var finalCalculation:Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Takes the button and makes it into a circle
        closeButtonMain.layer.cornerRadius = closeButtonMain.frame.size.width / 2
    
        /// Rounds the corners 15 pixels of the UIView name
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
        segmentWeight?.items = ["Adult", "Peds"]
        segmentUrineOutput?.items = ["mL", "Liters"]
    }
    
    func urineOutputFormula(weight: Double, UrineOutput: Double, Time: Double) -> Double {
        
        var urineOut: Double {return (Time / (weight * 24))}
        
        return urineOut
  }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    func calculateHourlyOutput() -> Double {
        let urineOutput = Double(urineOurputTextField.text!)
        let time = Double(hoursTextField.text!)
        
        guard let _  = urineOutput, let _ = time else {
            
            _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
            
            print("No UO or time entered")
            return 0 }
        return urineOutput! / time!
    }

    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        ///// Checks the segue destination, grabs the number value from the textfield and passes the data.
        if let destination = segue.destination as? UrineOutputData {
            
            //Im setting the result of the UO to equal the var result on the rec VC
            destination.result = finalCalculation
            
            //Sets the avgUrineOutput ariable on the data swift file ( which is a double) as calculatedHourlyOutput
            destination.avgUrineOutput = calculateHourlyOutput()
        }
        
        if segue.identifier == "urineSegue" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let urineOutputData = segue.destination as? UrineOutputData {
                
                
                switch (segmentWeight?.selectedIndex, segmentUrineOutput?.selectedIndex) {
                    
                // Need to use ? because of the optional in the Custom segment IBOutlet
                case (0?,0?): // Adult mLs
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 0
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    urineOutputData.idBlock = id
                   
                    //setting textField to variables to be used in the calculation
                    let weight = Double(weightTextField.text!)
                    let urineOutput = Double(urineOurputTextField.text!)
                    let time = Double(hoursTextField.text!)
                    
                   
                    
                    urineOutputData.result = Double (urineOutput! / (weight! * time!))
                    
                case (0?,1?): // Adult Liters
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 1
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    urineOutputData.idBlock = id
                    
                    
                    //setting textField to variables to be used in the calculation
                    let weight = Double(weightTextField.text!)
                    let time = Double(hoursTextField.text!)
                    let urineOutputLitersConversion = Double(urineOurputTextField.text!)! * 1000

                    
                    //Sets up the hourly urine output converseion from Liters to ML
                    urineOutputData.avgUrineOutput = urineOutputLitersConversion / time!
                    
                    urineOutputData.result = Double (urineOutputLitersConversion / (weight! * time!))
                
                case (1?,0?):// Peds mLs
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 2
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    urineOutputData.idBlock = id
                    
                    
                    //setting textField to variables to be used in the calculation
                    let weight = Double(weightTextField.text!)
                    let urineOutput = Double(urineOurputTextField.text!)
                    let time = Double(hoursTextField.text!)
                    
                    urineOutputData.result = Double (urineOutput! / (weight! * time!))
                    
                    
                case (1?,1?): // Peds Liters
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 3
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    urineOutputData.idBlock = id
                    
                    //setting textField to variables to be used in the calculation
                    let weight = Double(weightTextField.text!)
                    let urineOutputLitersConversion = Double(urineOurputTextField.text!)! * 1000
                    let time = Double(hoursTextField.text!)
                    
                    
                    //Sets up the hourly urine output converseion from Liters to ML
                    urineOutputData.avgUrineOutput = urineOutputLitersConversion / time!

                
                    urineOutputData.result = Double (urineOutputLitersConversion / (weight! * time!))
                    
                default:
                    break;
                }
            }
       }
  }
    
    @IBAction func UrineSegmentChange(_ sender: Any) {
    
        switch segmentUrineOutput?.selectedIndex {
        case 0?: // Need to use ? because of the optional in the Custom segment IBOutlet
//            liters_mL_Label.text = "mL"
            urineOurputTextField.placeholder = "mL"
        case 1?:
//            liters_mL_Label.text = "L"
            urineOurputTextField.placeholder = "L"

        default:
            break
        }
    
    }
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    @IBAction func calculateAction(_ sender: Any) {
        
    guard let theWeight = weightTextField.text, theWeight.isEmpty,  let theHours = hoursTextField.text, theHours.isEmpty, let Urine = urineOurputTextField.text, Urine.isEmpty else {
        
       
            print("Paramaters variables are not met"); return }
       
        weightTextField.text = "0"; urineOurputTextField.text = "0"; hoursTextField.text = "0"
        
        
        _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate weight greater than zero to calculate", closeButtonTitle:"OK")
        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
        
        
    }
    
//    /// Cancels the segue transition if the textBox is empty
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        if identifier == "urineSegue" {
//            if (weightTextField.text?.isEmpty)! || (urineOurputTextField.text == "0.0") || (urineOurputTextField.text?.isEmpty)! || (weightTextField.text == "0.0") {
//                print("segue cancelled")
//                return false
//            }
//        }
//
//        // by default, transition
//        return true
//    }
    

    
    @IBAction func dismissMainUrineOutputMain(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
}//end of the class

extension UrineOutput {
    
    /// Also works covering both conditions in one line of code.
    
    /// Cancels the segue transition if the textBox is empty
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "urineSegue" {
            if (weightTextField.text?.isEmpty)! || (hoursTextField.text?.isEmpty)! || (hoursTextField.text?.isEmpty)!  || (urineOurputTextField.text == "0.0") || (weightTextField.text == "0.0") || (hoursTextField.text == "0.0") {
                
                print("segue cancelled")
                
               
        
                _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate weight greater than zero to calculate", closeButtonTitle:"OK")
                
                
                return false
            }
        }
        
        // by default, transition
        return true
    }
    

}
