//
//  newO2TankCalc.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/18/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import McPicker

var biasFlow: Int = 0

class newO2TankCalc: UIViewController {

    
    @IBOutlet weak var psitTxt: UITextField!
    
    @IBOutlet weak var litersMinTxt: UITextField!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBOutlet weak var ventSegmento2: UISegmentedControl!
    
    @IBOutlet weak var biasFLowSegnent: UISegmentedControl!

    @IBOutlet weak var biasFlowLabel: UILabel!
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var closebutton02: UIButton!
    
    @IBOutlet weak var usablePsi: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /// Rounds the corners 15 pixels of the UIView name
        
        rrTextField.isHidden = true
        
        tvTextField.isHidden = true
        
        tvLabel.isHidden = true
        
        respRateLabel.isHidden = true
        
        fi02Label.isHidden = true
        
        fi02TextField.isHidden = true

        resultView.isHidden = true
        
        biasFLowSegnent.isHidden = true

        biasFlowLabel.isHidden = true
        
        biasFlow = 3
        
        usablePsi.text = "Enter total PSI available"

        biasFlowLabel.text = " Adult/Peds Circut: A bias flow of 3 L/min added to the flow rate"

        // Takes the button and makes it into a circle
        closebutton02.layer.cornerRadius = closebutton02.frame.size.width / 2
        
        
        // Takes care of the keyboard dismiss
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        loadpositions()
    }
    
    @IBAction func dismiss02(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    
    //Set the biasFlow rate
    @IBAction func setBiasFlow(_ sender: Any) {
        
        switch biasFLowSegnent.selectedSegmentIndex {
        case 0:
            biasFlow = 3
            biasFlowLabel.text = "ADULT/PEDS CIRCUT: A BIAS FLOW OF 3 L/MIN IS ADDED TO THE FLOW RATE."
            print("Bias flow rate is \(biasFlow)")
        case 1:
            biasFlow = 4
            print("Bias flow rate is \(biasFlow)")
            biasFlowLabel.text = "NEONATAL CIRCUT: A BIAS FLOW OF 4 L/MIN IS ADDED TO THE FLOW RATE."

        case 2:
            biasFlow = 0
            biasFlowLabel.text = "NO BIAS FLOW ADDED TO THE FLOW RATE."

            print("Bias flow rate is \(biasFlow)")

        default:
            break
        }
    }
    // initial place for label and button
    func loadpositions()  {
        
        // These are the postions we want the view and labesl to start when the view loads.
//        self.cylinderLabel.frame = CGRect(
//            x: 17,
//            y: 306,
//            width: self.view.bounds.width,
//            height: self.cylinderLabel.frame.size.height)
//
//        self.pickerButton.frame = CGRect(
//            x: 20,
//            y: 325,
//            width: self.view.bounds.width,
//            height: self.pickerButton.frame.size.height)
//
//        self.resultView.frame = CGRect(
//            x: 6,
//            y: self.pickerButton.frame.maxY + 5,
//            width: self.view.bounds.width,
//            height: self.resultView.frame.size.height)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            
            
            //Animations
            self.rrTextField.isHidden = true
            
            self.tvTextField.isHidden = true
            
            self.tvLabel.isHidden = true
            
            self.respRateLabel.isHidden = true
            
            self.fi02Label.isHidden = true
            
            self.fi02TextField.isHidden = true
            
            self.biasFLowSegnent.isHidden = true
            
            self.biasFlowLabel.isHidden = true
            
            
            self.cylinderLabel.frame = CGRect(
                x: 17,
                y: 306,
                width: self.view.bounds.width,
                height: self.cylinderLabel.frame.size.height)
            
            self.pickerButton.frame = CGRect(
                x: 20,
                y: 325,
                width: self.view.bounds.width,
                height: self.pickerButton.frame.size.height)
            
            self.resultView.frame = CGRect(
                x: 6,
                y: self.pickerButton.frame.maxY + 5,
                width: self.view.bounds.width,
                height: self.resultView.frame.size.height)
            
            // Clear the textFields.
            self.psitTxt.text = ""
            
            self.litersMinTxt.text = ""
            
            self.rrTextField.text = ""
            
            self.tvTextField.text = ""
            
            self.fi02TextField.text = ""
            
            self.resultView.isHidden = true
            
            self.pickerButton.text("Select Tank Size")
            
            
            print("textFields were cleared.")
            
        }, completion: { (finished) in
            print("complete")
        })

    }
    
    @IBAction func psiChanged(_ sender: UITextField) {
        
        let newPsi = Double(sender.text!)
        
        // If we delete text values it changes the usable psi text and doesnt calculate.
        guard newPsi != nil else {
            print("new PSI is empty")
            
            // Set the label to be empty and not to calculate
            usablePsi.text = "Usable PSI:"

            return
        }
        
        usablePsi.text = "Usable PSI: \(Int(newPsi! - 200))"

    }
    
    @IBOutlet weak var rrTextField: UITextField!
    
    @IBOutlet weak var tvTextField: UITextField!
    
    @IBOutlet weak var fi02TextField: UITextField!

    @IBOutlet weak var tvLabel: UILabel!
    
    @IBOutlet weak var respRateLabel: UILabel!
  
    @IBOutlet weak var cylinderLabel: UILabel!
    
    @IBOutlet weak var pickerButton: UIButton!
   
    @IBOutlet weak var fi02Label: UILabel!
    
    @IBOutlet weak var lMinLabel: UILabel!
    
    



/// Keyboard Dismissed after you touch the screen
func doneButtonAction() {
    self.view.endEditing(true)
}
    
    
    
    // Changing the segeent and variables
    @IBAction func ventSegment(_ sender: Any) {
        
        switch ventSegmento2!.selectedSegmentIndex {
        
        case 0:
            
            print("free flow selected")
        
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                
                
                //Animations
                self.rrTextField.isHidden = true
                
                self.tvTextField.isHidden = true
                
                self.tvLabel.isHidden = true
                
                self.respRateLabel.isHidden = true
                
                self.fi02Label.isHidden = true
                
                self.fi02TextField.isHidden = true
                
                self.biasFLowSegnent.isHidden = true
                
                self.biasFlowLabel.isHidden = true

                
                self.cylinderLabel.frame = CGRect(
                    x: 17,
                    y: 306,
                    width: self.view.bounds.width,
                    height: self.cylinderLabel.frame.size.height)
                
                self.pickerButton.frame = CGRect(
                    x: 20,
                    y: 325,
                    width: self.view.bounds.width,
                    height: self.pickerButton.frame.size.height)
                
                self.resultView.frame = CGRect(
                    x: 6,
                    y: self.pickerButton.frame.maxY + 5,
                    width: self.view.bounds.width,
                    height: self.resultView.frame.size.height)
                
                // Clear the textFields.
                self.psitTxt.text = ""
                
                self.litersMinTxt.text = ""
                
                self.rrTextField.text = ""
                
                self.tvTextField.text = ""
                
                self.fi02TextField.text = ""
                
                self.resultView.isHidden = true
                
                self.pickerButton.text("Select Tank Size")

                
                print("textFields were cleared.")
                
            }, completion: { (finished) in
                print("complete")
            })
            
        case 1:
            
          
            
            print("ventilator  selected")

            lMinLabel.text = "L/Min (optional)"
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
                
                self.rrTextField.isHidden = false
                
                self.tvTextField.isHidden = false
                
                self.tvLabel.isHidden = false
                
                self.respRateLabel.isHidden = false
                
                self.fi02Label.isHidden = false
                
                self.fi02TextField.isHidden = false
                
                self.biasFLowSegnent.isHidden = false
                
                self.biasFlowLabel.isHidden = false

                
                self.cylinderLabel.frame = CGRect(
                    x: 17,
                    y: self.fi02Label.frame.maxY + 10,
                    width: self.view.bounds.width,
                    height: self.cylinderLabel.frame.size.height)
                
                self.pickerButton.frame = CGRect(
                    x: 20,
                    y: self.cylinderLabel.frame.maxY + 5,
                    width: self.view.bounds.width,
                    height: self.pickerButton.frame.size.height)
                
                self.resultView.frame = CGRect(
                    x: 6,
                    y: self.pickerButton.frame.maxY + 5,
                    width: self.view.bounds.width,
                    height: self.resultView.frame.size.height)
            
                
                // Clear the textFields.
                self.psitTxt.text = ""
                
                self.litersMinTxt.text = ""
                
                self.rrTextField.text = ""
                
                self.tvTextField.text = ""
                
                self.fi02TextField.text = ""
                
                self.pickerButton.text("Select Tank Size")
                
                self.resultView.isHidden = true
                
                print("textFields were cleared.")
                
                
                
            }, completion: { (finished) in
                print("complete")
            })
            
        default:
            break
        }
        
    }
    
   

    
   

    
    //MARK: - Picker Variable titles.
    let data: [[String]] = [ ["D", "E", "G", "H/K", "M", "EC 135 1 Tank","EC 135 2 Tanks", "Bell 407"] ]
    

    // Selecting the picker button
    @IBAction func popOverPicker(_ sender: UIButton) {
        
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let respRate = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)

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
         EC135 1 Tank = 0.96
         EC135 2 Tank = 1.93
         Bell 407 Tank = 1.45

         */
        //Converting the result value.
     
        self.view.endEditing(true)
        
        
        
        
        // What happends when we select a picker segment,
        //        McPicker.showAsPopover(data: data, fromViewController: self, sourceView: sender, cancelHandler: { () -> Void in
        //
        //        print("Canceled Popover") }, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
        //
        McPicker.show(data: data, doneHandler: { (selections: [Int : String]) -> Void in print("Done with Popover")
            
            
            if let name = selections[0] {
               
                
                switch self.ventSegmento2.selectedSegmentIndex {
               
                case 0:
                    
                
                  
                
                    if name == "D" {
                       
                        self.calculateFlow_D()
                    }
                    if name == "E" {
                        self.calculateFlow_E()

                    }
                    
                    if name == "G" {
                        self.calculateFlow_G()
                    }
                    
                    if name == "H/K" {
                        self.calculateFlow_HK()
                    }
                    
                    if name == "M" {
                        self.calculateFlow_M()
                    }
                    if name == "EC 135 1 Tank" {
                        self.calculateFlow_EC135_1()
                    }
                    
                    if name == "EC 135 2 Tanks" {
                        self.calculateFlow_EC135_2()

                    }
                    
                    if name == "Bell 407" {
                        self.calculateFlow_Bell()
                    }
                    
                
                    // For the vent settings
                  case 1:
                    
                 
                    
                    if name == "D" {
                    
                        self.calculateVent_D()
                    }
                    if name == "E" {
                        
                        self.calculateVent_E()
                    }
                    
                    if name == "G" {
                    self.calculateVent_G()
                    }
                    
                    if name == "M" {
                        self.calculateVent_M()
                    }
                    if name == "H/K" {
                        self.calculateVent_HK()
                    }
                    
                    if name == "EC 135 1 Tank" {
                        self.calculateVent_EC135_1()
                    }
                    
                    if name == "EC 135 2 Tanks" {
                        self.calculateVent_EC135_2()

                    }
                    
                    if name == "Bell 407" {
                        self.calculateVent_bell()
                    }
                    
                default:
                
                    break
                }
                
            } //ends the if let name statement
            
            
        }) // completes the closure
    } // ends the method
    
    
    //MARK: Make a converstion from if the minutes are over 60 to convert  to hours and min.
    func minutesToHours(minutes: Int) -> (hours: Int, leftMinites: Int) {
        return (minutes / 60 , (minutes % 60))
    }
    
    
    
    func calculateFlow_D()  {
        
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))

        let D: Double = ((psi! - 200) * 0.19 / liters!)

        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(D))
        
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        self.resultView.isHidden = false
        
        self.pickerButton.setTitle("D Portable Cylinder", for: .normal)
        
        self.resultsLabel.text = String(format:"%.1f",D) // Rounds to the 1st decimal place
        
        self.descriptionLabel.text = "A \"D\" cylinder with \(psi!) PSI | \(liters!) L/min"

        minutesLabel.text = "Hours : Minutes"
        
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        
        self.view.endEditing(true)
        
        // If its empty then let us know.
        if (self.resultsLabel.text! < "0.0") {
            
            
            self.minutesLabel.text = "Refill the tank"
            
            self.resultsLabel.text = "Empty Tank"
            
            self.resultsLabel.textColor = UIColor.yellow
            
            self.descriptionLabel.text = "Looks like the tank is"
            
            self.descriptionLabel.textColor = UIColor.gray
            
            print("Tank D was selected")
            
        }
    }
    
    
    
    
    func calculateVent_D() -> Void {
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let respRate = Double(rrTextField.text!)
        
        guard let TV = Double(tvTextField.text!) else {
            print("TV not entered")
             _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            // Hide the view
            resultView.isHidden = true

            return
        }
        
        let fio2 = Double(fi02TextField.text!)
        
        guard let rr = Double(rrTextField.text!) else {
             _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            //Hide the view
            resultView.isHidden = true

            print("RR not entered")
            return
        }



        guard   let _  = psitTxt.text,
                let _  = fi02TextField.text,
                let _  = tvTextField.text,
                let _  = rrTextField.text
                else {
                    print("values not filled all the way in for the Vent")
                    _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")

                    return  }
        
        //let totalLpm = (liters! + Double(biasFlow))
        
//        guard var fi02Adjusted: Double? = ((totalLpm * fio2! / 100) ) else {
//            print("Enter fio2 and lpm")
//            return
//
//        }
        
        let D: Double = ((psi! - 200) * 0.19)
        
//        let E: Double = ((psi! - 200) * 0.28 / liters!)
//
//        let G: Double = ((psi! - 200) * 2.41 / liters!)
//
//        let HK: Double = ((psi! - 200) * 3.14 / liters!)
//
//        let M: Double = ((psi! - 200) * 1.56 / liters!)
        
        
        // calcualte the minite vlm
        let MV = (rr * TV) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))

        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
       

        
        print("corrected flow is \(correctedFlow)")
        
        let ventCalculation_D = ((D / totalLPM_O2_Draw))
        
        print("\(D) divided by \(totalLPM_O2_Draw) is \(ventCalculation_D) final")

        
        let DVent: Double = ventCalculation_D
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        
      
        
        resultView.isHidden = false
        
        pickerButton.setTitle("D Portable Cylinder", for: .normal)
        
        resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        
        minutesLabel.text = "Hours : Minutes"
        descriptionLabel.text = "A \"D\" cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank D was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
    }
    
}
