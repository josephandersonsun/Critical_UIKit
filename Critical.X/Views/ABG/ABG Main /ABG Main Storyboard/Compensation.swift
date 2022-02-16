//
//  Compensation.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 10/23/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyAttributes

extension ABGViewController {
    
    
    
    
    //MARK: - Calculate the expected pH
    func expected_pH_calc(c02: Double, bicarb: Double) -> String {
        
        //pH = 6.1 + log(HCO3 / (0.03 * PaCO2))
        let pHcalcualtion = 6.1 + (log10(bicarb / (0.03 * c02)))
        
        var resultLanguage: String {
            return "The expected pH was calculated to be \(pHcalcualtion.twoDecimalPlace)."
        }
        
        print ("The expected pH should be \(pHcalcualtion.twoDecimalPlace)")
        
        return resultLanguage
    }
    
    
    
    // Calculation for Bicarb when the textField is left Nil..
    func bicarbCalc() {
        
        //MARK: GUARD Guard statement is saying that if the weight is not entered and the calculated button is pushed, Print this statement.
        
        // Run this guard if the pH is left blank and someone goes to
        guard let _ = pH_value  else {
            // Code executed if the textField is left empty
            
            print ("No c02 was entered") //Print statement on the console
            c02SideLabel.text = "Please enter a pH value" // Changes the textLabel's language
            
            return   }
        
        
        
        
        let hc03_value = Double(bicarbTextField.text!)
        
        guard hc03_value != nil else {
            
            print("No c02 entered? So bicarb won't be calculated")
            
            var abg = ABG(pH: pH_value!, c02: c02_value!, HC03: hc03_value, Sodium: 155, Chloride: 111, Albumin: nil)
            
            if bicarbTextField.text != nil {
                resultLabel.text = "HC03 calculated using the Henderson Hasselback formula"
                
                var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
                
                let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
                
                if hc03Text!.count > 0 {
                    hc03 = Double(hc03Text!)!
                }
                
                abg.HC03 = hc03
                
                bicarbTextField.text = "\(abg.HC03!)"
                
                bicarbSideLabel.text = "HC03 calculated at \(Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!)"
            }
                
            else {
                
                analyzeGasParameters()
                
            }
            
            return
            
        }
        
        
    }
    
    // MARK: Base Excess Func
    func baseExcessCalculation(pH: Double, pC02: Double) -> Double {
        /* The other equations
         let be1 = 0.9287 * (Double(abg.HC03)) + 13.77 * pH - 124.58
         B.E. = 0.02786 * pCO2 * 10 (pH - 6.1) + 13.77 * pH - 124.58
         0.02786 * pCO2 * 10 (pH - 6.1)13.77 * pH - 124.58
         
         let baseExcess = 0.02786 * pC02 * (pow(10, pHpower).rounded()) + 13.77 * pH - 124.58
         */
        let hc03_value = Double(bicarbTextField.text!)
        
        let abg = ABG(pH: pH_value!, c02: c02_value!, HC03: hc03_value, Sodium: 155, Chloride: 111, Albumin: nil)
        
        let pH = abg.pH
        let pHpower = pH - 6.1
        
        // The equation.
        //let bExcess = 0.9287 * (hc03_value!) + 13.77 * pH - 124.58
        let bExcess = 0.02786 * pC02 * (pow(10, pHpower)) + 13.77 * pH - 124.58
        print("This is the BE calculated \(bExcess)")
        return bExcess
    }
    
    
    
    
    //MARK: - Compensating pC02 for Acidosis
    
    func c02RangeIsCompensatingfor_Acidosis(bicarb:Double) -> ClosedRange<Double> {
        let wintersLow = ((Double(bicarb) * 1.5 + 8) - 2).rounded()
        let wintersHigh = ((Double(bicarb) * 1.5 + 8) + 2).rounded()
        
        print ("c02 Compensating pC02 for Acidosis is \(wintersLow...wintersHigh)")
        
        return  wintersLow...wintersHigh
    }
    
    
    
    
    //MARK: - Compensating pC02 for Alkalosis
    func c02RangeIsCompensatingfor_ALKalosis(bicarb:Double) -> ClosedRange<Double> {
        
        let wintersLow = ((Double(bicarb) * 1.5 + 8) - 1.5).rounded()
        
        let wintersHigh = ((Double(bicarb) * 1.5 + 8) + 1.5).rounded()
        
        print ("Compensating pC02 for Alkalosis \(wintersLow...wintersHigh)")
        
        return  wintersLow...wintersHigh
    }
    
    
    
    // MARK:- Winters PCO2 = (HCO3 x 1.5) + 8 ± 2. This is onyl for the small C02 label
    func wintersFormulaC02OnlyValues (calculatedBicarb: Double) -> String {
        
        
        let wintersLow = ((Double(calculatedBicarb) * 1.5 + 8) - 2).rounded()
        
        let wintersHigh = ((Double(calculatedBicarb) * 1.5 + 8) + 2).rounded()
        
        c02SideLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return "Expected C02: \(wintersLow) - \(wintersHigh)"
    }
    
    
    
    // MARK:- Winters Formula
    func wintersFormula (calculatedBicarb: Double) -> String {
        
        //PCO2 = (HCO3 x 1.5) + 8 ± 2.
        let wintersLow = ((Double(calculatedBicarb) * 1.5 + 8) - 2).rounded()
        
        let wintersHigh = ((Double(calculatedBicarb) * 1.5 + 8) + 2).rounded()
        
        let wintersRange:ClosedRange<Double> = wintersLow...wintersHigh
        
        var winterVerbiage = String()
        
        
        if wintersRange.contains(c02_value!){
            // Then we add this string to the analysis when setting the text labels
            winterVerbiage = "The C02 is compensating nicely at \(c02_value!)"
        }
        
        if (Double(c02_value!)) < wintersLow {
            
            winterVerbiage = "\nThe observed C02 tension is ⬇︎ at \(c02_value!) - which lower than the expected C02 compensation - \(wintersLow), suggesting that a concomitant Respiratory Alkalosis is also likely."
            
            print("WinterFormula Func: C02 lower than calculated winters")
            
        }
        
        if (Double(c02_value!)) > wintersHigh {
            
            winterVerbiage = "\nThe observed C02 tension is ⬆︎ at \(c02_value!) - which is higher than the expected C02 compensation - \(wintersHigh), suggesting that a relative hypoventilation is increasing the pC02 causing a concomitant Respiratory Acidosis to compensate."
            
            print("WinterFormula Func: C02 higher than calculated winters")
            //"The known PaC02 is higher than expected at \(c02_value!). A superimposed Respiratory Acidosis is also likely."
            //"The PaC02 is high at \(c02_value!)), which is higher than the expected PaC02 compensation, suggesting that a concomitant Respiratory Acidosis is likely in addition to the primary disorder."
        }
        
    
        
        // Add the language to retuen along with the string variables.
        return "The corrected C02 should be " + " " + "\(wintersLow) - \(wintersHigh) " + "\n\n" + winterVerbiage
    }
    
    
    
    //MARK: - Winters formula for Alkalosis
    func wintersAlkalosis_OnlyExpectedC02(calculatedBicarb: Double) -> String  {
        
        
        let wintersLow = ((Double(calculatedBicarb) * 0.7 + 21) - 1.5).oneDecimalPlace
        
        
        let wintersHigh = ((Double(calculatedBicarb) * 0.7 + 21) + 1.5).oneDecimalPlace
        
        
        // Create an empty string to set language to.
        var winterVerbiage = String()
        
        winterVerbiage = "Expected C02 should be "
        //let wintersRange:ClosedRange<Double> = wintersLow...wintersHigh
        print("wintersAlkalosis_OnlyExpectedC02 Func: C02 lower than calculated winters")
        
        return  winterVerbiage +  "\(wintersLow) - \(wintersHigh) "
        
    }
    
    //MARK: - Winter Alkalosis for small C02 label
    func wintersAlkalosis_OnlyExpectedC02_smallLabel(calculatedBicarb: Double) -> String  {
        
        let wintersLow = ((Double(calculatedBicarb) * 0.7 + 21) - 1.5).oneDecimalPlace
        
        let wintersHigh = ((Double(calculatedBicarb) * 0.7 + 21) + 1.5).oneDecimalPlace
        
        // Create an empty string to set language to.
        var winterVerbiage = String()
        
        winterVerbiage = "Expected C02: "
        
        c02SideLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        print("wintersAlkalosis_OnlyExpectedC02_small label Func: C02 lower than calculated winters")
        
        return  winterVerbiage +  "\(wintersLow) - \(wintersHigh)"
        
    }
    
    
    
    
    // MARK:- Winters PCO2 = (HCO3 x 1.5) + 8 ± 2.
    func wintersFormula_Alkalosis (calculatedBicarb: Double) -> String {
        
        let wintersLow = ((Double(calculatedBicarb) * 0.7 + 21) - 1.5).roundTo(places: 1)
        
        let wintersHigh = ((Double(calculatedBicarb) * 0.7 + 21) + 1.5).roundTo(places: 1)
        
        
        let _: ClosedRange<Double> = wintersLow...wintersHigh
        
        var winterVerbiage = String()
        
        if (Double(c02_value!)) < wintersLow {
            //winterVerbiage = " With the pC02 of \(c02_value!) - which is lower than the expected, a superimposed Respiratory Alkalosis is also likely."
            winterVerbiage = "The observed C02 tension is ⬇︎  at \(c02_value!) - which lower than the expected C02 compensation - \(wintersLow), suggesting that a concomitant Respiratory Alkalosis is also likely."
            
            print("wintersFormula_Alkalosis Func: C02 lower than calculated winters")
            
        }
            
        else if (Double(c02_value!)) > wintersHigh {
            //winterVerbiage = " A superimposed Respiratory Acidosis is also likely."
            winterVerbiage = "The observed C02 tension is ⬆︎ at \(c02_value!) - which is higher than the expected C02 compensation - \(wintersHigh), suggesting that a relative hypoventilation is increasing the pC02 causing a concomitant Respiratory Acidosis to compensate."
            
            print("wintersFormula_Alkalosis Func: C02 higher than calculated winters")
            
        }
            
        else if (Double(c02_value!)) > wintersLow && (Double(c02_value!)) < wintersHigh  {
            
            //ExpectedC02Label.text = " The C02 is compensating normally at \(c02_value!)"
            winterVerbiage = "The C02 is compensating nicely at \(c02_value!)"
            print("wintersFormula_Alkalosis Func: C02 falls within")
            
        }
        print("wintersFormula_Alkalosis Func: C02 lower than calculated winters")
        
        return "The corrected C02 should be " + " " +  "\(wintersLow) - \(wintersHigh) " + "\n\n" + winterVerbiage
        
    }
    
    
    //MARK -RE-CALCUALTE BICARB
    func hc03Calculation (c02: Double, pH: Double) -> String {
        
        //HCO3 = 0.03 * pCO2 * 10 (pH - 6.1)
        
        let pHpower: Double = (pH - 6.1)
        
        let bicarb = (0.03 * (c02)) * (pow(10, pHpower).rounded())
        
        return String.localizedStringWithFormat("%.1f", bicarb)
    }
    
    
    
    //MARK: - OBSERVED BICARB CALCULATION
    // Gets calculated for respiratory disorders to determine the compensation for HC03
    func observedHC03 (pC02: Double, Hc03: Double) -> String {
        
        let bicarbAcute = 0.1 * (pC02 - 40) + 24
        
        let bicarbChronic = 0.3 * (pC02 - 40) + 24
        
        let renalCompensation = bicarbChronic - 3
        
        let maxRenalCompensation = renalCompensation...bicarbChronic
        
        let compensationBicarb = bicarbAcute...bicarbChronic
        
        // Set the blank string to be set
        var result = String()
        
        
        
        if Hc03 < bicarbAcute  {
            // 1
            compensationlbl.text = "Metabolic Compensation"
            
            // 2- If the AG is calculated. Just show this.
            if (anionGapLabel.text.nilIfEmpty != nil) {
                result = "Since the observed HC03 is less than the expected HC03 of \(bicarbAcute.oneDecimalPlace), a superimposed Metabolic Acidosis is likely."
            }
                
            else {
                
                // If the AG is NOT calculated run this code.
                result = "Since the observed HC03 is less than the expected HC03 of \(bicarbAcute.oneDecimalPlace), a superimposed Metabolic Acidosis is likely."
                
                anionGapLabel.text = "In metabolic acidosis, the anion gap can be helpful in narrowing down the different causes. Enter a Na and CL to calculate the anion gap."
                
                // PRINT
                print("observedHC03 func --> Since the observed HC03 is less than the expected HC03 of \(bicarbAcute.oneDecimalPlace), a superimposed Metabolic Acidosis is likely. Calculate the anion gap to further determine the type.")
            }
        }
            
            
        else if Hc03 > bicarbAcute {
            
            
            //1
            compensationlbl.text = "Metabolic Compensation"
            //2
            result = "Since the observed HC03 is greater than the expected HC03 of \(bicarbChronic.oneDecimalPlace), a superimposed Metabolic Alkalosis is fully compensating the pH."
            
            print( "Compensation:\nSince the observed HC03 is greater than the expected HC03 of \(bicarbChronic.oneDecimalPlace), a superimposed Metabolic Alkalosis is fully compensating the pH.\nThis compensation is not expected to correct the pH fully.")
        }
            
        else {
            result = "The HC03 is compensating nicely between \(bicarbAcute.oneDecimalPlace) - \(bicarbChronic.oneDecimalPlace), suggesting that the Respiratory Acidosis is likely subacute."
            compensationlbl.text = "Metabolic Compensation"
            
            // PRINT
            print("observedHC03_ALKalosis Func: The bicarb is compensating nicely between \(bicarbAcute.oneDecimalPlace) - \(bicarbChronic.oneDecimalPlace) - suggesting the Respiratory Alkalosis is likely acute.")
        }
        
        return result
        
    }
    
    
    //MARK: BicarbAlkalosis
    // Gets calculated for respiratory disorders to determine the compensation for HC03
    func observedHC03_ALKalosis (pC02: Double, Hc03: Double) -> String {
        
        
        let bicarbHigh = 24 - 0.2 * (40 - pC02) // This will be higher
        
        let bicarbLow = 24 - 0.4 * (40 - pC02)  // This will be lower
        
        _ = bicarbHigh - 5
        
        //let maxRenalCompensation = renalCompensation...bicarbLow
        
        //let compensationBicarb = bicarbLow...bicarbHigh
        
        // Create the empty string
        var result = String()
        
        print("Expected HC03 for alkalosis = \(bicarbLow) - \(bicarbHigh)")
        
        
        //        if maxRenalCompensation.contains(Hc03) {
        //            result = "The HC03 is compensating with maximun renal compensation between \(bicarbLow.oneDecimalPlace) - \(bicarbHigh.oneDecimalPlace) - suggesting the Respiratory Alkalosis is chronic."
        //
        //            compensationlbl.text = "Metabolic Compensation"
        //            print("observedHC03_ALKalosis Func: The HC03 is compensating nicely between \(bicarbHigh.oneDecimalPlace) - \(bicarbLow.oneDecimalPlace) - suggesting the Respiratory Alkalosis is acute.")
        //        }
        
        if Hc03 < bicarbLow  {
            
            // If the AG is calculated. Just show this.
            if (anionGapLabel.text.nilIfEmpty != nil) {
                
                //1
                compensationlbl.text = "Metabolic Compensation"
                
                //2 add the function when 2 or more functions are added to the string
                result = wintersAlkalosis_OnlyExpectedC02(calculatedBicarb: Hc03) + "\n\n" + "Since the observed HC03 is less than the expected HC03 of \(bicarbLow.oneDecimalPlace), a superimposed Metabolic Acidosis is likely."
            }
                
            else {
                //1
                result = wintersAlkalosis_OnlyExpectedC02(calculatedBicarb: Hc03) + "\n\n" + "Since the observed HC03 is less than the expected HC03 of \(bicarbLow.oneDecimalPlace), a superimposed Metabolic Acidosis is likely.\n\nThe anion gap can be helpful in narrowing down the different causes. Enter a Na and CL to calculate the anion gap."
                
                //2
                anionGapLabel.text = "In metabolic acidosis, the anion gap can be helpful in narrowing down the different causes. Enter a Na and CL to calculate the anion gap."
                //3
                compensationlbl.text = "Metabolic Compensation"
                
                // PRINT
                print("observedHC03_ALKalosis Func: Since the observed HC03 is less than the expected HC03 of \(bicarbHigh.oneDecimalPlace). A superimposed Metabolic Acidosis is likely. The anion gap can be helpful in narrowing down the different causes. Enter a Na and CL to calculate the anion gap.")
            }
            
        }
        else if Hc03 > bicarbHigh {
            
            result = wintersAlkalosis_OnlyExpectedC02(calculatedBicarb: Hc03) + "\n\n" + "Since the observed HC03 is greater than the expected HC03 of \(bicarbHigh.oneDecimalPlace), a superimposed Metabolic Alkalosis is likely.\n\nCheck the urine chloride. If it's less than 20 mEq/L, this indicates significant renal chloride reabsorption; thus the alkalosis is chloride-responsive. If the urine chloride is > 20 mEq/L, then the alkalosis is likely to be chloride-resistant unless the patient is currently being treated with and/or is dependent on diuretics. Click below to see more about the chloride response."
            
            
            compensationlbl.text = "Metabolic Compensation"
            
            print( "observedHC03_ALKalosis Func: Since the observed HC03 is greater than the expected HC03 of \(bicarbLow.oneDecimalPlace), a superimposed Metabolic Alkalosis is likely.")
        }
            
        else {
            result = wintersAlkalosis_OnlyExpectedC02(calculatedBicarb: Hc03) + "\n\n" + "The HC03 is compensating nicely between \(bicarbLow.oneDecimalPlace) - \(bicarbHigh.oneDecimalPlace), suggesting that the Respiratory Alkalosis is subacute."
            
            compensationlbl.text = "Metabolic Compensation"
            
            // PRINT
            print("observedHC03_ALKalosis Func: The bicarb is compensating nicely between \(bicarbLow.oneDecimalPlace) - \(bicarbHigh.oneDecimalPlace) - suggesting the Respiratory Alkalosis is likely acute.")
        }
        
        return result
        
    } // End function
    
    
    
    //MARK: - Attributes for observed bicarb
    
    func getAttributedString_observedBicarbs(text: String) -> NSAttributedString {
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Declare the different strings we want to single out to be highlighted
        
        //4A
        let metaAcidosisFullyCompensating = "superimposed Metabolic Alkalosis"
        //4B.
        let superimposedMetabolicAcidosis = "superimposed Metabolic Acidosis"
        // 4C
        let superimposedMetabolicAlkalosis = "superimposed Metabolic Alkalosis"
        // 4D
        
        let greater = "greater"
        
        let expectedBicarbText = "expected HC03"
        
        let alkalosisSubAcute = "Respiratory Alkalosis is subacute"
        
        var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
        let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
        if hc03Text!.count > 0 {
            hc03 = Double(hc03Text!)!
        }
        
        let currentHc03 = "\(hc03)"
        
        let lowArrow = "⬇︎"
        let highArrow = "⬆︎"
        
        
        if text.contains(highArrow) {
            changedString = highArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(lowArrow) {
            changedString = lowArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //A.
        if text.contains(expectedBicarbText) {
            changedString = expectedBicarbText
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(greater) {
            changedString = greater
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(currentHc03) {
            changedString = currentHc03
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(metaAcidosisFullyCompensating) {
            changedString = metaAcidosisFullyCompensating
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //B.
        if text.contains(superimposedMetabolicAcidosis) {
            changedString = superimposedMetabolicAcidosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //C.
        if text.contains(superimposedMetabolicAlkalosis) {
            changedString = superimposedMetabolicAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // D
        if text.contains(alkalosisSubAcute) {
            changedString = alkalosisSubAcute
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
    
    
    
    
    
    //MARK: - Attributed String Alkalosis
    func getAttributedStringsAlkalosis(text: String) -> NSAttributedString
    {
        
        // 1 set the changed text to the function above. That will go inside of the function anf check if the parameters meet.
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Declare the different strings we want to single out to be highlighted
        
        //4A
        let superimposedMetabolicAlkalosis = "a superimposed Metabolic Alkalosis"
        //4B.
        let respAlkalosisSubAcute = "Respiratory Alkalosis is subacute"
        //4C
        let superimposedMetabolicAcidosis  = "superimposed Metabolic Acidosis "
        //4D
        let compensatingnicely = "compensating nicely"
        // Condition when the text Contains the elements, set it to the changed text so it can be outputted
        // 4E
        let currentC02Value = "\(c02_value!)"
        
        
        
        let correctC02 = "Expected C02 should be"
        
        let expectedHC03Language = "greater than the expected HC03 of"
        
        let checkUrineChloride = "Check the urine chloride"
        
        //A.
        
        let lowArrow = "⬇︎"
        let highArrow = "⬆︎"
        
        
        if text.contains(highArrow) {
            changedString = highArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(lowArrow) {
            changedString = lowArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(superimposedMetabolicAlkalosis) {
            changedString = superimposedMetabolicAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        //B.
        if text.contains(respAlkalosisSubAcute) {
            changedString = respAlkalosisSubAcute
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //C
        if text.contains(superimposedMetabolicAcidosis){
            changedString = superimposedMetabolicAcidosis
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //D.
        if text.contains(compensatingnicely){
            changedString = compensatingnicely
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(currentC02Value) {
            changedString = currentC02Value
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        if text.contains(correctC02) {
            changedString = correctC02
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        if text.contains(expectedHC03Language) {
            changedString = expectedHC03Language
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        if text.contains(checkUrineChloride) {
            changedString = checkUrineChloride
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        // This is the color of the singled out text.
        //attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
        
        // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
    
    // MARK: - Attributed String WINTERS Formula
    // Takes winters formula function and changes the text colors inside
    func getAttributedStrings_WintersFormula(text: String) -> NSAttributedString
    {
        
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Declare the different strings we want to single out to be highlighted
        
        //4A
        let concomitantRespiratoryAlkalosis = "concomitant Respiratory Alkalosis"
        //4B.
        let concomitantRespiratoryAcidosis = "concomitant Respiratory Acidosis"
        
        let superimposedMetabolicAcidosis  = "superimposed Metabolic Acidosis "
        
        let compensatingnicely = "compensating nicely"
        
        let correctC02 = "The corrected C02 should be"
        
        let whichIsHigher = "which is higher than the expected C02 compensation -"
        
        let higher = "higher"
        
        let lower = "lower"
        let relativeHypoventilation = "relative hypoventilation is increasing the pC02"
        
        let currentC02Value = "\(c02_value!)"
        
        
        // Condition when the text Contains the elements, set it to the changed text so it can be outputted
        let lowArrow = "⬇︎"
        let highArrow = "⬆︎"
        
        
        if text.contains(highArrow) {
            changedString = highArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4588235294, green: 0.7411764706, blue: 0.7882352941, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        if text.contains(lowArrow) {
            changedString = lowArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4588235294, green: 0.7411764706, blue: 0.7882352941, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        //A.
        if text.contains(concomitantRespiratoryAlkalosis) {
            changedString = concomitantRespiratoryAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        //B.
        if text.contains(concomitantRespiratoryAcidosis) {
            changedString = concomitantRespiratoryAcidosis
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        //C.
        if text.contains(superimposedMetabolicAcidosis) {
            changedString = superimposedMetabolicAcidosis
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        //D.
        if text.contains(compensatingnicely) {
            changedString = compensatingnicely
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Check to see if the current c02 is contained in the string.
        if text.contains(currentC02Value) {
            changedString = currentC02Value
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        // Check to see if the current c02 is contained in the string.
        if text.contains(correctC02) {
            changedString = correctC02
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        if text.contains(relativeHypoventilation) {
            changedString = relativeHypoventilation
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Check to see if the text is contained in the string.
        if text.contains(whichIsHigher) {
            changedString = whichIsHigher
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        // Check to see if the text is contained in the string.
        if text.contains(higher) {
            changedString = higher
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9369999766, green: 0.8199999928, blue: 0.7760000229, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        
        // Check to see if the text is contained in the string.
        if text.contains(lower) {
            changedString = lower
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9369999766, green: 0.8199999928, blue: 0.7760000229, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
        }
        // This is the color of the singled out text.
        //attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
        
        // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
    
    //MARK: - Primary Results Attributes
    // We take a string of text, check to see what's in it and change the formatting and send it as an attributed text.
    func getAttributedStrings_PrimaryResult(text: String) -> NSAttributedString
    {
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        // Calculated Gas
        let abg = ABG(pH: pH_value!, c02: c02_value!, HC03: nil, Sodium: 155, Chloride: 111, Albumin: nil)
        let highArrow = "⬆︎"
        let lowArrow = "⬇︎"
        let pHtext = "pH"
        let co2Text = "C02"
        let bicarbText = "HC03"
        let expectedph = "expected pH"
        let low = "low"
        
        //Disorders i want the color to change
        let normalGas = "Normal Blood Gas"
        let noAcidBase = "no acid-base disorder detected"
        let compensatedMA = "Compensated Metabolic Acidosis."
        let partiallCompensated = "Partially Compensated Metabolic Acidosis."
        let acuteMA = "Acute Metabolic Acidosis."
        let metabolicAlkalosis = "Acute Metabolic Alkalosis."
        let partiallCompensatedMetabolicAlk = "Partially Compensated Metabolic Alkalosis."
        let compMetAlkalosis = "Compensated Metabolic Alkalosis."
        let partialCompRespAcidosis = "Partially Compensated Respiratory Acidosis."
        let compensatedRespAcidosis =  "Compensated Respiratory Acidosis."
        let acuteRespAlkalosis = "Acute Respiratory Alkalosis."
        let partialAlkalosis = "Partially Compensated Respiratory Alkalosis."
        let compensatedRespAlkalosis = "Compensated Respiratory Alkalosis"
        let mixedDisturbance1 =  "Acute Metabolic Acidosis with a superimposed Respiratory Acidosis."
        let mixedDisturbance2 = "Primary Metabolic Alkalosis, with a Secondary Respiratory Alkalosis."
        let mixedDisturbance3 = "Respiratory Alkalosis & Metabolic Acidosis."
        let mixedDisturbance4 = "Metabolic Alkalosis with a Superimposed Respiratory Acidosis."
        let additionalInfo = "Considering that the pH is WNL, both the primary & compensatory disorders should be considered equal in severity."
        let astriks = "***"
        let equalInSeverity = "should be considered equal in severity."
        let pHisNormal = "pH is WNL,"
        
        
        // varaibles for hc03 calculation
        var hc03 = Double(hc03Calculation(c02: c02_value!, pH: pH_value!))!
        let hc03Text = bicarbTextField.text?.trimmingCharacters(in: .whitespaces)
        if hc03Text!.count > 0 {
            
            hc03 = Double(hc03Text!)!
        }
        
        let acuteChronic: String = acuteChronic_RespAcidosis(C02: abg.c02, Bicarb: hc03)
        // Needs to be delared after acuteChrinic
        let respAcidosis = "\(acuteChronic) Respiratory Acidosis"
        
        let currentph = "\(abg.pH)"
        let currentc02 = "\(abg.c02)"
        let currentBicarb = "\(hc03)"
        
        // Condition when the text Contains the elements, set it to the changed text so it can be outputted
        
        /// CONSIDER THE ORDER< THIS WILL CHANGE FIRST< THEN THE SUB COLORS BELOW IN THE SAME SENTENCE WILL CHANGE>
        
        if text.contains(lowArrow) {
            changedString = lowArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(additionalInfo) {
            changedString = additionalInfo
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4588235294, green: 0.7411764706, blue: 0.7882352941, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pHisNormal) {
            changedString = pHisNormal
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
       

        
        if text.contains(equalInSeverity) {
            changedString = equalInSeverity
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(astriks) {
            changedString = astriks
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        if text.contains(noAcidBase) {
            changedString = noAcidBase
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(normalGas) {
            changedString = normalGas
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(mixedDisturbance4) {
            changedString = mixedDisturbance4
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(mixedDisturbance3) {
            changedString = mixedDisturbance3
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(mixedDisturbance2) {
            changedString = mixedDisturbance2
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(mixedDisturbance1) {
            changedString = mixedDisturbance1
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(compensatedRespAlkalosis) {
            changedString = compensatedRespAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(partialAlkalosis) {
            changedString = partialAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(acuteRespAlkalosis) {
            changedString = acuteRespAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(compensatedRespAcidosis) {
            changedString = compensatedRespAcidosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(partialCompRespAcidosis) {
            changedString = partialCompRespAcidosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(respAcidosis) {
            changedString = respAcidosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(compMetAlkalosis) {
            changedString = compMetAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains(partiallCompensatedMetabolicAlk) {
            changedString = partiallCompensatedMetabolicAlk
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(metabolicAlkalosis) {
            changedString = metabolicAlkalosis
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(acuteMA) {
            changedString = acuteMA
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(partiallCompensated) {
            changedString = partiallCompensated
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(compensatedMA) {
            changedString = compensatedMA
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(highArrow) {
            changedString = highArrow
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4588235294, green: 0.7411764706, blue: 0.7882352941, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains("normal") {
            changedString = "normal"
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
       
        
        if text.contains(low) {
            changedString = low
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(currentph) {
            changedString = currentph
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains(expectedph) {
            changedString = expectedph
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains(pHtext) {
            changedString = pHtext
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(co2Text) {
            changedString = co2Text
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(bicarbText) {
            changedString = bicarbText
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9844596982, green: 0.9865679145, blue: 0.9804638028, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(currentc02) {
            changedString = currentc02
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains(currentBicarb) {
            changedString = currentBicarb
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        return attributedText
        
    }
    
}// End extension
