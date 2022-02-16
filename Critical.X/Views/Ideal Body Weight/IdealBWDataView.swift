//
//  IdealBWDataView.swift
//  IdealBodyWeight
//
//  Created by Jadie Barringer III on 12/30/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

var desiredTV: Double?

var heightEntered: Double?

var maleIBWCalculation: Double = 0

var femaleIBWCalculation: Double = 0

var genderLabel: String = ""



class IdealBWDataView: UIViewController {
    
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var idealBodyweightCalc: UILabel!
    @IBOutlet weak var tvCalculation: UILabel!
    @IBOutlet weak var IBW_Pounds: UILabel!
    @IBOutlet weak var IBWChildView: UIView!
    @IBOutlet weak var ettDepth: UILabel!
    @IBOutlet weak var genderHeading: UILabel!
    @IBOutlet weak var tidalVolumeTextLabel: UILabel!
    
    var desiredTV: Double?
    
    var heightEntered: Double?
    
    var maleIBWCalculation: Double?
    
    var femaleIBWCalculation: Double?
    
    var genderLabel: String = ""
    
    var femalelbs: Double?
    
    var malelbs: Double?
    
    var idBlock: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the button and makes it into a circle
        closeBtn.layer.cornerRadius = closeBtn.frame.size.width / 2
        
        /// Rounds the corners 15 pixels of the UIView name
        IBWChildView.clipsToBounds = true
        IBWChildView.layer.cornerRadius = 15
        idwCalculations()
        
        //self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        // self.showAnimate()
    }
    
    
    //MARK: Ideal Body weight Calculations 
    func idwCalculations () {
        
        
        var idealBwCalcMale: Double { return 50 + 2.3 * (heightEntered! - 60 ) }
        //        var idealBwCalc: Double { return 50 + 2.3 * (heightEntered! - 60 ) }
        
        
////        //MARK: Guard function during the calculations.
//        guard let myCalculations = heightEntered, let tv = desiredTV else {
//
//
////            print("Cannot calculate Ideal body weight because weight out of normal parameters")
////            self.idealBodyweightCalc.isHidden = true
////            genderHeading.text = "Fill in both parameters"
////            tvCalculation.isHidden = true
////            IBW_Pounds.isHidden = true
////            ettDepth.isHidden = true
////            genderHeading.isHidden = true
////            return }
        
        
        let TV = (Int(desiredTV!))
        
        let poundsMale = (maleIBWCalculation!.rounded() * 2.2)
        
        let poundsFemale = (femaleIBWCalculation!.rounded() * 2.2)
        
        
        let IBW_Int_MALE = (Int(maleIBWCalculation!.rounded()))
        
        let IBW_Int_FEMALE = (Int(femaleIBWCalculation!))
        
        let cm = 2.54
        
        let formatter = MeasurementFormatter()
        
        formatter.unitStyle = .medium //e.g.: 10 feet would be formatted as 10 ft
        formatter.unitOptions = .naturalScale
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .none
        formatter.numberFormatter = numberFormatter
        
        // Declaring the measurement "Height in inches.
        var heightInches = Measurement(value: heightEntered!, unit: UnitLength.inches)
        
        // Takes the input in "inches entered and convert the "inches" to "feet"
        var heightFeet = heightInches.converted(to: UnitLength.feet)
        
        //Variable declaring the raw value of feet in a double Since mearsurement method is a unit function of swift. It will retun 6 sig figs.
        let numberInUnit = heightFeet.value
        
        // We want to take the raw value of "feet" and round towards zero and inset it into a Unit Measurement for swift
        let feet = numberInUnit.rounded(.towardZero)
        let feetString = Measurement(value: feet, unit: UnitLength.feet)
        
        //Figure out the inches by using truncatingRemainder math from the feet.
        let inches = abs(numberInUnit.truncatingRemainder(dividingBy: 1.0)) * 12
        
        // Takes the inches "Double" and rounds to a whole value. 1.9 will be 2 etc.
        let finalInch = inches.rounded(.up)
        // Finally create our inches measurement from the new value.
        let inchesString = Measurement(value: Double(finalInch), unit: UnitLength.inches)
        
        // We can now print out the height and swift will format " This is the height 5.0 ft, 8.0 in"
        print ("This is the height \(feetString), \(inchesString), not rounded is \(inches) in")
        print("")// Space for the console debugger.
        print(inchesString.value)
        
        
        //let numberInFeet = heightFeet.value
        
        //let heightFeet1 = String(format:"%.1f",numberInFeet) // Rounds to the 1st decimal place
        //        let heighttoCmConversion1 = Measurement(value: heightEntered!, unit: UnitLength.centimeters)
        
        var heighttoCmConversion: Int {
            
            return Int (heightEntered!.rounded() * cm)
        }
        
        let ETTDepth: Double = 0.1 * Double(heighttoCmConversion ) + 4
        
        
        //        idealBodyweightCalc.text = "\(idealBwCalcMale)"
        
        ettDepth.text = "\(Int(ETTDepth.rounded())) cm"
        
        
        //MARK: - Switch on the idblock to identify M or F
        
        switch idBlock {
            
        //MARK: - MALE METHODS
        // In the event MALE is selected
        case 1:
          
            IBW_Pounds.text = String(format:"%.1f",poundsMale) + " lbs" // Rounds to the 1st decimal place
            
            idealBodyweightCalc.text = "\(maleIBWCalculation!) kg's"
            
            genderHeading.text = genderLabel + " " + "at \(heightEntered!) in. | \(feetString) \(inchesString)"
            
            tvCalculation.text = "\(IBW_Int_MALE * TV) mL's"
            
            tidalVolumeTextLabel.text = "Tidal Volume at \(TV) mL's/kg"
            
            
            
            print("Male calculations were executed uder the switch")
            
        //MARK: - FEMALE METHODS
        // In the event FEMALE is selected
        case 2:
            IBW_Pounds.text =  String(format:"%.1f",poundsFemale) + " lbs"  // Rounds to the 1st decimal place
            
            idealBodyweightCalc.text = "\(femaleIBWCalculation!) kgs"
            
            genderHeading.text = genderLabel + " " + "at \(heightEntered!) in | \(feetString) \(inchesString)"
            
            tvCalculation.text = "\(IBW_Int_FEMALE * TV) mL's"
            
            
            tidalVolumeTextLabel.text = "Tidal Volume at \(TV) mL's/kg"
            
            print("Female calculations were executed uder the switch")
        default:
            break
        }
        
        
        ///Debugging print statements.
        print("ID Block is \(idBlock)")
        
        print("") //create space on the console
        
        print("The height entered was\(String(describing: heightEntered))")
        print("") //create space on the console
        
        print("Desired TV entered was \(String(describing: desiredTV))")
        print("") //create space on the console
        
        print("Height conversion was \(String(describing: heighttoCmConversion))")
        print("") //create space on the console
        
        print("ETT Depth is \(String(describing: ETTDepth))")
        print("") //create space on the console
        
        print("Ideal Body weight Male is \(String(describing: idealBwCalcMale))")
        print("") //create space on the console
        
        print("Male Ideal Body Weight is \(String(describing: maleIBWCalculation))")
        print("") //create space on the console
        
        print("Female Ideal Body Weight is \(String(describing: femaleIBWCalculation))")
        print("") //create space on the console
        
        print("Male Weight is \(String(describing: poundsMale))")
        print("") //create space on the console
        
        print("Female Weight is \(String(describing: poundsFemale))")
        print("") //create space on the console
        
        print(feetString)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeIDWChild(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // define a variable to store initial touch position
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    
    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizer.State.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    
    
}
