//
//  ViewController.swift
//  O2TankCalculator
//
//  Created by Jadie Barringer III on 1/2/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class O2TankCalculator: UIViewController {
    
    
    @IBOutlet weak var o2DetailView: UIView!
    
    @IBOutlet weak var psitTxt: UITextField!
    
    @IBOutlet weak var litersMinTxt: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var segmento2: CustomSegmentedController?
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var closebutton02: UIButton!
   
    @IBOutlet weak var calculateButton: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Rounds the corners 15 pixels of the UIView name
       
        
        //Hides the view initally
        o2DetailView.isHidden = true
        
        // Takes the button and makes it into a circle
        closebutton02.layer.cornerRadius = closebutton02.frame.size.width / 2
        
        /// Rounds the corners 15 pixels of the button name
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
        
        //Add items to the segmented Control // Takes the button and makes it into a circle
        segmento2?.items = ["D", "E", "G", "H/K", "M", "EC 135 1"]
        
    }
    
    
   
    
    @IBAction func segment02(_ sender: Any) {
        
    }
    
    func minutesToHours(minutes : Int) -> (Int , Int) {
        return (minutes / 60, (minutes % 60))
    }
    
   
    
  
    
    
    @IBAction func calculateO2(_ sender: Any) {
        
        let psi = Double(psitTxt.text!)
        let liters = Double(litersMinTxt.text!)
        _ = Double(resultsLabel.text!)
        
        guard let _ = psi, let _ = liters else {
            
//            _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the fields before calculating.", closeButtonTitle:"OK")
            //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")
            
            return print("Oops none of the textFields were closed.") }

        /* Tank Conversion Coefficients
         Calculation is ((psi! - 200) * 0.16 / liters!)
         D = 0.16
         E = 0.28
         G = 2.41
         H/K = 3.14
         M = 1.56
         */
        
        let D: Double = ((psi! - 200) * 0.16 / liters!)
        let E: Double = ((psi! - 200) * 0.28 / liters!)
        let G: Double = ((psi! - 200) * 2.41 / liters!)
        let HK: Double = ((psi! - 200) * 3.14 / liters!)
        let M: Double = ((psi! - 200) * 1.56 / liters!)
        
        if (resultsLabel.text! > "0.0") {
            
            switch segmento2?.selectedIndex {
            case 0?:
                resultsLabel.text = String(format:"%.1f",D) // Rounds to the 1st decimal place
                
                print("Tank D was selected")
                
                o2DetailView.isHidden = false
                
                minutesLabel.text = "Minutes"
                
                descriptionLabel.text = "A \"D\" cylinder with \(psi!) PSI at \(liters!) L/min"
                
                showAnimate()
               
                if (resultsLabel.text! < "0.0") {
                   
                    
                    minutesLabel.text = "Refill the tank"
                    
                    resultsLabel.text = "Empty Tank"
                    
                    resultsLabel.textColor = UIColor.yellow
                    
                    o2DetailView.isHidden = false
                    
                    descriptionLabel.text = "Looks like the tank is"
                    
                    descriptionLabel.textColor = UIColor.gray

                    showAnimate()
                }
                
            case 1?:
                resultsLabel.text = E.oneDecimalPlace
               
                print("Tank E was selected")
               
                o2DetailView.isHidden = false
               
                minutesLabel.text = "Minutes"
               
                descriptionLabel.text = "An \"E\" cylinder at \(psi!) PSI at \(liters!) L/min"

                showAnimate()
                
            case 2?:
                
                resultsLabel.text = G.oneDecimalPlace
                
                print("Tank G was selected")
                
                o2DetailView.isHidden = false
                
                minutesLabel.text = "Minutes"
                
                descriptionLabel.text = "A \"G\" cylinder at \(psi!) PSI on \(liters!) L/min"


                showAnimate()
                
            case 3?:
                
                resultsLabel.text = HK.oneDecimalPlace
                
                print("Tank HK was selected")
                
                o2DetailView.isHidden = false
                
                minutesLabel.text = "Minutes"

                descriptionLabel.text = "An \"H/K\" cylinder at \(psi!) PSI on \(liters!) L/min"

                showAnimate()
                
            case 4?:
                
                resultsLabel.text = M.oneDecimalPlace
                
                print("Tank M was selected")
                
                o2DetailView.isHidden = false
                
                minutesLabel.text = "Minutes"

                descriptionLabel.text = "An \"M\" cylinder with \(psi!) PSI at \(liters!) L/min"

                showAnimate()
                
            default:
                break
            }
        }
        else if (resultsLabel.text! < "0.0") {
           
            minutesLabel.text = "Refill tank"
           
            resultsLabel.text = "Empty Tank"
           
            o2DetailView.isHidden = false
           
            showAnimate()
        }
        
        self.view.endEditing(true)
        
    }
    

    func showAnimate()
    {
        self.o2DetailView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.o2DetailView.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.o2DetailView.alpha = 1.0
            self.o2DetailView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    @IBAction func dismiss02View(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
   
   
}

