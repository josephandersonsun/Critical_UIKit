//
//  ViewController.swift
//  FreeWaterDeficit
//
//  Created by Jadie Barringer III on 12/31/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

class FreeWaterDeficitDetail: UIViewController {
    
    //Outlets
    @IBOutlet weak var freeWaterResultLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var freeWaterView: UIView!
    @IBOutlet weak var iVFlowRateTxt: UILabel!
    @IBOutlet weak var deficitLabel: UILabel!
    
    //variables
    var resultChildMale:Double?
    var resultAdultMale:Double?
    var resultElderlyMale:Double?
    
    var resultChildFemale:Double?
    var resultAdultFemale:Double?
    var resultElderlyFemale:Double?
    var deficitLabelText: String?
    
    var negPos = String()
    var weight: Double?
    var desiredNa: Double?
    var currentNa: Double?
    var idBlock: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        iVFlowRateTxt.clipsToBounds = true
        //
        //        iVFlowRateTxt.layer.cornerRadius = 2
        
        // here we round the top of the free Water deficit view only
        freeWaterView.clipsToBounds = true
        
        freeWaterView.layer.cornerRadius = 5
        // Only curves the top of the view
        //freeWaterView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        deficitLabel.text = deficitLabelText
        // calls the method below to be executed.
        freeWaterCalculations()
    }
    
    func freeWaterCalculations(){
        
        //Guard statemtent for the Optional values only.// When  weight parameter is only met
        guard let _ = weight, let _ = currentNa, let _ = desiredNa  else {
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")
            
            freeWaterResultLabel.text = "Error!"
            iVFlowRateTxt.text = "Please all the values, then calculate"
            
            print("One of the textFrield parameters missing")
            print("")
            
            
            return } // All enacting code runs afer here.
        
        print("All input parameters were met. Results calculated.")
        print("")// Makes space in the console
        print("Weight is \(String(weight!)) kg")
        print("")
        print("Current Na is \(String(currentNa!))")
        print("")
        print("Desired Na is \(String(desiredNa!))")
        print("Weight is \(String(weight!)) kg")
        print("")
        print("Current Na is \(String(currentNa!))")
        print("")
        print("Desired Na is \(String(desiredNa!))")
        
        //Calculates the time it takes to correct the Na in hours.
        let hoursToCorrectSodium =  (currentNa! - desiredNa!) / 0.5
        
        //Switching on idBlock on the sending VC. That way we can
        switch idBlock { // Takes the ID block number in the IF statement from the sending VC and we can reference it here.
            
            
            
            
            
            
        //Male Calculations
        case 1: //Mark:Male Child
            
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultChildMale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
                
            } else {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                let ChildMale = String(format:"%.1f",resultChildMale!)
                
                let infusionRate = (resultChildMale! / hoursToCorrectSodium) * 1000
                
                //Check the result to see if its +/- and change the text
                if let result = resultChildMale, result > 0 {
                    
                    negPos = "positive"
                    
                    //let infusionRate = String(format:"%.1f",infusionRate1)
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultChildMale, result < 0 {
                    
                    negPos = "negative"
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                freeWaterResultLabel.text = ChildMale + " Liters"
                
                
                
                
                
                print("Child Male is " + ChildMale + " L")
                
                print("")
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
            }
        case 2: //Mark:Male Adult
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultAdultMale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
            } else {
                
                
                let AdultMale = String(format:"%.1f",resultAdultMale!)
                
                freeWaterResultLabel.text = AdultMale + " Liters"
                
                let infusionRate = (resultAdultMale! / hoursToCorrectSodium) * 1000
                
                //let infusionRate = String(format:"%.1f",infusionRate1)
                iVFlowRateTxt.text = "IV flow rate of \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium) hrs."
                
                //Check the result to see if its +/- and change the text
                if let result = resultAdultMale, result > 0 {
                    
                    negPos = "positive"
                    
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultAdultMale, result < 0 {
                    
                    negPos = "negative"
                    
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                print("Adult Male is " + AdultMale + " Liters")
                
                print("")
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
            }
            
        case 3: //Mark:Male Elderly
            
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultElderlyMale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
            } else {
                
                
                let ElderlyMale = String(format:"%.1f",resultElderlyMale!)
                
                
                freeWaterResultLabel.text = ElderlyMale + " Liters"
                
                
                let infusionRate = (resultElderlyMale! / hoursToCorrectSodium) * 1000
                
                
                
                //let infusionRate = String(format:"%.1f",infusionRate1)
                iVFlowRateTxt.text = "IV flow rate of \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium) hrs."
                
                //Check the result to see if its +/- and change the text
                if let result = resultElderlyMale, result > 0 {
                    
                    negPos = "positive"
                    
                    
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultElderlyMale, result < 0 {
                    
                    negPos = "negative"
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                print("Elderly Make is " + ElderlyMale + " Liters")
                
                print("")
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
            }
            
        //Female Calculations
        case 4: //Mark:Female Child
            
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultChildFemale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
            } else {
                
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                let ChildFemale = String(format:"%.1f",resultChildFemale!)
                
                freeWaterResultLabel.text = ChildFemale + "Liters"
                
                let infusionRate = (resultChildFemale! / hoursToCorrectSodium) * 1000
                
                //let infusionRate = String(format:"%.1f",infusionRate1)
                iVFlowRateTxt.text = "IV flow rate of \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium) hrs."
                
                
                //Check the result to see if its +/- and change the text
                if let result = resultChildFemale, result > 0 {
                    
                    negPos = "positive"
                    
                    //let infusionRate = String(format:"%.1f",infusionRate1)
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultChildFemale, result < 0 {
                    
                    negPos = "negative"
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                
                print("Child female is " + ChildFemale + " Liters")
                
                print("")
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
            }
            
            
        case 5: //Mark:Female Adult
            
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultAdultFemale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
            } else {
                
                let AdultFemale = String(format:"%.1f",resultAdultFemale!)
                
                freeWaterResultLabel.text = AdultFemale + " Liters"
                
                let infusionRate = (resultAdultFemale! / hoursToCorrectSodium) * 1000
                
                //let infusionRate = String(format:"%.1f",infusionRate1)
                iVFlowRateTxt.text = "IV flow rate of \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium) hrs."
                
                
                //Check the result to see if its +/- and change the text
                if let result = resultAdultFemale, result > 0 {
                    
                    negPos = "positive"
                    
                    //let infusionRate = String(format:"%.1f",infusionRate1)
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultAdultFemale, result < 0 {
                    
                    negPos = "negative"
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                
                print("Adult female is " + AdultFemale + " Liters")
                
                print("")
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
                
            }
            
            
            
        case 6: //Mark:Female Elderly
            
            
            // If the calculation turns out to be "Not a Number (NaN) then it will be zero, else we calculate
            if resultElderlyFemale!.isNaN {
                // Since we cant add a string to the end of the format, We just create another instance and add Liters later in the label.
                
                freeWaterResultLabel.text = "Euvolemic"
                
                iVFlowRateTxt.text = ""
                
            } else {
                
                let ElderlyFemale = String(format:"%.1f",resultElderlyFemale!)
                
                freeWaterResultLabel.text =  ElderlyFemale + " Liters"
                
                let infusionRate = (resultElderlyFemale! / hoursToCorrectSodium) * 1000
                
                //let infusionRate = String(format:"%.1f",infusionRate1)
                iVFlowRateTxt.text = "IV flow rate of \((infusionRate).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium) hrs."
                
                
                //Check the result to see if its +/- and change the text
                if let result = resultElderlyFemale, result > 0 {
                    
                    negPos = "positive"
                    
                    //let infusionRate = String(format:"%.1f",infusionRate1)
                    iVFlowRateTxt.text = "IV flow rate of \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium ) hrs."
                }
                
                if let result = resultElderlyFemale, result < 0 {
                    
                    negPos = "negative"
                    
                    iVFlowRateTxt.text = "Diurese the patient \((infusionRate ).oneDecimalPlace) cc/hr for \(hoursToCorrectSodium * -1 ) hrs."
                }
                
                deficitLabel.text = "This patient has a \(negPos) deficit of:"
                
                
                print("IV flow rate of \(infusionRate) cc/hr for \(hoursToCorrectSodium) hrs.")
                
                print("")
                
                print("Elderly Female is " + ElderlyFemale + " Liters")
            }
        default:
            break
        }
        
        
    }
    
    
    /// Popover for the IV flow Rate
    @IBAction func IVFlowReferene(_ sender: Any) {
        
        let popTip = PopTip()
        popTip.bubbleColor = UIColor.darkGray
        popTip.textColor = UIColor.white
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: 130, y: 700, width: 100, height: 100)
        
        
        popTip.show(text: "Calculation is based on a conservative correction rate of 0.5 mEq/L/hr.", direction: .up, maxWidth: 200, in: view, from: here)
        
        //        popTip.show(text: "Devine BJ. Gentamicin therapy. Drug Intell Clin Pharm. 1974;8:650–655.", direction: .down, maxWidth: 200, in: view, from: here)
        
        //Background color changes. Not sure how to dismiss.
        //        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
        //        popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
        
    }
    
    @IBAction func closeFreeWaterDetail(_ sender: Any) {
        self.view.endEditing(true)
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
    }
    
    
    @IBAction func hiddenButton(_ sender: Any) {
        self.view.endEditing(true)
        
        dismiss(animated: true, completion: {
            self.view.endEditing(true)
            
        })
        print("View Controller was dismissed")
        
    }
    
}

