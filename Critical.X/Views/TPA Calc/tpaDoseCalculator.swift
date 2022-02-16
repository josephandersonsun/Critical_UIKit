//
//  tpaDoseCalculator.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/26/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import SCLAlertView

class tpaDoseCalculator: UIViewController {

    @IBOutlet weak var txt_weightLabel: UITextField!

    @IBOutlet weak var resultView: UIView!

    @IBOutlet weak var resulLabel: UILabel!
    
    @IBOutlet weak var closebutton: UIButton!
    
    //MARK: - ViewDIDLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        closebutton.clipsToBounds = true
        closebutton.layer.cornerRadius = 6

        // Show an alert about the dangers first.
        let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
        _ = SCLAlertView(appearance: appearance).showNotice("Important!!",
                                                            subTitle: "Use for ischemic strokes only - not for PE or MI. This is not a primary means to administer tPA. This is to double check your calculation!")
        
        
        // Hide the view
        resultView.isHidden = true

        
    }
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }

    //MARK: - Calculate TPA
    @IBAction func calculate(_ sender: AnyObject) {
       
        self.view.endEditing(true) //This will hide the keyboard

        //Vaiables for the switch statement to place inside of the function
        guard Double(txt_weightLabel.text!) != nil else {
            print("TPA Weight is empty")
            
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter both volume and duration values, then recalculate!")
            
            // Hide the view
            resultView.isHidden = false
            
            return
            
        }
        
        // Set the textLabel to thefunction that retuns the string
        resulLabel.text = "\(tpaCalc())"
        print("\(tpaCalc())")
        // Animate the view in
        showAnimate()
    
    }
    
    func tpaCalc()-> String {
        let weight = Double(txt_weightLabel.text!)
        
        // Total dose to be delivered
        let totalDose = 0.9 * weight!
        print("Total TPA dose is \(totalDose)")

        // 10 % of the total dose
        let bolusOVer1Min = totalDose * 0.1
        print("Bolus over 1 min is \(bolusOVer1Min)")

        // This is the remainder of the total dose after the bolus
        let infusionOver60Min = totalDose - bolusOVer1Min
        print("Infusion over 60Min is \(infusionOver60Min)")

        // Whats left, because theres 100 mg in each vial
        let wastedTpa = 100 - totalDose
        print("Wasted is \(wastedTpa)")
        
        return "Bolus to be given IV over 1 min is \(bolusOVer1Min.oneDecimalPlace) mg\n\nIV infusion over 60 min is \(infusionOver60Min.oneDecimalPlace) mg\n\nThe remaining \(wastedTpa.oneDecimalPlace) mg is to be discarded."
    }
    
    
    //MARK: - Close the viewController
    @IBAction func dismissTPA(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("TPA View Controller was dismissed")
        
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
        
        resultView.isHidden = false
        resulLabel.isHidden = false
        
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animation for the label to come in a little later
        self.resulLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.resulLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 0.5, animations: {
            self.resulLabel.alpha = 1.0
            self.resulLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }

}
