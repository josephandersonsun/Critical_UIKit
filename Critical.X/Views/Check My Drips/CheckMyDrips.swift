//
//  CheckMyDrips.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/21/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import McPicker

var drugDosage: Double?

class CheckMyDrips: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var theResultDetailLabel: UILabel!
    @IBOutlet weak var milligramsPermL: UILabel!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var flowRate: UITextField!
    @IBOutlet weak var dosage: UITextField!
    @IBOutlet weak var ivBagCc: UITextField!
    
    @IBOutlet weak var doseSegment: UISegmentedControl!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var calcDrip: UIButton! 
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set the title of the button
        calcDrip.setTitle("Click to select units", for: .normal)
        
        resultView.isHidden = true
    }
    
  
    //MARK: - Picker Variable titles.
    let data: [[String]] = [
        ["g/min", "g/hr", "mg/min", "mg/hr", "mcg/min", "mcg/hr", "mcg/kg/min","mcg/kg/hr"]
    ]
    
    @IBAction func changeDose(_ sender: Any) {
        
        switch doseSegment.selectedSegmentIndex {
         case 0:
            dosage.placeholder = "mg"

        case 1:
            // If Grams are
            let text = Double (dosage.text!) ?? 0
            
            let conversion  = text * 1000
            
            drugDosage = conversion
            
            dosage.placeholder = "grams"
            
            print("Dose is now \(drugDosage)")
        
        default:
            break
        }
    }
    
    
    
    // Selecting the picker button
    @IBAction func popOverPicker(_ sender: UIButton) {
        //Properties
        
        drugDosage = Double (dosage.text!)
        
        guard drugDosage != nil else {
            _ = SCLAlertView().showError("Hold On...", subTitle:"Please enter a dose", closeButtonTitle:"OK")
            
        return }
        
        
        let fluidInTheIVBag = Double(ivBagCc.text!)
        
        let ivFlowRate = Double(flowRate.text!)
        
        let weight = Double(weightTxt.text!)
        
        guard  let bg = fluidInTheIVBag, let f = ivFlowRate else {
            print ("Error with the text. ");
            
            ///Red Alert
            _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
            
            // Yellow Warning Alert // Takes the button and makes it into a circle
            // _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")
            
            
            return  }
        
         drugDosage = Double (dosage.text!)
        
        
        // MARK: - Calculate concentration per mL
        // Closure When calculation has one value to be multiplied
        let calcDosePerMl = {(doseIn: Double, bag: Double) -> (Double) in
            
            //Acutal Calculation
            return (drugDosage! / fluidInTheIVBag!)
        }
        
        
        //Converting the result value.
        let mgPerMLResult = Double(calcDosePerMl(drugDosage!, fluidInTheIVBag!))
        
        // Calculated the mg/ml and covertts to mcg
        let mcgResult = mgPerMLResult * 1000
        
        // Rounds to the 1st decimal place
        let shortmgPerMLResult3 = String(format:"%.1f",mcgResult)
        
        // Rounds to the 1st decimal place
        let shortmgPerMLResult = String(format:"%.1f",mgPerMLResult)
        
        milligramsPermL.text = "\(shortmgPerMLResult) mg/mL"
        
        print(shortmgPerMLResult3 + " mcg with dosage under 0.9")
        
        
        
        //MARK: - mcg/Hr Calculation
        func mcgHr () -> Double {
            
            return (ivFlowRate! * (drugDosage! / fluidInTheIVBag!) * 1000  )
        }
        
        
        //MARK: - mg/hr Closure
        // Closure with Multiple Parameters and One Return type
        let mgHr = {(mg ,mL ,flowRate ) -> Double in
            // Enter code.
            return (mg / mL) * flowRate
        }
        
        //Calcualtes the dose
        let mgPerHr =  mgHr(drugDosage!, fluidInTheIVBag!, ivFlowRate!)
        
        
        //Shortens the double to one sig fig
        let mgPerHr_shortened = String(format:"%.1f",mgPerHr) // Rounds to the 1st decimal place
        
        
        
        //MARK: - Conditionals
        // If mg/mL is < 0.1, then we convert to micrograms.
        if mgPerMLResult < 0.1 {
            
            //Set the text label
            milligramsPermL.text = "\(shortmgPerMLResult3) mcg/mL"
            
            print("Less than 0.1 so converted to \(shortmgPerMLResult3)  mcg/mL ")
            
        } else if mgPerMLResult > 0.1 {
            milligramsPermL.text = "\(shortmgPerMLResult) mg/mL" }
        
        self.view.endEditing(true)
        
        
        
        
        // What happends when we select a picker segment,
//        McPicker.showAsPopover(data: data, fromViewController: self, sourceView: sender, cancelHandler: { () -> Void in
//
//        print("Canceled Popover") }, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
//
        McPicker.show(data: data, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
        
        
            if let name = selections[0] {
                //self.label.text = name
                
                
                //MARK: - g/min
                if name == "g/min" {
                    
                    var gMin1: Double { return  (drugDosage! / fluidInTheIVBag!) * (ivFlowRate! / 1000 / 60) }
                    
                    // Rounds to the 1st decimal place
                    let gMin = String(format:"%.3f",gMin1)
                    
                    if Double(gMin) == 0.000 {
                       
                        self.label.text = "ERROR"
                       
                        self.theResultDetailLabel.text = "Please try a new calculation"
                       
                        self.calcDrip.setTitle("g/min", for: .normal)

                        
                        print("Result is zero")
                    }
                    
                    self.label.text = "\(gMin)"
                    
                    self.theResultDetailLabel.text = "g/min"
                    
                    //Animate the Result View
                    self.showAnimate()
                    
                    //Unhides the view
                    self.resultView.isHidden = false
                    

                    print("\(gMin) was calculated for g/Min")
                    
                    self.view.endEditing(true)
                    
             }
                    
                    // MARK: - mg/hr
                else if name == "mg/hr" {
                    
                    // Sets the label to the shortened value
                    self.label.text = "\(mgPerHr_shortened)"
                    
                    self.theResultDetailLabel.text = "mg/hr"
                    
                    //Print function
                    print("\(mgPerHr_shortened) mg/hr selected")
                    //Animate the Result View
                   
                    self.self.calcDrip.setTitle("mg/hr", for: .normal)

                    self.showAnimate()
                   
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    // MARK: - mg/min
                else if name == "mg/min" {
                    
                    // Calculation is mg/hr / 60'
                    let mgMin = mgPerHr / 60
                    
                    // Rounds the result
                    let mgMin_short = String(format:"%.2f",mgMin) // Rounds to the 2st decimal place
                    
                    // Sets the label to the result rounded to 2 decimal places
                    self.label.text = "\(mgMin_short)"
                    self.theResultDetailLabel.text = "mg/min"
                    
                    //Animate the Result View
                    self.showAnimate()
                    
                    self.self.calcDrip.setTitle("mg/min", for: .normal)

                    
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    print("\(mgMin_short) mg/min was selected")
                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    
                    //MARK: - mcg/min
                else if name == "mcg/min" {
                    
                    // Takes the mg.min calculation * 1000
                    let mcgMin = (mgPerHr / 60) * 1000
                    
                    // Rounds to the 2st decimal place
                    let mcgMin_short = String(format:"%.1f",mcgMin)
                    
                    // Sets the label to the result rounded to 2 decimal places
                    self.label.text = "\(mcgMin_short)"
                    self.theResultDetailLabel.text = "mcg/min"
                    
                    self.self.calcDrip.setTitle("mcg/min", for: .normal)

                    //Animate the Result View
                    self.showAnimate()
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    print("\(mcgMin_short) mcg/min was selected")
                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    
                    // MARK: - mcg/Hr
                else if name ==  "mcg/hr" {
                    
                    self.label.text = "\(mcgHr())"
                    
                    print("\(mcgHr()) mcg/Hr was calculated"); self.theResultDetailLabel.text = "mcg/hr"
                    
                    //Animate the Result View
                    self.showAnimate()
                    
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    self.self.calcDrip.setTitle("mcg/hr", for: .normal)

                    // Dismisses the keybord
                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    
                    //MARK: - mcg/kg/min
                else if name == "mcg/kg/min" {
                    //MARK: Guard function during the calculations.
                    // If any of these Optional values are NIL (or Empty) then Initiate the following code before the return value.
                    
                    guard let weight = weight else {
                    
                        print("Weight not entered")
                    
                        // Impliment additional code/conditions like alerts or hiding views etc.
                    
                        //Hiding result view
                    
                        self.resultView.isHidden = true
                        
                        self.calcDrip.setTitle("mcg/kg/min", for: .normal)

                        
                        self.theResultDetailLabel.text = "Enter the weight"
                        // Show the alert
                        ///Red Alert
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Check the weight before calculating.", closeButtonTitle:"OK")
                      return }
                    
                    
                    //calculation closure.
                    var calculationOfMcgKgMin: Double {
                        
                        let mcgKgMin = ((drugDosage! * 1000) * ivFlowRate!) / (fluidInTheIVBag! * 60 * weight)
                        
                        return mcgKgMin
                    }
                    
                    // Shortens the result to a 2 sigFig string.
                    let shortResultofMcgKgMin = String(format:"%.1f",calculationOfMcgKgMin) // Rounds to the 1st decimal place
                    
                    // Sets the label to the shortened result.
                    self.label.text = "\(shortResultofMcgKgMin)"
                    
                    self.theResultDetailLabel.text = "mcg/kg/min"
                    
                    //Animate the Result View
                    self.showAnimate()
                    
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    //print statement
                    print("\(shortResultofMcgKgMin) mcg/kg/min was calculated")
                    
                    //dismisses the keyboard
                    self.view.endEditing(true)
                    
                }
                    
                    
                    
                    
                    
                    //MARK: - mcg/kg/Hr
                else if name == "mcg/kg/hr" {
                    
                    //MARK: Guard function during the calculations.
                    // If any of these Optional values are NIL (or Empty) then Initiate the following code before the return value.
                    guard let weight = weight else {
                        print("Weight not entered")
                        // Impliment additional code/conditions like alerts or hiding views etc.
                        //Hiding result view
                        self.resultView.isHidden = true
                        
                        self.theResultDetailLabel.text = "Enter the weight"
                        // Show the alert
                      
                        ///Red Alert
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Check the weight before calculating.", closeButtonTitle:"OK")
                        
                        return }
                    
                    // Calculating the closure.
                    var calculationOfMcgKgHr: Double {
                        
                        let mcgKgHr = ((drugDosage! * 1000) * ivFlowRate!) / (fluidInTheIVBag! * weight)
                        
                        return mcgKgHr
                    }
                    
                    
                    // Shortens the result to a 2 sigFig string.
                    let shortResultofMcgKgHr = String(format:"%.1f",calculationOfMcgKgHr) // Rounds to the 1st decimal place
                    
                    // Sets the label to the shortened result.
                    self.label.text = "\(shortResultofMcgKgHr)"
                    
                    self.theResultDetailLabel.text = "mcg/kg/hr"
                    
                    self.self.calcDrip.setTitle("mcg/kg/hr", for: .normal)

                    //Animate the Result View
                    self.showAnimate()
                    
                    //Unhides the view
                    self.resultView.isHidden = false
                    
                    //print statement
                    print("\(shortResultofMcgKgHr) mcg/kg/min was calculated")
                    
                    // Dismisses the keyboard
                    self.view.endEditing(true)
                    
                }
                
            } //ends the if statement
            
            
        }) // completes the closure
    } // ends the method
    
    
    
    
    
    func showAnimate()
    {
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 1.25, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }
    // Closes the keyboard befor ethe view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    @IBAction func ChekMyDripView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Check my drips Controller was dismissed")
        
    }
    
    
} // Ends class


