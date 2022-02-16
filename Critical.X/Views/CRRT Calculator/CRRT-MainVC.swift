//
//  CRRT-MainVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 6/1/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import SCLAlertView


class CRRT_MainVC: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var calculate: UIButton!
    @IBOutlet weak var kgWEight: UITextField!
    @IBOutlet weak var mLkgWeight: UITextField!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var finalDoseLabel: UILabel!
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Takes the button and makes it into a circle
        closeButton.clipsToBounds = true
        closeButton.layer.cornerRadius = 6
        
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        calculate.clipsToBounds = true
        calculate.layer.cornerRadius = 4
       
        // Hide the view initially
        resultView.isHidden = true
        // Do any additional setup after loading the view.
        
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
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.5, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
    }
    
    //MARK: - Formula for equation
    func calculateDialysisDose(weight: Double, dose: Double) -> Double {
        
        let calculation = weight * dose
        
        return calculation.roundTo(places: 1)
    }
    
    
    //MARK: - Calculte fn
    @IBAction func buttonPressed(_ sender: AnyObject) {
        // Unhide the view
        resultView.isHidden = false
        
        self.view.endEditing(true)

        //Declare variables
        let kg = Double(kgWEight.text!)
        
        let doseTxt = Double(mLkgWeight.text!)
        
        //Check to see if the textFields are filled in.
        guard  let _ = kg, let _ = doseTxt else {
        
            print("Make sure to fill in all values before calculating ")
            
            let alert = SCLAlertView()
            let alertText = "Make sure to fill in all values before calculating "
            _ = alert.showError("Wait...", subTitle: alertText)
            
            self.resultView.isHidden = true

            return
        }
        
        // What i specifically want to be colored.
        let newCalculation = "\(calculateDialysisDose(weight: kg ?? 0 , dose: doseTxt ?? 25.0).oneDecimalPlace)"
        // calculation from above fn.
        
        // Full Text.
        let  resultText = "With a weight of \(kg!) kg, and target dose of \(doseTxt!) ml/kg/hr\n\n The calculated desired dose of dialysate is \(newCalculation) mL/hr."
        
        //Create the attribute
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: resultText)
        let newFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        
        // Set the attribute.
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: newCalculation)
        attributedText.apply(font: newFont!, subString: newCalculation)
        
        // SEt the attribute to the label. 
        finalDoseLabel.attributedText = attributedText
        
        //Animate the view
        showAnimate()

    }
    
    
    @IBAction func closeDialysis(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Dialysis View Controller was dismissed")
        
    }
}
