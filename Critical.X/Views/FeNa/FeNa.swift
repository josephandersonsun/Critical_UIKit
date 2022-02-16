//
//  ViewController.swift
//  FeNa Calculator
//
//  Created by Jadie Barringer III on 1/12/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class FeNa: UIViewController {
    
    //mk//MARK: - Outlets
    
    @IBOutlet weak var SerumNaTxt: UITextField!
    
    @IBOutlet weak var SerumCrTxt: UITextField!
    
    @IBOutlet weak var UrineCrTxt: UITextField!
    
    @IBOutlet weak var UrineNaTxt: UITextField!
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it Doubleo a circle
            closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        }
    }
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var feNaView : UIView! {
        didSet {
//            feNaView.clipsToBounds = true
//            feNaView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var calcualteButton : UIView! {
        didSet {
            calcualteButton.clipsToBounds = true
            calcualteButton.layer.cornerRadius = 4
        }
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        feNaView.isHidden = true
    }
    
    
    //MARK: - FeNa Calculation Function
    /**
     FeNa Calculator. Calculates Mesures the percentage of filtered Na thats excreted in the urine.
     - parameters:
     - Urine Na: Describe the alpha param
     - Serum Na: Describe
     - Urine Creatinine:
     - Serum Creatinine:
     
     FeNa % = 100 * (SCr * UNa) / (SNa * UCr)
     */
    func fenaCalculation(SerumNa: Double, SerumCr: Double, UrineNa: Double, UrineCr: Double) -> Double {
        
        let fena = (100 * (SerumCr * UrineNa) / (SerumNa * UrineCr))
        
        return fena
    }
    
    
    @IBAction func buttonPressedToCalculate(_ sender: AnyObject) {
        
        showAnimate()
        
        //Variables
        
        let SerumCr = Double(SerumCrTxt.text!)
        
        let SerumNa = Double(SerumNaTxt.text!)
        
        let UrineCr = Double(UrineCrTxt.text!)
        
        let UrineNa = Double(UrineNaTxt.text!)
        
        //Unhides the view for animation
        feNaView.isHidden = false
        
        //This will hide the keyboard
        self.view.endEditing(true)
        
        
        
        //Guard statement to throw if the textFields are not entered.
        guard let _ = SerumNa, let _ = SerumCr, let _ = UrineCr, let _ = UrineNa else {
            
            ///Red Alert
            _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
            //hides the view for animation
            feNaView.isHidden = true
            
            return }
        
        let finalCalculation1 = fenaCalculation(SerumNa: SerumNa!, SerumCr: SerumCr!, UrineNa: UrineNa!, UrineCr: UrineCr!)
        
        let finalCalculation = String(format:"%.1f",finalCalculation1) // Rounds to the 1st decimal place
        
        resultsLabel.text = "\(finalCalculation) %"
        
        if finalCalculation1 <= 1 // This is pre-renal
            
        {
            descriptionLabel.text = "Pre-renal azotemia\n\nVolume depletion, hypotension, sepsis. Edematous states such as heart failure or cirrhosis. Anything causing renal hypoperfusion.\n\nRenal ischemia: Such as renal artery stenosis, ACE inhibitors, angiotension receptor blockers (ARB)."
        }
            
        else if (finalCalculation1 >= 1) && (finalCalculation1 <= 4) // This is Doublerinsic Renal failure
            
        {
            descriptionLabel.text = "Intrinsic\n\nAcute Tubular Necrosis (ATN): 3 common causes include: - 1) Renal ischemia - all of the pre-renal diseases. 2) Sepsis, renal hypoperfusion, and 3) Nephrotoxic medications: aminoglycosides, mannitol, hetastarch, cisplatin, cidofovir, synthethic drugs, radiocontrast. Acute Interstitial Nephritis (AIN), glomerulonephritides, etc."
            
        }
            
        else if finalCalculation1 > 4 // This is Post-Renal Failure
        {
            descriptionLabel.text = "Post-Renal failure-\n\nCauses may include any type of obstruction such as: Kidney stones, BPH, ureteral obstructions."
            descriptionLabel.textColor = UIColor.red
        }
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
        self.feNaView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.feNaView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.feNaView.alpha = 1.0
            self.feNaView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animation for the label to come in a little later
        self.descriptionLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.descriptionLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 1.0, animations: {
            self.descriptionLabel.alpha = 1.0
            self.descriptionLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
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
    @IBAction func closeFeNa (_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("FeNa View Controller was dismissed")
        
    }
}



