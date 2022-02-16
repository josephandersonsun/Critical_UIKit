//
//  ViewController.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 11/29/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit


var calcNum: String = ""




class PedsViewController: UIViewController {
    
//    OUTLETS
    @IBOutlet weak var pediatricSubView: UIView!
    @IBOutlet weak var textFieldData: UITextField!
    @IBOutlet weak var calculate_Button: UIButton!
    @IBOutlet weak var closeBtnPeds: UIButton!
    
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pediatricSubView.backgroundColor =  FlatColor.BackgroundColor.Salmon.toUIColor()
        
        calculate_Button.backgroundColor = FlatColor.BackgroundColor.Salmon.toUIColor()
        calculate_Button.backgroundColor?.withAlphaComponent(0.4)
        
        // Rounds the corners of the button
        calculate_Button.clipsToBounds = true
        calculate_Button.layer.cornerRadius = 4
        
        
        // Rounds the corners of the View
        pediatricSubView.clipsToBounds = true
        pediatricSubView.layer.cornerRadius = 20
        pediatricSubView.layer.shadowOpacity = 0.00
        
        // Takes the button and makes it into a circle
        closeBtnPeds.layer.cornerRadius = closeBtnPeds.frame.size.width / 2
        
        //Looks for single or multiple taps.
        let _: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false…
    }
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
   
    //MARK:  Dismisses the ViewController
    
    @IBAction func dismissTheView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Connected to the new View Controller
    @IBAction func calculateDataButton(_ sender: UIButton) {
        
        /// if the textField is empty. the text will be set to zero and the UI Alert will come up.
        guard let theText = textFieldData.text, theText.isEmpty else {
            // theText is empty
            return // or throw
        }
        textFieldData.text = "0.0"
        
       
        _ = SCLAlertView().showError("Error!", subTitle:"Enter a weight greater than zero, and less than 80 kgs to calculate.", closeButtonTitle:"Got it")
        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
        

    }
    

    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        /// Checks ti see if the textField is empty, first, then text will be set to 0.0 and the UI Alert will come up. The segue will
        calcNum = textFieldData.text!
        
        
        if (textFieldData.text?.isEmpty)! 
        {
            textFieldData.text = "0.0"
        } else  {
            
            ///// Checks the segue destination, grabs the number value from the textfield and passes the data. 
            if let destination = segue.destination as? CalculatedDataViewController {
                
                destination.weightEntered = Double (textFieldData.text!)
                
            }
        }
        
    }
    
    /// Cancels the segue transition if the textBox is empty
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toDataSegue" {
            if (textFieldData.text?.isEmpty)! || (textFieldData.text == "0.0") {
                print("segue cancelled")
                return false
            }
        }
        
        // by default, transition
        return true
    }
    
}

