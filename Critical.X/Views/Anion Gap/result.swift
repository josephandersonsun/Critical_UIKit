//
//  ViewController.swift
//  AnionGapCalculator
//
//  Created by Jadie Barringer III on 1/3/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
//import SwiftyAttributes

class AnionGap: UIViewController {
    
    //Creates the outlets.
    @IBOutlet weak var NaTxt: UITextField!
    @IBOutlet weak var Cltxt: UITextField!
    @IBOutlet weak var hc03Txt: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var closeAnionGapButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var AGTitleLabel: AKLabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // Takes the button and makes it into a circle
        closeAnionGapButton.layer.cornerRadius = closeAnionGapButton.frame.size.width / 2
        resultView.isHidden = true
        
        /// Rounds the corners 15 pixels of the button name
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
        /// Rounds the corners 15 pixels of the result view
        resultView.clipsToBounds = true
        resultView.layer.cornerRadius = 15
        
        AGTitleLabel.animate(text: "Anion Gap", duration: 1, completion: nil)
        
    }
    
    // Closes the keyboard before the view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    func calculateAnionGap(Sodium: Double, Chloride: Double, Bicarb: Double) -> Double {
        
        return Sodium - (Chloride + Bicarb)
    }
    
    
    
    func deltaGap() -> Double {
        
        let theSodium = Double(NaTxt.text!)
        let theChloride = Double(Cltxt.text!)
        
        guard let _ = theSodium, let _ = theChloride else {
            
            print("delta Gap crashing"); return 0}
        
        let deltaGapResult = (theSodium! - theChloride!) - 36
        
        return deltaGapResult
        
    }
    
    
    @IBAction func calculateTheAnionGap(_ sender: Any) {
        
        //Assign the variables
        let theSodium = Double(NaTxt.text!)
        let theChloride = Double(Cltxt.text!)
        let theBicarb = Double(hc03Txt.text!)
        
        let Sodium = theSodium
        let Chloride = theChloride
        let Bicarb = theBicarb
        let deltaGap = self.deltaGap()
        
        //Guard Statement to break out if the text fields aren't all filled in.
        guard let _ = Sodium, let _ = Chloride, let _ = Bicarb else {
            print("Text Field is crashing. Values not appropriate.")
            
            // Add alertView
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")
            
            return
            
        }
        
        // Sets the text fields to these variables
        
        
        // Sets the Aniongap function to Result
        let result =  calculateAnionGap(Sodium: (Sodium!) , Chloride: (Chloride!), Bicarb: (Bicarb!))
        // Displays the result in the label
        resultLabel.text = "\(result)"
        // Sets the description label
        //descriptionLabel.text = "The Delta Gap is \(deltaGap)"

        //        descriptionLabel.animate(text: "The Delta Gap is \(deltaGap)", duration: 3, completion: nil)
        
      
        // What happens when the Anion Gap is calculated.
        switch result {
        case -100...0:
            
            
                // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
            
                descriptionLabel.text = "Negative Anion Gap at \(result.oneDecimalPlace) . This is most likely a lab error, however, this could also result from multiple myeloma, bromide and iodide toxicities as well."
            
            
            
        case 0...4:
    
              
               descriptionLabel.text = "Non-Anion Gap Metabolic Acidosis \(result.oneDecimalPlace)"
        
                
                print("Non-Anion Gap Metabolic Acidosis \(result.oneDecimalPlace).")
                
            
        case 4...12:
            // 6-12 before
        
                descriptionLabel.text  =   "Normal Anion Gap - \(result.oneDecimalPlace) "
                
                
                
                print("Metabolic Acidosis with normal Anion Gap present, check the urine gap")
                
                print("Normal Gap \(result.oneDecimalPlace).")
                
        
      
            
            
        case 12...100:
            
            // We are only displaying the delta gap and explanation only in metabolic acidosis.
    
                
                descriptionLabel.text = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was calculated at \(result.oneDecimalPlace)"
    
    
        default: break
    }
    
    

        
        
        self.view.endEditing(true) //This will hide the keyboard
        
        showAnimate()
}
    
    
    //Creates the animates in function.
    func showAnimate()
    {
        resultView.isHidden = false
        
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    @IBAction func dismissAnionGapMain(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
}

