//
//  AnionGapAndDELTAGap.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 10/23/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


extension ABGViewController {
    
    func changeTheTextAttributes(text: String, subStrings: String) -> NSAttributedString {
        
        //Lets apply special text attributes
        let changedText = text
        
        // Setting the attriubte to the string
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the color of a word in the string
        attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: subStrings)
        
        let customFont = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: subStrings)
        
        return attributedText
    }
    
    // MARK: CALCULATING THE ANION GAP AND LIMITS
    func determineAnionGap() {
        
        
        let Na = Double(NATextField.text!)
        
        let CL = Double(CLTextfield.text!)
        
        var hc03_value = Double(bicarbTextField.text!)
        
        let Albumin = Double (AlbuminText.text!)
        
        // Setting this to the struct
        let gasRange = AbgRangeVariables()
        
        //I first get calculated value of HC03 and check  if textfield text count greater than 0 if replace calculated value with textField value
        var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
        
        let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
        
        if hc03Text!.count > 0 {
            hc03 = Double(hc03Text!)!
        }
        
        //MARK: - Anion Gap Calculation only with Na and Cl REGULAR
        // If the Na and Cl are both filled in, Run the formula
        if Na != nil && CL != nil {
            
            // Show the arrows
            DisplayArrows()
            
            let AnionGap = Na! - (CL! + hc03)
            
            let normalBicarb = 24.0
            
            var anionGapCorrection = Double()
            
            anionGapCorrection = AnionGap
            
            let deltaGap = AnionGap - 12
            
            let deltaBicarb = 24 - hc03
            
            let LacticAcidosisRange: ClosedRange<Double> = 1.4...1.8
            
            
            //Delta Ratio is (Delta Ratio)=ΔAG/ΔHCO3- or (ΔΔ or Delta Gap)=ΔAG-ΔHCO3-
            
            var deltaRatio: Double {
                return deltaGap / deltaBicarb
            }
            
            
            var deltaRatioExplanation = String()
            
            
            if deltaRatio < 0.4 {
                
                deltaRatioExplanation = "hyperchloremic normal anion gap acidosis."
                
                print("Delta ratio is < 0.4")
                
            }
            
            
            if (deltaRatio > 0.4) && (deltaRatio < 0.8) {
                
                deltaRatioExplanation = "a combined high and normal anion gap acidosis (HAGMA/NAGMA) exists. Also, note that the acidosis can also be attributed to renal failure as well."
                
                print("Delta ratio is 0.4 - 0.8")
                
            }
            
            
            if deltaRatio >= 0.8 && (deltaRatio < 1.0) {
                
                deltaRatioExplanation = "uncomplicated high Anion Gap metabolic acidosis"
                
                
                
                print("Delta ratio between 0.8-1")
            }

            if (deltaRatio >= 1.0) && (deltaRatio <= 1.5) {
                
                deltaRatioExplanation = "Purely high Anion Gap acidosis. Likely from a lactic acidosis, but could also be from DKA as well."
                
                print("Delta ratio is 1 -2")
                
            }
            
            if deltaRatio >= 1.6 {
                deltaRatioExplanation = "High Anion Gap Acidosis with either a concurrent Metabolic Alkalosis or pre-existing Respiratory Acidosis. " 
                
                print("Delta ratio is > 1.6")
            }


            // Switch on AG
            let compensated_acidosis_Metabolic_Ph: ClosedRange<Double> = 7.35...7.39
            
            switch AnionGap {
                
            case -100...0:
                
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22
                {
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString = "Negative Anion Gap at \(AnionGap.oneDecimalPlace) . This is most likely a lab error, however, this could also result from multiple myeloma, bromide and iodide toxicities as well.\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)

                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Negative Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), subString: "Negative Anion Gap")

                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    
                    print("Negative Anion Gap, no alb \(AnionGap.oneDecimalPlace).")
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Negative Anion Gap", for: .normal)
                    
                    //anionGapLabel.textColor = #colorLiteral(red: 0.9100000262, green: 0.5500000119, blue: 0.5699999928, alpha: 1)
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("Lab Error? AG- \(AnionGap.oneDecimalPlace)", for: .normal)
                }
                    
                else {
                    
                  
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    
                    let  anionGapString = "Negative Anion Gap at \(AnionGap.oneDecimalPlace) . This is most likely a lab error, however, this could also result from multiple myeloma, bromide and iodide toxicities as well."
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
    
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Negative Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), subString: "Negative Anion Gap")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    print("Negative Anion Gap \(AnionGap.oneDecimalPlace).")
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Negative Anion Gap", for: .normal)
                    
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("Lab Error? AG- \(AnionGap.oneDecimalPlace)", for: .normal)
                }
                
            case 0...4:
                // 0-6 before
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22
                {
                 
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString = "Non-Anion Gap Metabolic Acidosis at \(AnionGap.oneDecimalPlace)\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Non-Anion Gap Metabolic Acidosis")
                    attributedText.apply(color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), subString: "Non-Anion Gap Metabolic Acidosis")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    print("Non-Anion Gap Metabolic Acidosis \(AnionGap.oneDecimalPlace).")
                    
                    
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Non-Anion Gap Metabolic Acidosis", for: .normal)
                    
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("Non-AG Metabolic Acidosis - \(AnionGap.oneDecimalPlace)", for: .normal)
                }
                    
                else {
                    
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString = "Non-Anion Gap Metabolic Acidosis \(AnionGap.oneDecimalPlace)\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace)"
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Non-Anion Gap Metabolic Acidosis")
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: "Non-Anion Gap Metabolic Acidosis")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Non-Anion Gap Metabolic Acidosis", for: .normal)
                    
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    
                    deltaBUTTON.setTitle("Non-AG Metabolic Acidosis - \(AnionGap.oneDecimalPlace)", for: .normal)
                    
                    print("Non-Anion Gap Metabolic Acidosis \(AnionGap.oneDecimalPlace).")
                    
                }
            case 4...12:
                // 6-12 before
                
                // String parameter to make addition notes if there are certain parameters.
                var metaAcid = String()
                
                // If theres a metabolic acidosis, we are gonna let people know theres a bicarb wasting.
                if (main_DisorderTitle_Label.text?.contains("Acute Metabolic Acidosis"))! {
                    
                    metaAcid = "\nCheck urine anion gap to help find the cause of the HC03 wasting."
                    
                
                    // We dont calculate the deltaRatio
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    
                    let  anionGapString =   "Normal Anion Gap - \(AnionGap.oneDecimalPlace) " + metaAcid

                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                  
                
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Normal Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "Normal Anion Gap")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("Anion Gap - \(AnionGap.oneDecimalPlace)", for: .normal)
                    
                    //anionGapLabel.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                    
                    AnalyzeButton.setTitle("Normal Anion Gap - \(AnionGap.oneDecimalPlace)", for: .normal)
                    
                    print("Metabolic Acidosis with normal Anion Gap present, check the urine gap")
                    
                    print("Normal Gap \(AnionGap.oneDecimalPlace).")
                    
                } else {
                   
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    
                    let  anionGapString = "Normal Anion Gap - \(AnionGap.oneDecimalPlace) " + metaAcid
                    
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Normal Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "Normal Anion Gap")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("Anion Gap - \(AnionGap.oneDecimalPlace)", for: .normal)
                    
                    print("Normal Gap \(AnionGap.oneDecimalPlace).")

                    
                    AnalyzeButton.setTitle("Normal Anion Gap - \(AnionGap.oneDecimalPlace)", for: .normal)
                }
                
            case 12...100:
                
                // We are only displaying the delta gap and explanation only in metabolic acidosis.
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22 {
                    
                
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was calculated at \(AnionGap.oneDecimalPlace)\n\n The ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    // Animate the disorder
                    //disorderLabel.animate(text: "High Anion Gap Metabolic Acidosis", duration: 1, completion: nil)
                    
                    print("High Anion Gap Metabolic Acidosis. The Anion Gap is calculated at \(AnionGap.oneDecimalPlace). ")
                    
                    print("\(deltaRatio) - deltaRatio" + deltaRatioExplanation) // calls the delta gap becayse the Anion Gap is high.
                    
                    print("This is high AG over 12-100")
                    AnalyzeButton.setTitle("High Anion Gap Metabolic Acidosis", for: .normal)
                    
                    //UnHide DeltaGap Button
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("HAGMA", for: .normal)
                }
                    
                else {
                    // anionGapLabel.text = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was calculated at \(AnionGap.oneDecimalPlace)"
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    
                    let  anionGapString = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was calculated at \(AnionGap.oneDecimalPlace)"
                    
                    var attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "High Anion Gap Metabolic Acidosis (HAGMA)")

                    // Animate the disorder
                    //disorderLabel.animate(text: "High Anion Gap Metabolic Acidosis", duration: 1, completion: nil)
                    
                    print("Positive Anion Gap Metabolic Acidosis. The Anion Gap is calculated at \(AnionGap.oneDecimalPlace). ")
                    
                    
                    print("\(deltaRatio) deltaRatio second one" + deltaRatioExplanation) // calls the delta gap becayse the Anion Gap is high.
                    
                    AnalyzeButton.setTitle("High Anion Gap Metabolic Acidosis", for: .normal)
                    
                    //UnHide DeltaGap Button
                    deltaBUTTON.isHidden = false
                    
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    
                    deltaBUTTON.setTitle("HAGMA", for: .normal)
                }
            default: break
                
            }
        }
        
        
        //MARK: - AG Calculation Corrected for Albumin
        
        if Na != nil && CL != nil && Albumin != nil {
            
            let AnionGap = Na! - (CL! + hc03)
            
            var anionGapCorrection = Double()
            
            let AnionGapCorrectedAlbumin = AnionGap + 2.5 * (4 - Albumin!)
            
            anionGapCorrection = AnionGapCorrectedAlbumin
            
            let deltaGap = AnionGap - 12
            
            let deltaBicarb = 24 - hc03
            
            print("Albumin was entered and corrected AG is \(AnionGapCorrectedAlbumin)")
            
            
            let LacticAcidosisRange: ClosedRange<Double> = 1.4...1.8
            //Delta Ratio is (Delta Ratio)=ΔAG/ΔHCO3- or (ΔΔ or Delta Gap)=ΔAG-ΔHCO3-
            
            var deltaRatio: Double {
                
                return deltaGap / deltaBicarb
            }
            
            var deltaRatioExplanation = String()
            
            
            if deltaRatio < 0.4 {
                deltaRatioExplanation = "hyperchloremic normal anion gap acidosis."
                
                print("Delta ratio is < 0.4")
                
            }
            
            if (deltaRatio > 0.4) && (deltaRatio < 1.0) {
                deltaRatioExplanation = "high AG and normal AG acidosis."
                
                print("Delta ratio is 0.4 - 1")
                
            }
            
      
            if (deltaRatio >= 1.0) && (deltaRatio <= 1.5) {
                
                deltaRatioExplanation = "pure Anion Gap Acidosis, lactic acidosis or DKA."
                
                print("Delta ratio is 1 -2")
                
            }
            
            if deltaRatio >= 1.6 {
               
                
            deltaRatioExplanation = "High Anion Gap Acidosis with either a concurrent Metabolic Alkalosis or pre-existing Respiratory Acidosis."
                
                print("Delta ratio is > 2")
            }
            
            
            // Switch on Anion Gap
            let compensated_acidosis_Metabolic_Ph: ClosedRange<Double> = 7.35...7.39
            
            switch anionGapCorrection {
                
            case -100...0:
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22
                {
                   
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"

                    let  anionGapString = "Negative Anion Gap. The Anion Gap is \(AnionGap.oneDecimalPlace)\nCorrected for albumin was \(anionGapCorrection.oneDecimalPlace)\n This is most likely a lab error, however, this could also result from multiple myeloma, bromide and iodide toxicities as well.\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Negative Anion Gap.")
                    attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "Negative Anion Gap.")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    print("Negative Anion Gap \(anionGapCorrection.oneDecimalPlace).")
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Negative Anion Gap", for: .normal)
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Lab Error? AG- \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    
                }
                    
                else {
                    print("Negative Anion Gap \(anionGapCorrection.oneDecimalPlace).")
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Negative Anion Gap", for: .normal)
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Lab Error? AG- \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    
                    
            
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    
                    let  anionGapString = "Negative Anion Gap. The Anion Gap is \(AnionGap.oneDecimalPlace)\nCorrected for albumin was \(anionGapCorrection.oneDecimalPlace)\n This is most likely a lab error, however, this could also result from Multiple myeloma, bromide and iodide toxicities as well."
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
            
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Negative Anion Gap.")
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: "Negative Anion Gap.")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                }
            case 0...4:
                // 0-6 before
                
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22
                {
                
                    
                    //disorderLabel.animate(text: "NAGMA", duration: 1, completion: nil)
                    
                    AnalyzeButton.setTitle("Non-Anion Gap Metabolic Acidosis", for: .normal)
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Non AG Metabolic Acidosis - \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"

                    let  anionGapString = "Non-Anion Gap Metabolic Acidosis. The Anion Gap is \(AnionGap.oneDecimalPlace)\nCorrected for albumin is \(anionGapCorrection.oneDecimalPlace) \n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Non-Anion Gap Metabolic Acidosis.")
                    attributedText.apply(color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), subString: "Non-Anion Gap Metabolic Acidosis.")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    print("Non Anion Gap Metabolic Acidosis \(AnionGap.oneDecimalPlace).")
                    
                }
                    
                else {
                    

                    AnalyzeButton.setTitle("Non-Anion Gap Metabolic Acidosis", for: .normal)
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Non-AG Metabolic Acidosis - \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    
                    
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString =  "Non-Anion Gap Metabolic Acidosis. The Anion Gap is \(AnionGap.oneDecimalPlace)\nCorrected for albumin is \(anionGapCorrection.oneDecimalPlace)\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Non-Anion Gap Metabolic Acidosis.")
                    attributedText.apply(color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), subString: "Non-Anion Gap Metabolic Acidosis.")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    print("Non-Anion Gap Metabolic Acidosis \(AnionGap.oneDecimalPlace).")
                    
                }
                
                
            case 4...12:
                var metaAcid = String()
                // If theres a metabolic acidosis we say check the urine gap as well.
                if (main_DisorderTitle_Label.text?.contains("Metabolic Acidosis"))! {
                    
                    metaAcid = "\nCheck urine anion gap to help find the cause of the HC03 wasting."
                    
                    print("Metabolic Acidosis with normal Anion Gap present, check the urine gap")
                    
                    anionGapLabel.text = "Normal Anion Gap at \(AnionGap.oneDecimalPlace) \nCorrected for for albumin was \(anionGapCorrection.oneDecimalPlace) " + metaAcid
                    
                
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Anion Gap - \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    //anionGapLabel.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                    AnalyzeButton.setTitle("Normal Anion Gap", for: .normal)
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    
                    let  anionGapString =  "Normal Anion Gap at \(AnionGap.oneDecimalPlace) \nCorrected for for albumin was \(anionGapCorrection.oneDecimalPlace) " + metaAcid
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                   
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Normal Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "Normal Anion Gap")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    print("Normal Gap \(AnionGap.oneDecimalPlace).")
                    
                    
                }
                    
                else {
                
                    // We dont calculate the deltaRatio
                    
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    
                    let  anionGapString =  "Normal Anion Gap at \(AnionGap.oneDecimalPlace) \nCorrected for for albumin was \(anionGapCorrection.oneDecimalPlace) " + metaAcid
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "Normal Anion Gap")
                    attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "Normal Anion Gap")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("Anion Gap - \(anionGapCorrection.oneDecimalPlace)", for: .normal)
                    print("Normal Gap \(AnionGap.oneDecimalPlace).")
                    //anionGapLabel.textColor = #colorLiteral(red: 0.6802619696, green: 0.9382658601, blue: 0.7976928353, alpha: 1)
                    AnalyzeButton.setTitle("Normal Anion Gap", for: .normal)
                }
                
            case 12...100:
                
                if pH_value! < 7.35 || compensated_acidosis_Metabolic_Ph.contains(pH_value!) && hc03 < 22
                {
             
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    let newDeltaRatio = "\(deltaRatio.oneDecimalPlace)"
                    
                    let  anionGapString = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was \(AnionGap.oneDecimalPlace) \nCorrected for albumin was \(anionGapCorrection.oneDecimalPlace)\n\nThe ∆ delta gap ratio is \(deltaRatio.oneDecimalPlace) which suggests a " + deltaRatioExplanation
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newDeltaRatio)
                    attributedText.apply(font:newFont!, subString: newDeltaRatio)
                    
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    
                    print("Positive Anion Gap Metabolic Acidosis. The Anion Gap is calculated at \(anionGapCorrection.oneDecimalPlace). ")
                    print("\(deltaRatio) deltaRatio") // calls the delta gap becayse the Anion Gap is high.
                    
                    AnalyzeButton.setTitle("High Anion Gap Metabolic Acidosis", for: .normal)
                    //UnHide DeltaGap Button
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("HAGMA", for: .normal)
                
                }
                    
                else {
                    
                    // We calculated it without including the deltaRatio.
                   
                    // Here we have to create a string form of the new numbers calculated so i can be converted into an attributed text. Then pass it below.
                    let newAnioGap = "\(AnionGap.oneDecimalPlace)"
                    let correctedAG = "\(anionGapCorrection.oneDecimalPlace)"
                    
                    let  anionGapString = "High Anion Gap Metabolic Acidosis (HAGMA)\nThe Anion Gap was \(AnionGap.oneDecimalPlace) \nCorrected for albumin was \(anionGapCorrection.oneDecimalPlace)"
                    
                    let attributedText = NSMutableAttributedString.getAttributedString(fromString: anionGapString)
                    
                    let newFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
                    
                    // 1 Apply the attributes
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: newAnioGap)
                    attributedText.apply(font: newFont!, subString: newAnioGap)
                    
                    //2
                    attributedText.apply(color: #colorLiteral(red: 0.7409999967, green: 0.7649999857, blue: 0.7799999714, alpha: 1), subString: deltaRatioExplanation)
                    attributedText.apply(font:newFont!, subString: deltaRatioExplanation)
                    
                   
                    //3
                    attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: correctedAG)
                    attributedText.apply(font:newFont!, subString: correctedAG)
                    
                    // 4 Underlines and highlights the string
                    attributedText.underLine(subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: "High Anion Gap Metabolic Acidosis (HAGMA)")
                    
                    //4 set the textLabel
                    anionGapLabel.attributedText = attributedText
                    
                    
                    print("Positive Anion Gap Metabolic Acidosis. The Anion Gap is calculated at \(anionGapCorrection.oneDecimalPlace). ")
                    
                    
                    print("\(deltaRatio) deltaRatio") // calls the delta gap becayse the Anion Gap is high.
                    
                    AnalyzeButton.setTitle("High Anion Gap Metabolic Acidosis", for: .normal)
                    //UnHide DeltaGap Button
                    deltaBUTTON.isHidden = false
                    deltaBUTTON.backgroundColor = #colorLiteral(red: 0.9060000181, green: 0.2980000079, blue: 0.2349999994, alpha: 1)
                    deltaBUTTON.setTitle("HAGMA", for: .normal)
                }
                
            default: break
                
            }
        }
        
    }
}
