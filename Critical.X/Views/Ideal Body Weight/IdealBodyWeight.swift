//
//  IdealBodyWeight.swift
//  IdealBodyWeight
//
//  Created by Jadie Barringer III on 12/30/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import TextFieldEffects

var maleCalc: Double = 0
var femaleCalc: Double = 0

class IdealBodyWeight: UIViewController {
    
    @IBOutlet weak var desiredTVText1: UITextField!
    @IBOutlet weak var heightText1: TextFieldEffects!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var desiredTVText: TextFieldEffects!
    @IBOutlet weak var heightText: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var idealBodyWeightSegment: CustomSegmentedController?
    
    @IBOutlet weak var lbl_idealDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        
        /// Rounds the corners 15 pixels of the button name
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
        idealBodyWeightSegment?.items = ["M", "F"]
        
        
        
    }
    
    @IBAction func targetTV_Changed(_ sender: Any) {
        print((sender as AnyObject).text!)
        
        
        
        let TV = Int((sender as AnyObject).text!)
        
        // We are saying, if any of the text are deleted and left empty, there will be no crash, display what the label says - if not move onto the conditionals. This will crash without this guard.
        guard let _ = desiredTVText.text.nilIfEmpty, let _ =
            
            heightText.text.nilIfEmpty  else {
                
                lbl_idealDescription.text = "Enter between 4-8 mL/kg"
                
                print("Desired 2 and height empty ?")
                
                //disable button
                calculateButton.isEnabled = false
                
                return }
        
        if TV! <= 3 || (desiredTVText.text!.isEmpty)  {
            
            print("Ideal is too low")
            
            lbl_idealDescription.text = "Too low, enter between 4-8 mL/kg"
            
            lbl_idealDescription.textColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
            
            //disable button
            calculateButton.isEnabled = false
           
            
        }
            
        else if TV! >= 11 {
            
            print("Ideal is too high")
            
            lbl_idealDescription.text = "Too high, enter between 4-8 mL/kg"
            
            lbl_idealDescription.textColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
            
            SCLAlertView().showTitle("Hold Up!",
                                     subTitle: "Enter a target tidal volume in ml/kg.\nRecommended 4-8 mL/kg!",
                                     timeout: nil,
                                     completeText: "Ok, Thanks!",
                                     style: .success,
                                     colorStyle: 0xD93829,//Critical Red
                colorTextButton: 0xFFFFFF, // White color
                circleIconImage: UIImage.init(named: "CriticalABG"),
                animationStyle: .topToBottom)
            
            
            //disable button
            calculateButton.isEnabled = false
            
        }
            
            
            
        else if TV! >= 4 && TV! <= 10 && ((sender as AnyObject).text!.count) > 0 {
            
            print("Ideal is between 4-8 mL/kg")
            
            lbl_idealDescription.text = "Normal target TV parameters"
            
            lbl_idealDescription.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            //disable button
            calculateButton.isEnabled = true
            
        }
            
        else if TV == nil || (desiredTVText.text!.count < 0) {
            
            lbl_idealDescription.text = "Target TV between 4-8 mL/kg"
            
            //disable button
            calculateButton.isEnabled = false
        }
    }
    
    
    
    
    
    
    
    @IBAction func closeIdealBodyWeightScreen(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Popup button
    @IBAction func popBtn(_ sender: Any) {
        
        
        let popTip = PopTip()
        
        popTip.bubbleColor = UIColor.darkGray
        
        popTip.textColor = UIColor.white
        
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: 18, y: 345, width: 100, height: 100)
        
        
        popTip.show(text: "TV should be based on IBW. Set between 6-8 mL/kg", direction: .up, maxWidth: 200, in: view, from: here)
        
        //        popTip.show(text: "Devine BJ. Gentamicin therapy. Drug Intell Clin Pharm. 1974;8:650–655.", direction: .down, maxWidth: 200, in: view, from: here)
        
        //Background color changes. Not sure how to dismiss.
        //        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
        //        popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
        
    }
    
    
    
    
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // guard to see if the text if filled in.
        guard let _ = desiredTVText.text.nilIfEmpty else {
            lbl_idealDescription.text = "Enter a desiredTV to proceed."
            
            return  }
        
        
        //MARK: Checks the segue destination, grabs the number value from the textfield and passes the data.
        if let destination = segue.destination as? IdealBWDataView {
            
            //Takes the Double (weightEntered) variable from the detail page, and parses it as the textFireld (Double) becuase the textField is origionally casted as a string.
            // If any of these Optional values are NIL (or Empty) then Initiate the following code before the return value.
            
            destination.desiredTV = Double (desiredTVText.text!)
            destination.heightEntered = Double (heightText.text!)
            
        }
        
        
        if segue.identifier == "ibwShow" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let IBW = segue.destination as? IdealBWDataView {
                
                switch idealBodyWeightSegment?.selectedIndex {
                case 0?:
                    
                    
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized. Then use this ID block in a swutch statement to reference what you want !
                    let id = 1
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    IBW.idBlock = id
                    
                    // do a conversion to pounds from the ideal weight  calculated
                    let poundsMale = (maleIBWCalculation * 2.2)
                    
                    IBW .malelbs = poundsMale
                    
                    
                    //                    // set the TV to the corresponding text field
                    IBW.desiredTV = Double (desiredTVText.text!)
                    //
                    
                    // maleIBWCalculation is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    IBW.maleIBWCalculation =  (50 + 2.3 * (Double (heightText.text!)! - 60)).roundTo(places: 1)
                    
                    
                    //Set the female calculations to zero, or it will crash showing nil.
                    IBW.femaleIBWCalculation = 0
                    IBW .femalelbs = 0
                    
                    
                    // I declared a global gender label on the receiving view controller and send it with the text.
                    IBW.genderLabel = "Male"
                    //
                    
                    
                    print("OK OK OK First Segment Selected")
                    print("")//create space on the console
                case 1?:
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 2
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    IBW.idBlock = id
                    
                    let poundsFemale = (femaleIBWCalculation * 2.2)
                    
                    
                    IBW.desiredTV = Double (desiredTVText.text!)
                    
                    IBW.femaleIBWCalculation =  (45.5 + 2.3 * (Double (heightText.text!)! - 60)).roundTo(places: 1)
                    
                    IBW.maleIBWCalculation = 0
                    
                    IBW.genderLabel = "Female"
                    
                    IBW .femalelbs = poundsFemale
                    
                    IBW.malelbs = 0
                    
                    print("OK OK OK Second Segment Selected")
                    print("") //create space on the console
                    
                default:
                    break
                }
                
            }
            
        }
    }
    
    //MARK: Dismisses the keyboard when the user taps on the outside of any textField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    //MARK: Cancels the segue transition if the textBox is empty
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "ibwShow" {
            if (desiredTVText.text?.isEmpty)! && (heightText.text?.isEmpty)!
                
                || (desiredTVText.text?.isEmpty)!
                
                || (heightText.text?.isEmpty)!
            {
                
                print(" Ideal body weight segue cancelled")
                
                //Displays alert
                _ = SCLAlertView().showWarning("Error!", subTitle: "Make sure all of the text fields have values before calculating.")
                
                return false
            }
        }
        
        // by default, transition
        return true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    @IBAction func segmentSElected(_ sender: Any) {
        
        
        
        if(idealBodyWeightSegment?.selectedIndex == 0)
        {
            
            
            print("Male Segment Selected")
            
        }
        else if(idealBodyWeightSegment?.selectedIndex == 1)
        {
            print("Female Segment Selected")
        }
        
    }
}
