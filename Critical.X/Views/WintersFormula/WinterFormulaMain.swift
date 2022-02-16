//
//  ViewController.swift
//  Winters Formula
//
//  Created by Jadie Barringer III on 1/4/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit


class WinterFormulaMain: UIViewController {
    
    @IBOutlet weak var wintersResultLabel: UILabel!
    
    @IBOutlet weak var bicardTxtField: UITextField!
    
    @IBOutlet weak var resultsView: UIView!
    
    @IBOutlet weak var calculateBtn: UIButton!
    
    @IBOutlet weak var c02description: UILabel!
    
    @IBOutlet weak var currentC02: UITextField!
    
    @IBOutlet weak var descriptionViewBlack: UIView!
    
    @IBOutlet weak var wintersSmallTitleLabel: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var dismissButton: UIButton!
    
    
    
    
    //What happens when the view loads up.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the button and makes it into a circle
        /// Rounds the corners 15 pixels of the UIView name
//        resultsView.clipsToBounds = true
//        resultsView.layer.cornerRadius = 15
//
//        descriptionViewBlack.clipsToBounds = true
//        descriptionViewBlack.layer.cornerRadius = 15
        
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        
        //Hides the views when the view is loaded and waits till the calculate button is clicked
        resultsView.isHidden = true
        descriptionViewBlack.isHidden = true
        
        // wintersSmallTitleLabel.attributedText = NSAttributedString(string: "Winters Formula", attributes:
        //  [NSAttributedStringKey.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
        
        
        // Takes the button and makes it into a circle
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        
        
        // MARK: Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true) //This will hide the keyboard when view is dismissed.

    }
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    // MARK: - Winters Formula funciton
    func wintersFormula(theBicarb: Double ) -> Double {
        
        let bicarb = Double(bicardTxtField.text!)
        
        let winters = (1.5 * bicarb!) + 8
        
        
        guard let _ = bicarb else {
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")

            return winters
        }
        
        return winters
   }
    
    
    
    /// This checks the parameters of the c02. Sees is theres anything in the text field and evaluates it.
    func checkCo2Parameters() {
        
       

        
        // Setting the variables
        let co2entered = Double(currentC02.text!)
        
        let bicarb = Double(bicardTxtField.text!)
        
        let winters = (1.5 * bicarb!) + 8 // Used to compare the current c02 with the calculated winters formula
       
        //Guard statement to say, if theres nothing in the c02 box, then set it to be blank and the conditional below will make the description textField blank.
        guard co2entered != nil else {
            
            c02description.text = ""
            
            return
        }
        
      
        // If the current c02 is greated than the calculated c02
        if (co2entered! > winters + 2) {
            
            c02description.text = "A primary Respiratory Acidosis is likely!"
            
            print("Co2 entered is greater, c02 is \(co2entered!)")
            
        }
            // If the current c02 is less than the calculated c02
        else if (co2entered! < winters - 2) {
            
            c02description.text = "A primary Respiratory Alkalosis is likely!"
            
            print("Co2 entered is less,c02 entered is \(co2entered!)")
        }
            
            // If the current c02 is falls with in the parameters of the calculated c02
            // We are calling the rounded function, becayse thats how the value is presented in the result.
        else if (co2entered! >= winters.rounded() - 2) && (co2entered! <= winters.rounded() + 2) {
            
            c02description.text = "pC02 seems to be compensating normally"
          
            print("Co2 entered is WNL c02 entered is \(co2entered!)")
        }
    }
    // MARK: - Calcualte button Method
    

    // MARK:- Winters Formula
    func wintersFormula (calculatedBicarb: Double) -> String {
        
        //PCO2 = (HCO3 x 1.5) + 8 ± 2.
        let wintersLow = ((Double(calculatedBicarb) * 1.5 + 8) - 2).rounded()
        
        let wintersHigh = ((Double(calculatedBicarb) * 1.5 + 8) + 2).rounded()
        
        let wintersRange:ClosedRange<Double> = wintersLow...wintersHigh
        
        var winterVerbiage = String()
        
        let co2entered = Double(currentC02.text!)

        // Conditional to protect the c02 when not entered. 
        if let c02 = co2entered {
        
            if wintersRange.contains(co2entered!){
            // Then we add this string to the analysis when setting the text labels
            winterVerbiage = "The C02 is compensating nicely at \(co2entered!)"
        }
        
        if (Double(co2entered!)) < wintersLow {
            
            winterVerbiage = "The observed C02 tension is ⬇︎ at \(co2entered!) - which lower than the expected C02 compensation - \(wintersLow), suggesting that a concomitant Respiratory Alkalosis is also likely."
            wintersSmallTitleLabel.text = "Respiratory Alkalosis"

            print("WinterFormula Func: C02 lower than calculated winters")
            
        }
        
        if (Double(co2entered!)) > wintersHigh {
            
            winterVerbiage = "The observed C02 tension is ⬆︎ at \(co2entered!) - which is higher than the expected C02 compensation - \(wintersHigh), suggesting that a relative hypoventilation is increasing the pC02 causing a concomitant Respiratory Acidosis to compensate."
            
            wintersSmallTitleLabel.text = "Respiratory Acidosis"
            
            print("WinterFormula Func: C02 higher than calculated winters")
            //"The known PaC02 is higher than expected at \(c02_value!). A superimposed Respiratory Acidosis is also likely."
            //"The PaC02 is high at \(c02_value!)), which is higher than the expected PaC02 compensation, suggesting that a concomitant Respiratory Acidosis is likely in addition to the primary disorder."
        }
        
        
        } //  Closed iF let statement
        // Add the language to retuen along with the string variables.
        return "The corrected C02 should be " + " " + "\(wintersLow) - \(wintersHigh) " + "\n" + winterVerbiage
    }
    
    @IBAction func calculateWintersFormula(_ sender: Any) {
        
        let bicarb = Double(bicardTxtField.text!)
        let c02 = Double(currentC02.text!)
        
        
        //Vaiables for the switch statement to place inside of the function
        guard let bicarbs = Double(bicardTxtField.text!) else {
            print("Bicarb is empty")
            
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
           
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter at least a bicarb value, then recalculate!")
            
            resultsView.isHidden = true
            
            descriptionViewBlack.isHidden = true
            
            return
            
        }
        
        
        // What happens when only the bicarb is entered and c02 is blank
        guard c02 != nil else {
            
            wintersResultLabel.text = "\(Int(wintersFormula(theBicarb: bicarb!).rounded()) - 2)-\(Int(wintersFormula(theBicarb: bicarb!).rounded()) + 2) "
            
            //c02description.text = wintersFormula(calculatedBicarb: bicarb!)
            
            //Runs the first animation block
            showAnimate()
            //Runs the Second animation block
            newAnimation()
            
            wintersSmallTitleLabel.text = "Enter current c02 for more info!"
            // Unhide the result view
            resultsView.isHidden = false
            descriptionViewBlack.isHidden = false
            print("First block of winters was ran under the guard")
            
            return }
       
        //MARK: This block of code will only run when the bicarb and c02 is both entered since the c02 is optional
        print("Second block of winters was ran under the guard")
        
        c02description.text = wintersFormula(calculatedBicarb: bicarb!)
        
        wintersResultLabel.text = "\(Int(wintersFormula(theBicarb: bicarb!).rounded()) - 2)-\(Int(wintersFormula(theBicarb: bicarb!).rounded()) + 2) "
        
        //Runs the first animation block
        showAnimate()
        //Runs the Second animation block
        newAnimation()
        
        //checkCo2Parameters()
        
        resultsView.isHidden = false
        
        descriptionViewBlack.isHidden = false
        
    
    // Clear the keyboard, when the view is tapped.
        self.view.endEditing(true) //This will hide the keyboard

    }
    
   
    @IBAction func dismissWinters(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    
    
    // MARK: Animations
    func showAnimate()
    {
        //animates the description label
        self.descriptionViewBlack.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.descriptionViewBlack.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.descriptionViewBlack.alpha = 1.0
            self.descriptionViewBlack.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func newAnimation() {
        // Brings in the result label with a slow animation.
        self.resultsView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultsView.alpha = 0.0;
        UIView.animate(withDuration: 1, animations: {
            self.resultsView.alpha = 1.0
            self.resultsView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            
            //self.resultsView.frame = CGRect(x: 8, y: 500-100, width: 359, height: 174)
        })
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

