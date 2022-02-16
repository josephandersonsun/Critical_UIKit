//
//  tankCalculations.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/19/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

// Set and calculate the different values

//MARK: - Vent Calc E
extension newO2TankCalc {
    
    func calculateFlow_E()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let E: Double = ((psi! - 200) * 0.28 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(E))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("E Portable Cylinder", for: .normal)
        
    
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"D\" cylinder with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}

//MARK: - Vent Calc G
extension newO2TankCalc {
    
    func calculateFlow_G()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let G: Double = ((psi! - 200) * 2.41 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(G))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("G Cylinder", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"G\" cylinder with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}


//MARK: - Vent Calc HK
extension newO2TankCalc {
    
    func calculateFlow_HK()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let HK: Double = ((psi! - 200) * 3.14 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(HK))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("HK Cylinder", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"HK\" cylinder with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}

//MARK: - Vent Calc M
extension newO2TankCalc {
    
    func calculateFlow_M()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let M: Double = ((psi! - 200) * 1.56 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(M))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("M Cylinder", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"M\" cylinder with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}


//MARK: - Vent Calc EC 135-1 Tank
extension newO2TankCalc {
    
    func calculateFlow_EC135_1()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let EC135_1: Double = ((psi! - 200) * 0.96 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(EC135_1))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("EC135 1 Tank", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"EC135\" 1 tank with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}



//MARK: - Vent Calc EC 135-2 Tank
extension newO2TankCalc {
    
    func calculateFlow_EC135_2()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let EC135_2: Double = ((psi! - 200) * 1.93 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(EC135_2))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("EC135 2 Tank", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"EC135\" 2 tank with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}



//MARK: - Vent Calc EC 135-2 Tank
extension newO2TankCalc {
    
    func calculateFlow_Bell()  {
        
        //variables
        let psi = Double(psitTxt.text!)
        
        let liters = Double(litersMinTxt.text!)
        
        let totalLpm = (liters! + Double(biasFlow))
        
        
        // Pressure Calculation
        let bell: Double = ((psi! - 200) * 1.45 / liters!)
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(bell))
        
        // Guard  for the textFields
        guard psi != nil, liters != nil else {
            
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
            
            print("Fields are empty ")
            return
        }
        
        // What We want to happen for the calculation
        //Unhide the view
        self.resultView.isHidden = false
        
        // Change the title on the picker
        self.pickerButton.setTitle("Bell 407 Tank", for: .normal)
        
        // Displays time left
        self.resultsLabel.text = "\(timeLeftOver.hours): \(timeLeftOver.leftMinites)"
        
        // Hours minute label
        self.minutesLabel.text = "Hr:Min"
        
        // Set description label
        self.descriptionLabel.text = "A \"EC135\" 2 tank with \(psi!) PSI | \(liters!) L/min"
        
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
    
    
}






//MARK: VENTILATORS //////////



//MARK: - Vent Calc E

extension newO2TankCalc {
    
    func calculateVent_E() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(litersMinTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
            
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        let E: Double = ((psi! - 200) * 0.28 )
        
       
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        
        
        
        print("corrected flow is \(correctedFlow)")
        
        let finalCalculation = ((E / totalLPM_O2_Draw))
        
        print("\(E) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        

        
        resultView.isHidden = false
        
        pickerButton.setTitle("E Portable Cylinder", for: .normal)
        
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        
        minutesLabel.text = "Hr:Min"
        
        descriptionLabel.text = "An \"E\" cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
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

//MARK: - Vent Calc G

extension newO2TankCalc {
    
    func calculateVent_G() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
        
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        

        
        // Formula
        let G: Double = ((psi! - 200) * 2.41 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((G / totalLPM_O2_Draw))

        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        //Set the button title
        pickerButton.setTitle("G Cylinder", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "An \"E\" cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
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
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(G) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}

//MARK: - HK
extension newO2TankCalc {
    
    func calculateVent_HK() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
        
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        // Formula
        let HK: Double = ((psi! - 200) * 2.41 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((HK / totalLPM_O2_Draw))
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        //Set the button title
        pickerButton.setTitle("HK Cylinder", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "An \"HK\" cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank HK was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(HK) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}

//MARK: - M
extension newO2TankCalc {
    
    func calculateVent_M() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
        
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        // Formula
        let M: Double = ((psi! - 200) * 2.41 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((M / totalLPM_O2_Draw))
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        //Set the button title
        pickerButton.setTitle("M Cylinder", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "An \"M\" cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank M was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(M) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}


//MARK: - EC135_1
extension newO2TankCalc {
    
    func calculateVent_EC135_1() -> Void {
        
        
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
                let _  = fi02TextField.text,
            
                let _  = tvTextField.text,
            
                let _  = rrTextField.text,
            
                let _  = rr,
            
                let _ = TV
            
                else {
                
                    print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        // Formula
        let EC135_1: Double = ((psi! - 200) * 0.96 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((EC135_1 / totalLPM_O2_Draw))
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        //Set the button title
        pickerButton.setTitle("EC 135 1 Tank", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "An \"EC 135\", one cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank EC 135 - 1 was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(EC135_1) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}


//MARK: - EC135_2
extension newO2TankCalc {
    
    func calculateVent_EC135_2() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
        
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        // Formula
        let EC135_2: Double = ((psi! - 400) * 1.93 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((EC135_2 / totalLPM_O2_Draw))
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        usablePsi.text = "Usable PSI: \(Int(psi! - 400))"
        
        //Set the button title
        pickerButton.setTitle("Ec 135 2 Tank", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "An \"EC 135\", two cylinder with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank EC 135 - 2 was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(EC135_2) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}


//MARK: - Bell 407
extension newO2TankCalc {
    
    func calculateVent_bell() -> Void {
        let psi = Double(psitTxt.text!)
        
        _ = Double(rrTextField.text!)
        
        let TV = Double(tvTextField.text!)
        
        let fio2 = Double(fi02TextField.text!)
        
        let rr = Double(rrTextField.text!)
        
        
        // Guard for whats required in the calculation
        guard   let _  = psitTxt.text,
            
            let _  = fi02TextField.text,
            
            let _  = tvTextField.text,
            
            let _  = rrTextField.text,
        
            let _  = rr,
            
            let _ = TV
            
            else {
                print("values not filled all the way in for the Vent")
                _ = SCLAlertView().showWarning("Hold On...", subTitle: "Fill in all of the fields before calculating.")
                
                return  }
        
        
        
        // Formula
        let bell407: Double = ((psi! - 400) * 1.45 )
        
        
        
        // calcualte the minite vlm
        let MV = (rr! * TV!) / 1000
        print("MV calculated  is \(MV)")
        
        
        let o2Draw = (((fio2!/100) - 0.21) * 1.265) * 100
        
        let correctedFlow = ((MV + (Double(biasFlow))))
        
        // We get the total LPM off the bias flow and corrected fi02
        let totalLPM_O2_Draw = (correctedFlow * o2Draw) / 100
        
        let finalCalculation = ((bell407 / totalLPM_O2_Draw))
        
        
        let DVent: Double = finalCalculation
        
        // Convert the calculation to hours and minutes
        let timeLeftOver = minutesToHours(minutes: Int(DVent))
        
        // Unhide the view
        resultView.isHidden = false
        
        //Set the button title
        pickerButton.setTitle("Bell 407 Tank", for: .normal)
        
        // Display Result
        resultsLabel.text = "\(timeLeftOver.hours):\(timeLeftOver.leftMinites)"
        
        // Min label
        minutesLabel.text = "Hr:Min"
        
        //Set description
        descriptionLabel.text = "A \"Bell 407\", tank with \(psi!) PSI at a total LPM of \(correctedFlow ) L/min"
        
        // Dismiss Keyboard
        
        view.endEditing(true)
        
        // If its empty then let us know.
        if (resultsLabel.text! < "0.0") {
            
            minutesLabel.text = "Refill the tank"
            
            resultsLabel.text = "Empty Tank"
            
            resultsLabel.textColor = UIColor.yellow
            
            descriptionLabel.text = "Looks like the tank is"
            
            descriptionLabel.textColor = UIColor.gray
            
            print("Tank bell 407 - 2 was selected")
            
            print(self.ventSegmento2.selectedSegmentIndex)
            
            
        }
        
        // Print some data
        print("corrected flow is \(correctedFlow)")
        
        print("\(bell407) divided by \(totalLPM_O2_Draw) is \(finalCalculation) final")
        
        
    }
    
    
}
