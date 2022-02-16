//
//  VentilatorOptimizationMain.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/7/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
import SCLAlertView

//import SwiftRichString
//extension UIScrollView {
//    //it will block the mainThread
//    func recalculateVerticalContentSize_synchronous () {
//        let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
//        self.contentSize = CGRect(x: 0, y: 0, width: self.frame.width, height: unionCalculatedTotalRect.height).size
//        //(0, 0, self.frame.width, unionCalculatedTotalRect.height).size;
//    }
//    
//    private func recursiveUnionInDepthFor (view: UIView) -> CGRect {
//        var totalRect = CGRect.zero
//        //calculate recursevly for every subView
//        for subView in view.subviews {
//            totalRect =  totalRect.union(recursiveUnionInDepthFor(view: subView))
//        }
//        //return the totalCalculated for all in depth subViews.
//        return totalRect.union(view.frame)
//        
//    }
//}



class VentOptimizatoinViewController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - Outlets
    
    //TextFields
    @IBOutlet weak var CurrentC02: UITextField!
    @IBOutlet weak var Freq: UITextField!
    @IBOutlet weak var TargetC02: UITextField!
    @IBOutlet weak var TV: UITextField!
    
    //Labels
    @IBOutlet weak var considerationsLabel: AKLabel!
    @IBOutlet weak var VentResult: UILabel!
    @IBOutlet weak var ventResultDescriptionLabel: UILabel!
    @IBOutlet weak var ventOptimatzationResultView: UIView!
    
    //Buttons
    @IBOutlet weak var closeButtonMain: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var sideLineView: UIView!
    @IBOutlet weak var ventScroller: UIScrollView!
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    // MARK: - View Didload method
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        ventScroller.recalculateVerticalContentSize_synchronous()
        
        // Do any additional setup after loading the view.
        //ventOptimatzationResultView.isHidden = true
        
        // Round the corners of the top of the UIView
        //        ventOptimatzationResultView.clipsToBounds = true
        //        ventOptimatzationResultView.layer.cornerRadius = 15
        //
        
        // Takes the button and makes it into a circle
        closeButtonMain.layer.cornerRadius = closeButtonMain.frame.size.width / 2
        
        
        
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    //MARK: - View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        animateBottomToTop()
        // We start by animating the label from the bottom to the top
    }
    
    // MARK: - Keyboard Dismissed
    /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    @IBAction func dismissVentOptimizationView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    // MARK: - TextField should return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true;
    }
    
   
    
    
    func analyzeVentSettings() {
        
        //Set the variables.
        let CurrentC02 = Double(self.CurrentC02.text!)
        
        let Freq = Double (self.Freq.text!)
        
        let TV = Double(self.TV.text!)
        
        let TargetC02 = Double(self.TargetC02.text!)
        
        // If any of these Optional values are NIL (or Empty) then Initiate the following code before the return value.
        guard (CurrentC02 != nil), (Freq != nil), (TV != nil), (TargetC02 != nil) else {
            print("Items not entered totally")
            
            _ = SCLAlertView().showError("Hold On...", subTitle:"Enter all fields to calculate...", closeButtonTitle:"OK")
            // Runs Animation
            showAnimate()
            
            //Hiding the labels
            ventResultDescriptionLabel.isHidden = true
            considerationsLabel.isHidden = true
            
            //Changes the color of the label/View and displays different text for the error.
            VentResult.text = "Error! Enter all values, then recalculate."
            VentResult.textColor = #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1)
            //ventOptimatzationResultView.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
            
            return
        } // Runs code below if things are entered correctly.
        
        
        //Unhide the labels
        ventResultDescriptionLabel.isHidden = false
        considerationsLabel.isHidden = false
        
        
        //Changes the colors/views back to the standard values.
        VentResult.textColor = #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
        //ventOptimatzationResultView.backgroundColor = UIColor.white
        
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
            
            // If the MV is +
            if (_adjustedMV > 1.0) {
                upDown = "⬆︎"
            }
                // If the MV needs to be adjusted down we write down
            else if (_adjustedMV < 0) {
                upDown = "⬇︎"
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
                upDown = "⬆︎"
            } else if (newTV < TV!) {
                upDown = "⬇︎"
            }
            
            print("The adjusted TV is \(_adjustedMV) and will adjust \(upDown)")
            return upDown
        }()
        
        let actual = "The calculated Minute Volume (VE), with a Tidal Volume (TV) of" // Used in the result text to have the color changed in the label
        
        let consider =  "Consider adjusting the tidal volume \(upDownConsideration) to" //Used in the resulting text to have the color changed in the label
        
        
        // Code to change the color of centain strings
        let range = (actual as NSString).range(of: actual)
        
        let attribute = NSMutableAttributedString.init(string: actual)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        
        
        // Displays the result of the calculations in the Result box through different labels.
        
        let newTidalVolume = "\(Int(NEwTV))"
        let newRespRateText = "\(Int(NewRR))"
        
        let resultChanges = "\(consider) \(Int (NEwTV)) mL's or the respiratory rate to \(Int(NewRR)) /min."
        
       
        ventResultDescriptionLabel.text = "\(actual)  \(Int (TV!)) and RR of \(Int (Freq!)) is \n\(Double (MV)) L/min."
        
        VentResult.text = "To achieve a target PC02 of \(Int (TargetC02!)), adjust the minute volume \(upDown) \(adjustedMV) L/min, to a target VE of \(TargetMV1) L/min."
        
        //animates the label over 2 seconds
        //considerationsLabel.animate(text: attributedText, duration: 2, completion: nil)
        
        var attributedText = NSMutableAttributedString.getAttributedString(fromString: resultChanges)
        
        // Apply the attributes
        attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newTidalVolume)
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 16), subString: newTidalVolume)
        
        attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newRespRateText)
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 16), subString: newRespRateText)
        
        considerationsLabel.attributedText = attributedText
    
        self.view.endEditing(true) //This will hide the keyboard
        
        
        // Show the animations
        showAnimate()
    }
    
    
    
    // MARK: - When the button is pressed, Analyze method - vent calculations.
    @IBAction func VentAnalyze(_ sender: Any)
    {
        // Run the analysis function
        analyzeVentSettings()
        
        // Run the bottom to top line animation
        animateBottomToTop()
    }
    
    
    
    @IBOutlet weak var lungsImage: UIImageView!
    
    
    // MARK: - Create Animations
    func showAnimate()
    {
        
        self.considerationsLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.considerationsLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.considerationsLabel.alpha = 1.0
            self.considerationsLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    
    // MARK: - Exiting Methods
    
    // Closes the keyboard before the view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    
    ///Dismisses the view Controller
    @IBAction func closeMainVentOptimizationViewController(_ sender: Any) {
        
        
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
        _ = alert.addButton("Yes, refresh", target:self, selector:#selector(VentOptimizatoinViewController .refreshButton))
        
        // 2 option to add a second button
        _ = alert.addButton("Nevermind") {
            print("Nevermind button tapped")
        }
        
        // Add iCon at the top of the Alert Icon
        let icon: UIImage = #imageLiteral(resourceName: "CRITICAL4-1")
        // Color for the buttons and  iCon background
        let color = #colorLiteral(red: 0.8349413276, green: 0.3352985978, blue: 0.3409483433, alpha: 1)
        
        // Language to show the alert
        _ = alert.showCustom("Warning", subTitle: "All data will be lost, do you want to refresh?", color: color, icon: icon)
        
   }
    
    
    @objc func refreshButton() {
        // execute refresh function
        executeRefreshScreen()
        
        print("Screen Was refreshed on Vent optimization")
    }
    
    
    func executeRefreshScreen()  {
        Freq.text = ""
        TV.text = ""
        CurrentC02.text = ""
        TargetC02.text = ""
        ventResultDescriptionLabel.text = ""
        VentResult.text = ""
        considerationsLabel.text = ""
        
        //Run the animation of the line
        animateBottomToTop()
    }
    
    // Set the outlets up so that the line can reference them for animations
    @IBOutlet weak var RespRateSideLabel: UILabel!
    @IBOutlet weak var tidalVolumeSideLabel: UILabel!
    @IBOutlet weak var c02SideLabel: UILabel!
    @IBOutlet weak var targetC02SideLabel: UILabel!
    
    //MARK: - RR Change in RealTime and run animation block
    @IBAction func changeRR(_ sender: UITextField) {
        
        if sender.isFirstResponder {
            animateResp()
        }
    }
    
    
    @IBAction func changeTV_realTime(_ sender: UITextField) {
        if (sender as AnyObject).isFirstResponder {
            animateTidalVolume()
        }
    }
    
    @IBAction func currentC02_realTime(_ sender: UITextField) {
        
        if sender.isFirstResponder {
            animateCurrentC02()
        }
    }
    
    
    @IBAction func desiderdC02_realTime(_ sender: UITextField) {
        if sender.isFirstResponder {
            animateDesiredC02()
        }
    }
    
}




extension VentOptimizatoinViewController {
    
    // Animations for the line
    
    // Animate to the top of the Resp Label
    /// WE are animating the view and centering the view line to the Top of the Y position of another label
    func animateResp() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.sideLineView.center.y = self.RespRateSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    
    // Animate to the TV Label
    func animateTidalVolume() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.sideLineView.center.y = self.tidalVolumeSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    // Animate to the current C02 Label
    func animateCurrentC02() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.sideLineView.center.y = self.c02SideLabel.frame.origin.y
            self.sideLineView.backgroundColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
        }, completion: nil)
    }
    
    
    // Animate to the desired C02 Label
    func animateDesiredC02() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.sideLineView.center.y = self.targetC02SideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    
    // Animate to the top from the bottom Label
    func animateBottomToTop() {
        // This is where where the animations starts
        UIView.animate(withDuration: 1, animations: {
            
            if  self.sideLineView.center.y == self.targetC02SideLabel.frame.origin.y
                
            {
                // If the line is already at the bottom at the position label albumin. Then we don't want to wait 1 sec, change the color and speed up the animation transition.
                UIView.animate(withDuration: 0.5, animations: {
                    
                    // Implement animations and start the animation from current position down to the botton of the albumin label.
                    self.sideLineView.center.y = self.targetC02SideLabel.frame.origin.y
                    self.sideLineView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    
                })
            }
                
            else
                
            {
                // Implement animations and start the animation from current position down to the botton of the albumin label.
                self.sideLineView.center.y = self.targetC02SideLabel.frame.origin.y
                self.sideLineView.backgroundColor = #colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1)
            }
            
            
        }, completion: { (finished) in
            
            // When it gets to the end, we want it to animate back to the top
            UIView.animate(withDuration: 1, animations: {
                self.sideLineView.center.y = self.RespRateSideLabel.frame.origin.y
                self.sideLineView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            })
        }
        )
    }
    
} // end extension
