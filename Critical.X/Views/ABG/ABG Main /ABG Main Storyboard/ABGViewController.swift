//
//  ViewController.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 9/27/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel // animations
import SCLAlertView //alerts
import Lottie //animation
//import SwiftyAttributes // Sets textAttribute colors


//// Or we can just call that if we are using multiple significant figures.
//extension Double {
//    var oneDecimalPlace: String {
//        return String(format: "%.1f", self)
//    }
//    var twoDecimalPlace: String {
//        return String(format: "%.2f", self)
//    }
//}


// If the textFiels is empty.
extension Optional where Wrapped == String {
    var nilIfEmpty: String? {
        guard let strongSelf = self else {
            return nil
        }
        return strongSelf.isEmpty ? nil : strongSelf
    }
}

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.safelyLimitedTo(length: maxLength)
    }
}

extension String
{
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}

extension UITextField {
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
}


// MARK: - TextInputDelegate
//extension  TextInputDelegate {
//    func textInputDidBeginEditing(_ textInput: TextInput) {
//        print("textInputDidBeginEditing")
//    }
//
//    func textInputShouldBeginEditing(_ textInput: TextInput) -> Bool {
//        return true
//    }
//}

// Public variables Uses these strings to pass Data from the causes of the gas results view.
var pushPhcondition = String ()
var pushC02condition = String ()
var pushHC03condition = String ()



class ABGViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var ChlorideImage: UIImageView!
    
    @IBOutlet weak var SodiumImage: UIImageView!
    
    @IBOutlet weak var HC03Image: UIImageView!
    
    @IBOutlet weak var C02Image: UIImageView!
    
    @IBOutlet weak var PHImage: UIImageView!
    
    @IBOutlet weak var AlbuminImage: UIImageView!
    
    @IBOutlet weak var lineView: UIView!

    @IBOutlet weak var AnalyzeButton: UIButton!
    
    @IBOutlet weak var deltaBUTTON: UIButton!
    
    @IBOutlet weak var theoryButton: UIButton!
    
    @IBOutlet weak var AlbuminText: UITextField!
    
    @IBOutlet weak var pHTextField: UITextField!
    
    @IBOutlet weak var c02TextField: UITextField!
    
    @IBOutlet weak var bicarbTextField: UITextField!
    
    @IBOutlet weak var resultLabel: AKLabel!
    
    @IBOutlet weak var NATextField: UITextField!
    
    @IBOutlet weak var CLTextfield: UITextField!
    
    @IBOutlet weak var anionGapLabel: UILabel!
    
    @IBOutlet weak var phSideLabel: UILabel!
    
    @IBOutlet weak var bicarbSideLabel: UILabel!
    
    @IBOutlet weak var c02SideLabel: UILabel!
    
    @IBOutlet weak var ExpectedC02Label: UILabel!
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var main_DisorderTitle_Label: AKLabel!
    
    @IBOutlet weak var baseExcessSmallLabel: UILabel!
    
    @IBOutlet weak var primaryDisorderLbl: UILabel!
    
    @IBOutlet weak var compensationlbl: UILabel!
    
    @IBOutlet weak var refreshLabel: UILabel!
    
    @IBOutlet weak var angryEmojiView: AnimationView!
    
    @IBOutlet weak var pHSlideView: UIView!
    
    @IBOutlet weak var c02SlideView: UIView!
    
    var mySegmentController = UISegmentedControl.self
    
    @IBOutlet weak var PrimaryDView: UIView!
    
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    
    /// ---
    /// #  We check the current state of the button and change the color depending on the state
    /// ## Subtitle 2
    /// State of the button:
    /// + On or True
    /// 1. Make it blue
    /// + Off or false
    /// 2. Change the color to gray
    /// ---
    
    
    
    func checkAnalyzeButtonStatus()  {
        if AnalyzeButton.isEnabled == false {
            AnalyzeButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            AnalyzeButton.setTitle("Check parameters", for: .normal)
            
        }
        else if AnalyzeButton.isEnabled ==  true {
            AnalyzeButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            AnalyzeButton.setTitle("Tap to Analyze", for: .normal)
            
        } else {
            AnalyzeButton.isEnabled =  true
            AnalyzeButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            AnalyzeButton.setTitle("Tap to Analyze", for: .normal)
        }
    }
    
    
    
    //MARK: PH  in realTime.
    @IBAction func pHChanged(_ sender: UITextField) {
        print(sender.text!)
        //unhide the pH image
        PHImage.isHidden = false
        
        
        if (sender.text?.count)! > 0 {
            //display_pH_Arrows()
        }
        if sender.isFirstResponder {
            aniimatePh()
        }
        //Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        phSideLabel.text = "Enter pH to proceed"
        phSideLabel.textColor  =   #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        PHImage.image = nil
        AnalyzeButton.isEnabled = false
        
        _ = checkPhParameters_RealTime(pH: Double(sender.text!) ?? 0)
        
        
    }
    
    
    
    
    //MARK: - C02 in realtime
    @IBAction func c02RealtTime(_ sender: UITextField) {
        // Unhide the c02 arrow
        C02Image.isHidden = false
        
        // Calculate the bicarb from the given PaC02
        
        //Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        checkPhParameters_RealTime(pH:Double(pHTextField.text!) ?? 0 )
        
        // guard to see if the text if filled in.
        guard let _ = pHTextField.text.nilIfEmpty else {
            c02SideLabel.text = "Enter a pH to proceed."
            
            // Animate to the ph line
            aniimatePh()
            
            return  }
        
        display_pH_Arrows()
        
        // MARK: LINE ANIMATION
        //If the textField is activated by typing, execute the animation block
        if sender.isFirstResponder {
            animateC02()
        }
        
        // declaring that the sender is the c02 value
        let c02Value = Double(sender.text!)
        
        // conditions for the c02
        if let c02Value = c02Value {
            
            //1
            if c02Value >= 190 && sender.text!.count > 0 {
                c02TextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                c02SideLabel.text = "Too high"
                C02Image.image = #imageLiteral(resourceName: "close_red")
                bicarbTextField.text = ""
                AnalyzeButton.isEnabled = false
                
            }
                
                //2
            else if c02Value >= 46 && c02Value <= 189 && sender.text!.count > 0 {
                c02TextField.textColor = #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1)
                c02SideLabel.text = "Hypercapnic"
                C02Image.image = #imageLiteral(resourceName: "Aarow.up")
                
            }
                
                //3
            else if c02Value <= 34.9 && sender.text!.count > 0 {
                c02TextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                c02SideLabel.text = "Hypocapnic"
                C02Image.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
                
            }
                
                //4
            else if c02Value >= 35 && c02Value <= 45 && sender.text!.count > 0 {
                c02TextField.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                c02SideLabel.text = "Normal C02"
                C02Image.image = #imageLiteral(resourceName: "CheckMark")
                
            }
                
                //5
            else if c02Value == nil {
                print("paC02 is empty")
            }
        }
        
        // here we automatically calculate the serum bicarb from the pH and c02
        let bicarb = Double (hc03Calculation(c02: Double(sender.text!) ?? 0 , pH: Double(pHTextField.text!) ?? 0 ))
        
        guard bicarb != nil else {return}
        // Takes the value and put it in the textField
        bicarbTextField.text = "\(bicarb!)"
        
        if let bicarb = bicarb  {
            
            HC03Image.isHidden = false
            
            // Guard statement to only calculates the bicarb only if the c02 is filled out.
            guard c02Value != nil else {
                
                // if the c02 is left empty execute
                AnalyzeButton.isEnabled = false
                bicarbTextField.text = ""
                HC03Image.image = nil
                C02Image.image = nil
                c02SideLabel.text = "Enter a c02"
                bicarbTextField.text = ""
                bicarbSideLabel.text = ""
                
                return }
            
            // If the c02 if filled in and these parameters are met, execute the following code.
            AnalyzeButton.isEnabled = true
            
            if c02Value! >= 190.0 && (pHTextField.text?.count)! > 0  {
                AnalyzeButton.isEnabled = false
                c02TextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                c02SideLabel.text = "Too high, enter lower value"
                C02Image.image = #imageLiteral(resourceName: "close_red")
                bicarbTextField.text = ""
                HC03Image.image = nil
            }
            if  bicarb <= 21.0 && (bicarbTextField.text?.count)! > 0   {
                bicarbSideLabel.text = "⬇︎ HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                HC03Image.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
                
            }
                
            else if bicarb >= 26.1 && (bicarbTextField.text?.count)! > 0 {
                bicarbSideLabel.text = "⬆︎ HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
                HC03Image.image = #imageLiteral(resourceName: "Aarow.up")
                print("Ok, The bicarb is greater than 26.1")
                
            }
                
            else if bicarb >= 22.0 && bicarb <= 26.0 && (bicarbTextField.text?.count)! > 0 {
                bicarbSideLabel.text = "Normal serum HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                HC03Image.image = #imageLiteral(resourceName: "CheckMark")
                
                print("Normal HC03 and arrow up")
            }
                
            else if bicarb == nil {
                HC03Image.image = nil
                bicarbTextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            
        }
        // Display the aarows if theres a C02, if not dont call the function.
        if sender.text!.count > 0 {
            //DisplayArrows()
            animateC02()
            checkPhParameters_RealTime(pH:Double(pHTextField.text!) ?? 0 )
            
        } else if sender.text!.count == 0 {
            
            print("\(String(describing: sender.text?.count)) + Co2 textCount")
            c02SideLabel.text = "Enter a pH to proceed."
            
        }
        
        
        //analyzeGasParameters()
    }
    
    //MARK: HC03 in realTime.
    
    @IBAction func Hc03RealTime(_ sender: UITextField) {
        //1 Unhide the bicab arrow
        HC03Image.isHidden = false
        
        let hc03Value = Double(sender.text!)
        
        //2 guard if the text is empty if not return the calculation.
        guard let _ = c02TextField.text.nilIfEmpty, let _ = pHTextField.text.nilIfEmpty  else {
            print("C02 and pH empty ?")
            
            if c02TextField.text?.isEmpty ?? false {
                c02SideLabel.text = "Enter a PaC02"
                AnalyzeButton.isEnabled = false
                animateC02()
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
            }
            if pHTextField.text?.isEmpty ?? false {
                phSideLabel.text = "Enter a pH"
                AnalyzeButton.isEnabled = false
                
                aniimatePh()
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
            }
            return
        } // End of guard
        
        
        //3 Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        AnalyzeButton.isEnabled = true
        
        // MARK: LINE ANIMATION
        //4 If the textField is activated by typing, execute the animation block
        if sender.isFirstResponder {
            animateBicarb()
        }
        
        
        
        var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
        let bicarbLow = hc03 - 5
        let bicarbHigh = hc03 + 5
        
        let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
        if hc03Text!.count > 0 {
            hc03 = Double(hc03Text!)!
        }
        print(sender.text!)
        
        
        
        if (bicarbTextField.text!.count > 0) && (Double(sender.text!) ?? 0 < bicarbLow || Double(sender.text!) ?? 0 > bicarbHigh)
        {
            bicarbTextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            bicarbSideLabel.text = "Enter HC03 \(bicarbLow.oneDecimalPlace) - \(bicarbHigh.oneDecimalPlace)"
            AnalyzeButton.isEnabled = false
            HC03Image.image = #imageLiteral(resourceName: "close_red")
            animateBicarb()
            
            //Checks to see if the button is set on or off and makes changes.
            checkAnalyzeButtonStatus()
            
        }
            
        else if Double(bicarbTextField.text!) == nil {
            bicarbTextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            bicarbSideLabel.text = "Enter HC03 \(bicarbLow.oneDecimalPlace) - \(bicarbHigh.oneDecimalPlace)"
            AnalyzeButton.isEnabled = false
            HC03Image.image = #imageLiteral(resourceName: "close_red")
            animateBicarb()
            
            //Checks to see if the button is set on or off and makes changes.
            checkAnalyzeButtonStatus()
        }
            
        else if (bicarbTextField.text!.count > 0) && (Double(sender.text!) ?? 0 > bicarbLow || Double(sender.text!) ?? 0 < bicarbHigh) {
            bicarbTextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            bicarbTextField.placeholder = "HC03: \(hc03)"
            bicarbSideLabel.text = ""
            AnalyzeButton.isEnabled = true
            
            //Checks to see if the button is set on or off and makes changes.
            checkAnalyzeButtonStatus()
            animateBicarb()
            
            if hc03 < 22.0 {
                HC03Image.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
                bicarbSideLabel.text = "⬇︎ HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                print("The bicarb less 22")
                
            }
            else if hc03 >= 26.1 {
                HC03Image.image = #imageLiteral(resourceName: "Aarow.up")
                bicarbSideLabel.text = "⬆︎ HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
                bicarbTextField.textColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                print("The bicarb is greater than 26.00")
                
                
            }
            else if hc03 >= 22.0 && hc03 <= 26.0 {
                HC03Image.image = #imageLiteral(resourceName: "CheckMark")
                bicarbSideLabel.text = "Normal serum HC03"
                bicarbTextField.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                print("The bicarb is WNLs")
                
            }
            else
            {
                HC03Image.image = nil
                print("The bicarb is nil")
                
            }
            
        }
        
        expected_pH_calc(c02: c02_value!, bicarb: hc03)
        
    }
    
    
    @IBOutlet var NaSideLabel: UILabel!
    @IBAction func SodiumRealTime(_ sender: UITextField) {
        
        // unhide the sodium arrow
        SodiumImage.isHidden = false
        
        print(sender.text!)
        
        // If the textField is activated by typing, execute the animation block
        if sender.isFirstResponder {
            animateSodium()
        }
        
        // If the sodium textField is empty, then run this code
        guard let _  = NATextField.text.nilIfEmpty else {
            NaSideLabel.text = "mEq/L"
            NaSideLabel.textColor  = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            NATextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            SodiumImage.image = nil
            //SodiumImage.image = nil
            AnalyzeButton.isEnabled = true
            
            //Checks to see if the button is set on or off and makes changes.
            checkAnalyzeButtonStatus()
            
            
            print("Na field is empty")
            return
            // Return after twhat we wanna do if its not empty.
        }
        
        // Set the button to display analyze.
        
        //Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        
        let naValue = Double(sender.text!)
        
        //Added _ = to shut up the warning.
        _ = check_Na_RealTime(Na: naValue ?? 0 )
        
        //DisplayArrows()
        
    }
    
    @IBOutlet var ChlorideSideLabel: UILabel!
    
    @IBAction func ChlorideRealTime(_ sender: UITextField) {
        
        // unhide the chloride arrow
        ChlorideImage.isHidden = false
        
        // This is the default
        ChlorideSideLabel.text = "mEq/L"
        
        ChlorideSideLabel.textColor  = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        
        //ChlorideImage.image = nil
        AnalyzeButton.isEnabled = true
        
        //Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        // MARK: LINE ANIMATION
        //If the textField is activated by typing, execute the animation block
        if sender.isFirstResponder {
            animateChloride()
        }
        
        lineView.backgroundColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        
        
        
        let chloride = Double(sender.text!)
        print("Cl is " + sender.text!)
        
        // If the chloride textField is nil then do nothing, if not then return //
        
        // Runs the bool function to check
        checkChlorideParameters_RealTime(ChlorideLevel: chloride ?? 0)
        
        
        
    }
    
    @IBOutlet var AlbuminSideLabel: UILabel!
    @IBAction func AlbuminRealTime(_ sender: UITextField) {
        
        //unhide the arrow
        AlbuminImage.isHidden = false
        
        
        // This is the default
        AlbuminSideLabel.text = "g/L"
        AlbuminSideLabel.textColor  = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        AlbuminImage.image = nil
        AnalyzeButton.isEnabled = true
        
        // Set the button to display analyze.
        //        AnalyzeButton.setTitle("Tap to Analyze", for: .normal)
        //        AnalyzeButton.backgroundColor = #colorLiteral(red: 0.3300000131, green: 0.5500000119, blue: 0.8700000048, alpha: 1)
        
        
        //Checks to see if the button is set on or off and makes changes.
        checkAnalyzeButtonStatus()
        
        // MARK: LINE ANIMATION
        //If the textField is activated by typing, execute the animation block
        if sender.isFirstResponder {
            animateAlbumin()
        }
        
        let albumin = Double(sender.text!)
        
        print("Albumin is " + sender.text!)
        
        
        if let alb = albumin {
            
            if alb > 0 && alb < 1.0 {
                
                AlbuminImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
                
                AlbuminSideLabel.text = "Very low: Double Check"
                
                AlbuminSideLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            }
            else if alb > 1.0 && alb < 3.5 {
                
                AlbuminImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
                
                AlbuminSideLabel.text = "Hypoalbuminemia"
                
                AlbuminSideLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            }
                
            else if alb > 7.0 {
                
                AlbuminImage.image = #imageLiteral(resourceName: "close_red")
                
                AlbuminSideLabel.text = "Too high: Change value"
                
                AlbuminSideLabel.textColor  =  #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                
                AlbuminText.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                
                AnalyzeButton.isEnabled = false
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            }
            else if alb > 6.0 && alb < 7.0 {
                
                AlbuminImage.image = #imageLiteral(resourceName: "Aarow.up")
                
                AlbuminSideLabel.text = "Very high: Double Check"
                
                AlbuminSideLabel.textColor  = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            }
            else if alb > 5.5 && alb < 6.0 {
                
                AlbuminImage.image = #imageLiteral(resourceName: "Aarow.up")
                
                AlbuminSideLabel.text = "Hyperalbuminemia"
                
                AlbuminSideLabel.textColor  = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            }
                
            else if (alb > 3.5) && (alb < 5.5) {
                
                AlbuminImage.image = #imageLiteral(resourceName: "CheckMark")
                
                AlbuminSideLabel.text = "Normal Serum Albumin"
                
                AlbuminSideLabel.textColor  = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
                
            } else {
                
                AlbuminSideLabel.text = "g/L"
                
                AlbuminSideLabel.textColor  = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
                
                AlbuminImage.image = nil
                
                AlbuminText.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                
                AnalyzeButton.isEnabled = true
                
                //Checks to see if the button is set on or off and makes changes.
                checkAnalyzeButtonStatus()
                
            }
            
        }
        
    }
    
    @IBAction func dismissABGMain(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("ABG MAIN View Controller was dismissed")
        
    }
    
    //MARK: - ViewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        // Animation for the button
        self.mainTitle.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.mainTitle.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.mainTitle.alpha = 1.0
            self.mainTitle.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Color Range, change title with random colors.
        
        // Random array of colors for the title
        let randomNavBarColors = [#colorLiteral(red: 0.9100000262, green: 0.5500000119, blue: 0.5699999928, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),#colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1),#colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)]
        let randomTitle = ["ABG", "GAS ANALYSIS"]
        
        mainTitle.textColor = UIColor.random(from: randomNavBarColors)
        mainTitle.text = "ABG"
        
        // Set the Background color to origional
        AnalyzeButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        // Takes the button and makes it into a circle
        
        // Once the view re-appears, then animate the pulsation on top of the textFields
        animatePulse()
        
    }
    
    
    
    // MARK: VIEW DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //animateBottomToTop()
        // Run the list of fonts i have installed for record. \\
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
      
        
        // Hide the primary view.
        PrimaryDView.isHidden = true
        
        //MARK: Animate the side line as soon as we start to edit the textField when it is selected
        if c02TextField.isEditing == true {
            animateC02()
        }
            
        else if pHTextField.isEditing == true {
            aniimatePh()
        }
            
        else if bicarbTextField.isEditing == true {
            animateBicarb()
        }
        
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        theoryButton.clipsToBounds = true
        
        theoryButton.layer.cornerRadius = 4
        
        AnalyzeButton.clipsToBounds = true
        
        AnalyzeButton.layer.cornerRadius = 4
        
        theoryButton.clipsToBounds = true
        
        theoryButton.layer.cornerRadius = 4
        
        deltaBUTTON.clipsToBounds = true
        
        deltaBUTTON.layer.cornerRadius = 4
        //primaryDisorderLbl.isHidden = true
        compensationlbl.isHidden = true
        // Starts the breathing image gif.
        //  bgImage.loadGif(name: "human_lungs")
        
        // Hides the delta gap calc button on startup
        
        deltaBUTTON.isHidden = true
        
        theoryButton.isHidden = true
        
        main_DisorderTitle_Label.animate(text: "Enter at least the pH and PaC02", duration: 1, completion: nil)
        
        /// adopts the text field delegate so that we can only use numbers in the text field whenc called below.
        pHTextField.delegate = self
        c02TextField.delegate = self
        bicarbTextField.delegate = self
        NATextField.delegate = self
        CLTextfield.delegate = self
        baseExcessSmallLabel.text = ""
        anionGapLabel.text = nil
        resultLabel.text = nil
        ExpectedC02Label.text = nil
        
        phSideLabel.text = "Enter pH to proceed"
        phSideLabel.textColor  =    #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        PHImage.image = nil
        
        
        c02SideLabel.text = "Enter PaC02 to proceed"
        c02SideLabel.textColor  =    #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        C02Image.image = nil
        
        
        // Round the corners of the top of the UIView
        
        view.clipsToBounds = true
        
        view.layer.cornerRadius = 10
        
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        //# MARK: Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
       
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
       
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
       
        tap.cancelsTouchesInView = false
       
        self.view.addGestureRecognizer(tap)
        
        // Animations of pH and C02 lines
        animatepHLineView()
        
        animateC02LineView()
        
        loadingPulse.center.y = self.pHTextField.frame.midY
        
        animatePulse()
        
    } // End ViewDidLoad
    
    @IBOutlet weak var loadingPulse: AnimationView!
    
    //MARK: - Pulse Animations
    // Move the pulsing animatins
    func animatePulse() {
        
        // 1 Load the pulse animation and show the alpha
        // Set the pulse back to the top of the pH label.
        // Animate the pulse to the center of the c02 label
        loadingPulse.center.y = self.pHTextField.frame.midY
        
        loadingPulse.animation = Animation.named("pulse")
        
        loadingPulse.alpha = 1
        
        // 2  Play the animation then do a completeion
        loadingPulse.play{ (finished) in
            // 3  Animate the pulse to the c02 label then pulse again.
            UIView.animate(withDuration: 0.8, animations: {
                
                self.loadingPulse.animation = Animation.named("pulse")
                
                // 4 Animate the pulse to the center of the c02 label
                self.loadingPulse.center.y = self.c02TextField.frame.midY
                
                // 5 replay the pulse animation and completion fade it out.
                self.loadingPulse.play{(finished) in
                    
                    // 6 Fade the pulse
                    self.loadingPulse.play{(finished) in
                        UIView.animate(withDuration: 1, animations: {
                            // Fade the view
                            self.loadingPulse.alpha = 0
                        })
                    }
                }
            })
        }}
    
    
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    // The code that will be executed when someone taps the first button of the refresh Screen
    @objc
    func firstButton() {
        print("Clear the screen button tapped")
        // func that clears the screen and resets the values
        exectueRefresh()
        
    }
    
    func clearTheScreen    () {
        
        let appearance = SCLAlertView.SCLAppearance(
            kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
            kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
            kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
            showCloseButton: false,
            dynamicAnimatorActive: true,
            buttonsLayout: .horizontal
        )
        
        let alert = SCLAlertView(appearance: appearance)
        //1  add the first button and direct the tap to the functioncalled firstButton
        _ = alert.addButton("Yes, refresh", target:self, selector:#selector(ABGViewController.firstButton))
        
        // 2 option to add a second button
        _ = alert.addButton("Nevermind") {
            print("Nevermind button tapped")
        }
        
        // Add iCon at the top
        let icon: UIImage = #imageLiteral(resourceName: "Refresh-2")
        // Color for the buttons and  iCon background
        let color = #colorLiteral(red: 0.8349413276, green: 0.3352985978, blue: 0.3409483433, alpha: 1)
        
        // Language to show the alert
        _ = alert.showCustom("Warning", subTitle: "All data will be lost, do you want to refresh?", color: color, icon: icon)
        
        
    }
    
    // Implement the code that flashes screen and resets the parameters
    func exectueRefresh()  {
        // Flash the screen like a screenShot
        if let flash = self.view {
            
            //Create the view
            let theView = UIView(frame: flash.bounds)
            theView.backgroundColor = UIColor.white
            theView.alpha = 1
            
            flash.addSubview(theView)
            
            // Set the animation block
            UIView.animate(withDuration: 1, animations: {
                theView.alpha = 0.0
            }, completion: {(finished:Bool) in
                print("inside")
                theView.removeFromSuperview()
            })
        }
        
        // Perform animation when the button is clicked
        
        animateBottomToTop()
        //animatePulse()
        
        // First Display the line then animate it again because i have the alpha at zero during the completion.
        pHSlideView.alpha = 1
        animatepHLineView()
        
        c02SlideView.alpha = 1
        animateC02LineView()
        
        // Hides the display images
        HC03Image.isHidden = true
        PHImage.isHidden = true
        C02Image.isHidden = true
        deltaBUTTON.isHidden = true
        theoryButton.isHidden = true
        ChlorideImage.isHidden = true
        SodiumImage.isHidden = true
        AlbuminImage.isHidden = true
        // Clearing the text fields and resetting images.
        
        let empty: String?
        empty = nil
        let displayString = empty ?? ""
        
        pHTextField.text = empty
        phSideLabel.text = "Enter pH to proceed"
        phSideLabel.textColor  =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        
        bicarbTextField.text = empty
        NATextField.text = empty
        CLTextfield.text = empty
        c02TextField.text = empty
        anionGapLabel.text = empty
        resultLabel.text = empty
        ExpectedC02Label.text = empty
        baseExcessSmallLabel.text = empty
        CLTextfield.text = displayString
        NATextField.text = empty
        AlbuminText.text = empty
        
        
        PrimaryDView.isHidden = true
        compensationlbl.isHidden = true
        
        c02SideLabel.text = "Enter PaC02 to proceed"
        c02SideLabel.textColor  =    #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        //Side labels
        bicarbSideLabel.text = "mEq/L"
        bicarbSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        bicarbTextField.placeholder = "HC03: 22-26"
        
        NaSideLabel.text = "mEq/L"
        NaSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        
        AlbuminSideLabel.text = "Optional - g/L"
        AlbuminSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        
        ChlorideSideLabel.text = "mEq/L"
        ChlorideSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        
        //bicarbSideLabel.blink()
        
        // Resets the button title back to normal
        AnalyzeButton.setTitle("Tap to Analyze", for: .normal)
        
        AnalyzeButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        
        // Animate the title label
        main_DisorderTitle_Label.animate(text: "Enter at least pH and PaC02", duration: 1, completion: nil)
        
        //DisplayArrows()
        
    }
    
    func display_pH_Arrows() {
        
        PHImage.isHidden = false
        
        // if we enter a C02 befor the pH, execute this guard statement first.
        guard let _  = pH_value else {
            // Code executed if the textField is left empty
            
            print ("Enter a pH to proceed") //Print statement on the console
            
            c02SideLabel.text = "Please enter a pH value" // Changes the textLabel's language
            
            return   }
        
        //initialize the class
        let myPh = Double(pHTextField.text!)
        
        // Set the ABG struct to gasRanges
        let phNormalRange = 7.35...7.45
        
        if phNormalRange.contains(myPh!)
        {
            PHImage.image = #imageLiteral(resourceName: "CheckMark")
            
            phSideLabel.text  = "pH is WNL"
            
            phSideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
            
            print("pH is normal arrow")
        }
            
            // pH is high normal limits
        else if (myPh! > 7.42 &&  myPh! <= 7.45)
        {
            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            
            phSideLabel.text  = "pH is WNL"
            
            phSideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
            
            print("pH is normal arrow")
        }
            
            // pH is low normal limits
        else if (myPh! > 7.35 &&  myPh! <= 7.38)
        {
            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            
            phSideLabel.text  = "pH is WNL"
            
            phSideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
            
            print("pH is normal arrow")
        }
        else if myPh! < 7.35 {
            PHImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            
            phSideLabel.text  = "Acidotic"
            
            phSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            print("pH is acidotic down arrow")
            
        }
            
        else if myPh! > 7.45 {
            PHImage.image = #imageLiteral(resourceName: "Aarow.up")
            
            phSideLabel.text  = "Alkalotic"
            
            phSideLabel.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            
            print("pH is alkalotic high arrow")
            
        }
        
        
    }
    
    func DisplayArrows() {
        // First run the bicarb calculation based off c02 and pH an then see if there's a manual input in the textField, if so use that.
        bicarbCalc()
        
        // Hides the display images
        PHImage.isHidden = false
        
        C02Image.isHidden = false
        
        HC03Image.isHidden = false
        
        //        SodiumImage.isHidden = false
        //
        //        ChlorideImage.isHidden = false
        //
        //        AlbuminImage.isHidden = false
        
        //MARK: GUARD Guard statement saying that if the weight is not entered and the calculated button is pushed, Print this statement.
        
        // if we enter a C02 befor the pH, execute this guard statement first.
        guard let _  = pH_value else {
            // Code executed if the textField is left empty
            
            print ("Enter a pH to proceed") //Print statement on the console
            
            c02SideLabel.text = "Please enter a pH value" // Changes the textLabel's language
            
            return   }
        
        //initialize the class
        let abgRanges = AbgRangeVariables()
        
        // Initialize the bicarb value
        let hc03_value = Double(bicarbTextField.text!)
        
        let naValue = Double(NATextField.text!)
        
        let clValue = Double(CLTextfield.text!)
        
        let albuminValue = Double(AlbuminText.text!)
        
        // Set the ABG struct to gasRanges
        var gasRanges = ABG(pH: pH_value!, c02: c02_value!, HC03: hc03_value, Sodium: naValue, Chloride: clValue, Albumin: albuminValue)
        
        
        
        if abgRanges.pH_normalRange.contains(gasRanges.pH)
        {
            PHImage.image = #imageLiteral(resourceName: "CheckMark")
            
            phSideLabel.text  = "pH is WNL"
            
            phSideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
        }
        
        if abgRanges.pH_Low_NormalRange.contains(gasRanges.pH)
        {
            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            
            phSideLabel.text  = "pH is low-normal"
            
            phSideLabel.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        if abgRanges.compensated_alkalosis_Metabolic_Ph.contains(gasRanges.pH)
        {
            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            
            phSideLabel.text  = "pH is high-normal"
            
            phSideLabel.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
        
        if abgRanges.normalco2.contains(gasRanges.c02)
        {
            C02Image.image = #imageLiteral(resourceName: "CheckMark")
            
            c02SideLabel.text  = "Normal PaC02"
            
            c02SideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
            //HexColor(hexString: "A0EEC0") // coolmint
        }
        
        
        if abgRanges.normalBicarb.contains(gasRanges.HC03!)
        {
            // We check to see if the HC03 textField is filled in first, and use that number. If not we calculate the bicarb and evaluate that number to see its condition.
            var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
            
            let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
            
            if hc03Text!.count > 0 {  hc03 = Double(hc03Text!)! }
            
            
            gasRanges.HC03! = hc03
            
            HC03Image.image = #imageLiteral(resourceName: "CheckMark")
            
            bicarbSideLabel.text = "Normal Bicarbonate"
            
            bicarbSideLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
            //HexColor(hexString: "A0EEC0") // coolmint
            
        }
        
        if abgRanges.ph_lowRange.contains(gasRanges.pH)
        {
            PHImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            
            
            phSideLabel.text  = "pH \(gasRanges.pH) (Acidemia < 7.35)"
            
            
            phSideLabel.textColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
        
        if gasRanges.c02 < 35.0
        {
            C02Image.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            //            c02SideLabel.text  = "Hypocapnic"
            c02SideLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
        
        if gasRanges.HC03! < 22.0  {
            
            // We check to see if the HC03 textField is filled in first, and use that number. If not we calculate the bicarb and evaluate that number to see its condition.
            var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
            
            let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
            
            if hc03Text!.count > 0 {
                hc03 = Double(hc03Text!)!
            }
            
            gasRanges.HC03! = hc03
            
            bicarbSideLabel.text = "⬇︎ HC03"
            
            bicarbSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            
            HC03Image.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            
            print("The bicarb is less than 22")
            
        }
        
        
        if gasRanges.pH > 7.46 {
            
            PHImage.image = #imageLiteral(resourceName: "Aarow.up")
            
            phSideLabel.textColor  =    #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
            phSideLabel.text  = "pH \(gasRanges.pH) (Alkalemia > 7.45)"
        }
        
        
        if gasRanges.c02 > 45.0 {
            
            C02Image.image = #imageLiteral(resourceName: "Aarow.up")
            
            //c02SideLabel.text  = "Hypercapnic"
            c02SideLabel.textColor  =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            
            print("The c02  is greater than 45")
            
        }
        
        
        if gasRanges.HC03! > 26.0 {
            // We check to see if the HC03 textField is filled in first, and use that number. If not we calculate the bicarb and evaluate that number to see its condition.
            var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
            
            let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
            
            if hc03Text!.count > 0 {
                hc03 = Double(hc03Text!)!
            }
            
            gasRanges.HC03! = hc03
            
            bicarbSideLabel.text = "⬆︎ HC03"
            
            bicarbSideLabel.textColor  =  #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            
            HC03Image.image = #imageLiteral(resourceName: "Aarow.up")
            
            print("The bicarb is greater than 26")
        }
        
        // When the bicarb is low
        if (gasRanges.HC03! < 1.0) {
            HC03Image.image = #imageLiteral(resourceName: "close_red")
        }
        
        // When the c02 is super low
        if ( gasRanges.c02 < 2.0) {
            
            C02Image.image = #imageLiteral(resourceName: "close_red")
        }
        
        // When the pH is too low
        if (gasRanges.pH < 6.0)  {
            
            PHImage.image = #imageLiteral(resourceName: "close_red")
            
            resultLabel.text = "A pH of \(gasRanges.pH) is unrealistic, re-check your value."
            
        }
    }
    
    
    // Computed properties for the textFields to return a doubleValue
    var pH_value: Double? {if let text = pHTextField.text {return
        Double(text)} else {return nil}}
    
    var c02_value: Double? { if let text = c02TextField.text { return Double(text) } else { return nil }}
    // var hc03_value: Double? { if let text = bicarbTextField.text { return Double(text) } else { return nil }}
    
    
    
    struct ABG {
        
        var pH: Double
        
        var c02: Double
        
        var HC03: Double? = nil
        
        var Sodium: Double? = nil
        
        var Chloride: Double? = nil
        
        var Albumin: Double? = nil
        
        
        //create your own init method which accepts only the parameters you need it to
        init(pH: Double, c02: Double, HC03: Double?, Sodium: Double?, Chloride: Double?, Albumin: Double?) {
            
            self.pH = pH; self.c02 = c02; self.HC03 = HC03; self.Sodium = Sodium; self.Chloride = Chloride; self.Albumin = Albumin
        }
        
    }
    
    
    // MARK:  Conforming to the abgClass to use at the bottom.
    let standardABGvaluesAre = AbgRangeVariables()
    
    
    // Button to tap to analyze the blood gas
    @IBAction func analyzeTheGas(_ sender: AnyObject) {
        analyzeGasParameters()
        showAnimate()
    }
    
    
    // Button to clear all the parameters
    @IBAction func clearTextFields(_ sender: Any) { clearTheScreen()  }
    
    
    
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ResultViewController {
            
            //Takes in for from the disorder label and sets it to the public var in the results view called titleLabel.
            destination.titleLabel = main_DisorderTitle_Label.text!
            
            // The conditions of pushCOndition etc. were set in the action above and now can take the gas info and be pushed.
            destination.interpretationInfo = pushPhcondition + pushC02condition + pushHC03condition
            
            
            
            print("Pushed in the segue\(pushPhcondition + pushC02condition + pushHC03condition)")
        }
        
    }
    
} // End of class


