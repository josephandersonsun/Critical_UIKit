//
//  VentilatorOptimizationMain.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/7/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
//import SwiftRichString

class VentilatorOptimizationMain: UIViewController {
    
    
    // MARK: - Outlets
    
    //TextFields
    @IBOutlet weak var CurrentC02: UITextField!
    @IBOutlet weak var Freq: UITextField!
    @IBOutlet weak var TargetC02: UITextField!
    @IBOutlet weak var TV: UITextField!
    
    //Labels
    @IBOutlet weak var considerationsLabel: UILabel!
    @IBOutlet weak var VentResult: UILabel!
    @IBOutlet weak var ventResultDescriptionLabel: UILabel!
    @IBOutlet weak var ventOptimatzationResultView: UIView!
    
    //Buttons
    @IBOutlet weak var closeButtonMain: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var BGView: UIView!
    @IBOutlet weak var ventScroller: UIScrollView!
 
    // MARK: - View Didload method
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
    ventScroller.recalculateVerticalContentSize_synchronous()
        
        // Do any additional setup after loading the view.
        ventOptimatzationResultView.isHidden = true
        
        // Round the corners of the top of the UIView
        ventOptimatzationResultView.clipsToBounds = true
        ventOptimatzationResultView.layer.cornerRadius = 15
        
        
        // Takes the button and makes it into a circle
        closeButtonMain.layer.cornerRadius = closeButtonMain.frame.size.width / 2
        
        
        
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    // MARK: - Keyboard Dismissed
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    // MARK: - TextField should return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
    
    // MARK: - Analyze method - vent calculations.
    @IBAction func VentAnalyze(_ sender: Any)
    {
        
        //First unhide the UIView
        ventOptimatzationResultView.isHidden = false
        
        
        
        //Set the variables.
        let CurrentC02 = Double(self.CurrentC02.text!)
        
        let Freq = Double (self.Freq.text!)
        
        let TV = Double(self.TV.text!)
        
        let TargetC02 = Double(self.TargetC02.text!)
        
        // If any of these Optional values are NIL (or Empty) then Initiate the following code before the return value.
        guard (CurrentC02 != nil), (Freq != nil), (TV != nil), (TargetC02 != nil) else {
            print("Items not entered totally")
            
            // Runs Animation
            showAnimate()
            
            //Hiding the labels
            ventResultDescriptionLabel.isHidden = true
            considerationsLabel.isHidden = true
            
            //Changes the color of the label/View and displays different text for the errror.
            VentResult.text = "Error! Enter all values, then recalculate."
            VentResult.textColor = #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1)
            ventOptimatzationResultView.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
            
            return
        } // Runs code below if things are entered correctly.
        
        
        //Unhide the labels
        ventResultDescriptionLabel.isHidden = false
        considerationsLabel.isHidden = false
        
        
        
        //Changes the colors/views back to the normal values.
        VentResult.textColor = #colorLiteral(red: 0.5569999814, green: 0.5690000057, blue: 0.5609999895, alpha: 1)
        ventOptimatzationResultView.backgroundColor = UIColor.white
        
        let MV = Freq! * TV!/1000
        
        let TargetMV = (MV * (CurrentC02!))/TargetC02!
        
        let TargetMV1 = String (format: "%.1f", TargetMV) // Takes the above string and rounds it up with 1 sig figs.
        
        let _adjustedMV = (TargetMV - MV)
        
        let adjustedMV = String (format: "%.1f", _adjustedMV)
        
        let NewRR = Double ((TargetMV)/500 * 1000)
        
        let NEwTV = Double ((TargetMV)/Freq! * 1000)
        
        // Up Down closure to evaluate whether or not a value has changed, then change the string.
        let upDown: String = {
            
            var upDown = String()
            
            if (_adjustedMV > 1.0) {
                upDown = "up"
            } else if (_adjustedMV < 0) {
                upDown = "down"
            }
            print("The adjusted TV is \(_adjustedMV) and will adjust \(upDown)")
            return upDown
        }()
        
        // Up Down closure to evaluate whether or not a value has changed, then change the string.
        let upDownConsideration: String = {
            
            var upDown = String()
            let tv = TV
            let newTV = NEwTV
            
            if (newTV > TV!) {
                upDown = "up"
            } else if (newTV < TV!) {
                upDown = "down"
            }
            print("The adjusted TV is \(_adjustedMV) and will adjust \(upDown)")
            return upDown
        }()
        let actual = "The calculated Minute Volume (MV), with a Tidal Volume (TV) of" // Used in the result text to have the color changed in the label
        
        let consider =  "Consider adjusting the Tidal Volume \(upDownConsideration) to" //Used in the result text to have the color changed in the label
        
        
        // Code to change the color of centain strings
        let range = (actual as NSString).range(of: actual)
        
        let attribute = NSMutableAttributedString.init(string: actual)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        
        
        // Displays the result of the calculations in the Result box through different labels.
        
        ventResultDescriptionLabel.text = "\(actual)  \(Int (TV!)) and RR of \(Int (Freq!)) is \n\(Double (MV)) L/min."
        
        VentResult.text = "To achieve a target PC02 of \(Int (TargetC02!)), adjust the Minute Volume \(upDown) \(adjustedMV) L/min, to a Target Minute Volume of \(TargetMV1) L/min."
        
        
        considerationsLabel.text = "\(consider) \(Int (NEwTV)) mL's or the Respiratory rate to \(Int(NewRR))/min."
        
        
        self.view.endEditing(true) //This will hide the keyboard
        
        
        // Show the animations
        showAnimate()
    }
    
    
    // MARK: - Create Animations
    
    func showAnimate()
    {
        // Animation for the Results UIView
        self.ventOptimatzationResultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.ventOptimatzationResultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.ventOptimatzationResultView.alpha = 1.0
            self.ventOptimatzationResultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        // Animation for the Results Consideration label to come in a little later
        self.considerationsLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.considerationsLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.considerationsLabel.alpha = 1.0
            self.considerationsLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    
    // MARK: - Exiting Methods
    
    // Closes the keyboard befor ethe view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    
    ///Dismisses the view Controller
    @IBAction func closeMainVentOptimizationViewController(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
}





