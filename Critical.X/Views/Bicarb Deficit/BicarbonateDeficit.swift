//
//  ViewController.swift
//  Bicarbonate Deficit
//
//  Created by Jadie Barringer III on 1/11/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel


class BicarbonateDeficit: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var resultsView: UIView!
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var titleLabel: AKLabel!
    
    @IBOutlet weak var currentBicarbTxt: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!

    @IBOutlet weak var blankLabel: UILabel!
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Hides the button
        resultsView.isHidden = true
        
        //Rounds the button corners
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
       
        resultsView.clipsToBounds = true
        resultsView.layer.cornerRadius = 15
        
        // Animate the title label
        titleLabel.animate(text: "Bicarbonate Deficit", duration: 1, completion: nil)
     
        
        currentBicarbTxt.delegate = self
        weightTxt.delegate = self
        
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
    }
    
    // Closes the keyboard befor ethe view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    //MARK: - Bicarb Deficit Calculation
    /**
     Bicarbonate Defict Calculation that determines the deficit of NaHc03 based on the Weight and current HC03
     - parameters:
     - Weight: Take a weight
     - HC03: Current Bicarb Value
     
     BicarbDeficit = 0.4 x weight ( 24- current HC03)
     */
    
    func bicarbDeficit() -> String {
        
        //Declares the 2 variables needed to calcualte.
        let weight = Double(weightTxt.text!)
        let HC03 = Double(currentBicarbTxt.text!)
        
        //Throw function is the weight or bicarb is left blank
        guard let _ = weight, let _ = HC03 else {
        _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
            print("Values not entered properly."); return "" }
        
        //Unhides the view
        resultsView.isHidden = false
        
        self.view.endEditing(true) //This will hide the keyboard

        //Bicarb Deficit calcualtion
        let resultDeficit = (0.4 * weight! * (24 - HC03!))
        
        //Prints the result
        print(" The bicarb deficit is \(resultDeficit)")

        //Returns the calculation as a string.
        return "\(resultDeficit.oneDecimalPlace)"
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
        self.resultsView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultsView.alpha = 0.0;
        
        //Animation method
        UIView.animate(withDuration: 0.25, animations: {
            self.resultsView.alpha = 1.0
            self.resultsView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    
    //Calcualte Action
    @IBAction func calcualteBicarbDeficit(_ sender: Any) {
        
        resultLabel.text = bicarbDeficit()
        showAnimate()
    }
    
    @IBAction func dismissBicarbDeficit(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
}

