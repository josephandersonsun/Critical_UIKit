//
//  RealiTimeParameters.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 10/23/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import  UIKit
//import AnyFormatKit
// REAL TIME PARAMETER FUNCTIONS



extension ABGViewController {
    
    
    
    func checkPhParameters_RealTime(pH: Double) -> Bool {
        
        
        
        // Establishing high limit and low limit and ranges
        let pLow = 6.5
        let pHigh = 7.9
        
        //set the parameter
        let normalRange = 7.38...7.42
        let range = pLow...pHigh
        
        //If these conditions are indeed true ?
        // In the case the pH is low
        if Double(pHTextField.text!) ?? 0 > 6.5 && Double(pHTextField.text!) ?? 0 < 7.0 {
            
            phSideLabel.text = "Very low; double check pH"
            phSideLabel.textColor  =    #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
            PHImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is super low
        else if Double(pHTextField.text!) ?? 0 > 0 && Double(pHTextField.text!) ?? 0 < 6.5  {
            phSideLabel.text = "Too low; change to cont."
            phSideLabel.textColor  =    #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            pHTextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            PHImage.image = #imageLiteral(resourceName: "close_red")
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is empty
        else if Double(pHTextField.text!) == nil {
            phSideLabel.text = "Enter pH to cont."
            phSideLabel.textColor  =    #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            PHImage.image = nil
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
        
            // In the case the pH is too high
        else if Double(pHTextField.text!) ?? 0 > 7.9 {
            phSideLabel.text = "Too high; change to cont."
            phSideLabel.textColor  =    #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            pHTextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            PHImage.image = #imageLiteral(resourceName: "close_red")
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is normal
        else if normalRange.contains(Double(pHTextField.text!) ?? 0) {
            pHTextField.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
            phSideLabel.text = "👍🏽"
            PHImage.image = #imageLiteral(resourceName: "CheckMark")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            // In the case the pH is high
        else if Double(pHTextField.text!) ?? 0 > 7.45 {
            pHTextField.textColor = #colorLiteral(red: 0.2389388382, green: 0.5892125368, blue: 0.8818323016, alpha: 1)
            phSideLabel.text = "Alkalotic"
            PHImage.image = #imageLiteral(resourceName: "Aarow.up")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            // In the case the pH is low normal
        else if Double(pHTextField.text!) ?? 0 >= 7.35 &&  Double(pHTextField.text!) ?? 0 <= 7.37  {
            pHTextField.textColor = #colorLiteral(red: 1, green: 0.9921568627, blue: 0.5960784314, alpha: 0.7894339532)
            phSideLabel.text = "Compensating, low-normal"
            phSideLabel.textColor = #colorLiteral(red: 1, green: 0.9921568627, blue: 0.5960784314, alpha: 0.7894339532)

            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is high normal
        else if Double(pHTextField.text!) ?? 0 >= 7.43 &&  Double(pHTextField.text!) ?? 0 <= 7.45  {
            pHTextField.textColor = #colorLiteral(red: 1, green: 0.9921568627, blue: 0.5960784314, alpha: 0.7894339532)
            phSideLabel.text = "Compensating, high-normal"
            phSideLabel.textColor = #colorLiteral(red: 1, green: 0.9921568627, blue: 0.5960784314, alpha: 0.7894339532)
            PHImage.image = #imageLiteral(resourceName: "Yellow-check-")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
            
            // In the case the pH is low
        else if Double(pHTextField.text!) ?? 0 < 7.35 {
            pHTextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            phSideLabel.text = "Acidotic"
            PHImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
        else {
            phSideLabel.text = ""
            phSideLabel.textColor  =    #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
            pHTextField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            AnalyzeButton.isEnabled = true
            PHImage.image = nil
            checkAnalyzeButtonStatus()

        }
        
        //Check if true / false whether it falls within the ranges
        return range.contains(pH)
    }
    
    
    
    
    // Check NA is realTime function
    func check_Na_RealTime(Na: Double) -> Bool {
        
        // Establishing high limit and low limit and ranges
        let NaLow = 135.0
        let Na2High = 145.0
        let normal = NaLow...Na2High
        //set the parameter
        let Narange = NaLow...Na2High
        let over200 = 200.0...
        
        
       
         if (Double(NATextField.text!) ?? 0 > 99.0) && (Double(NATextField.text!) ?? 0 < 135.0) {
            
            SodiumImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            NaSideLabel.text = "Very low: Double Check"
            NaSideLabel.textColor = #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
            NATextField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            checkAnalyzeButtonStatus()

            AnalyzeButton.isEnabled = true
        }
            
      
            
        else if (Double(NATextField.text!) ?? 0 > 1.0) && (Double(NATextField.text!) ?? 0 < 99.0)  {
            
            SodiumImage.image = #imageLiteral(resourceName: "close_red")
            NaSideLabel.text = "Too low; change to cont."
            NaSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            // Change the color of the textField
            NATextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

            print(Double(NATextField.text!) ?? 0)
        }
            
            
        else if (Double(NATextField.text!) ?? 0 > 170.0) && (Double(NATextField.text!) ?? 0 < 200) {
            SodiumImage.image = #imageLiteral(resourceName: "Aarow.up")
            NaSideLabel.text = "Very high: Double Check"
            NaSideLabel.textColor  =    #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
            AnalyzeButton.isEnabled = true
            NATextField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            SodiumImage.image = #imageLiteral(resourceName: "Aarow.up")
            checkAnalyzeButtonStatus()

        }
            
            
        else if (Double(NATextField.text!) ?? 0 > 145.0) && (Double(NATextField.text!) ?? 0 < 170) {
            NaSideLabel.text = "Hypernatremic"
            NaSideLabel.textColor  =    #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
            NATextField.textColor = #colorLiteral(red: 0.3300000131, green: 0.5500000119, blue: 0.8700000048, alpha: 1)
            
            AnalyzeButton.isEnabled = true
            NATextField.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            SodiumImage.image = #imageLiteral(resourceName: "Aarow.up")
            checkAnalyzeButtonStatus()

        }
            
        else if (Double(NATextField.text!) ?? 0 > 200)  {
            NaSideLabel.text = "Too high; change to cont."
            NaSideLabel.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            SodiumImage.image = #imageLiteral(resourceName: "close_red")
            // Change the color of the textField
            NATextField.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
        else  if normal.contains(Double(NATextField.text!) ?? 0 )  {
            NaSideLabel.text = "Normal serum Na"
            NaSideLabel.textColor  =    #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
            AnalyzeButton.isEnabled = true
            NATextField.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            SodiumImage.image = #imageLiteral(resourceName: "CheckMark")
            checkAnalyzeButtonStatus()

         }      // In the case the pH is empty
         if  Double(NATextField.text!) == nil {
            NaSideLabel.text = "mEq/L"
            NaSideLabel.textColor  =  #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            SodiumImage.image = nil
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()
            
        }
        
        //Check if true / false we are returning a bool
        return normal.contains(Na)
    }
    
    
    func checkChlorideParameters_RealTime(ChlorideLevel: Double) -> Bool {
        
        // Establishing high limit and low limit and ranges
        let pLow =  70.0
        let pHigh = 200.0
        
        //set the parameter
        let normalRange = 98.0...106.0
        let range = pLow...pHigh
        
        //If these conditions are indeed true ?
        // In the case the pH is low
        if Double(CLTextfield.text!) ?? 0 > 70.0 && Double(CLTextfield.text!) ?? 0 < 80.0 {
            
            ChlorideSideLabel.text = "Very low; double check pH"
            ChlorideSideLabel.textColor  =    #colorLiteral(red: 0.9998139739, green: 0.9853300452, blue: 0.6592490673, alpha: 1)
            ChlorideImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is super low
        else if Double(CLTextfield.text!) ?? 0 > 0 && Double(CLTextfield.text!) ?? 0 < 70.0  {
            ChlorideSideLabel.text = "Too low; change to cont."
            ChlorideSideLabel.textColor  =    #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            CLTextfield.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            ChlorideImage.image = #imageLiteral(resourceName: "close_red")
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is empty
        else if Double(CLTextfield.text!) == nil {
            ChlorideSideLabel.text = "mEq/L"
            ChlorideSideLabel.textColor  =  #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            ChlorideImage.image = nil
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is too high
        else if Double(CLTextfield.text!) ?? 0 > 200.0 {
            ChlorideSideLabel.text = "Too high; change to cont."
            ChlorideSideLabel.textColor  =    #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            CLTextfield.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            ChlorideImage.image = #imageLiteral(resourceName: "close_red")
            AnalyzeButton.isEnabled = false
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is normal
        else if normalRange.contains(Double(CLTextfield.text!) ?? 0) {
            CLTextfield.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
            ChlorideSideLabel.text = "Chloride is WNL"
            ChlorideImage.image = #imageLiteral(resourceName: "CheckMark")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()
            
        }
            // In the case the pH is high
        else if Double(CLTextfield.text!) ?? 0 >= 109.0 && Double(CLTextfield.text!) ?? 0 < 200.0 {
            CLTextfield.textColor = #colorLiteral(red: 0.2389388382, green: 0.5892125368, blue: 0.8818323016, alpha: 1)
            ChlorideSideLabel.text = "Hyperchloremic"
            ChlorideImage.image = #imageLiteral(resourceName: "Aarow.up")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
            // In the case the pH is low
        else if Double(CLTextfield.text!) ?? 0 >= 80.0 &&  Double(pHTextField.text!) ?? 0 <= 97.0 {
            CLTextfield.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
            ChlorideSideLabel.text = "Hypochloremic"
            ChlorideImage.image = #imageLiteral(resourceName: "Aarow.downNoCircle")
            AnalyzeButton.isEnabled = true
            checkAnalyzeButtonStatus()

        }
            
        else {
            ChlorideSideLabel.text = "mEq/L"
            ChlorideSideLabel.textColor  =    #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
            CLTextfield.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            AnalyzeButton.isEnabled = true
            ChlorideImage.image = nil
            checkAnalyzeButtonStatus()

        }
        
        //Check if true / false whether it falls within the ranges
        return range.contains(ChlorideLevel)
    }
    
}
