//
//  VentAttributeChanages.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/31/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension VentMode_detailVC {
    // Creat attributes for the modes
    
    //MARK: - Change AC
    func changeString_AssistControl() {
        
        // Where are we getting the text From
        let text = VentilatorModes.AC.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let ac = "Assist control or (A/C)"
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line"
        let disadvantages = "Disadvantages to A/C:"
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(disadvantages){
            changedString = disadvantages
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(ac){
            changedString = ac
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }
    
    
    
    //MARK: - Change APRV
    func changeString_APRV() {
        
        // Where are we getting the text From
        let text = VentilatorModes.APRV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let aprv = "Airway Pressure Release Ventilation (APRV)"
        let whatToKnow = "What to know:"
        let basic = "There are four basic settings that need to be set initially:"
        let modes = "P-High, T-High, P-Low, and T-Low."
        let pHigh = "1. P-High: "
        let pLow = "3. P-Low:"
        let tHigh = "2. T-High:"
        let tLow = "4. T-Low:"
        
        
        if text.contains(tLow){
            changedString = tLow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(tHigh){
            changedString = tHigh
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(pLow){
            changedString = pLow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(pHigh){
            changedString = pHigh
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(modes){
            changedString = modes
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(basic){
            changedString = basic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(aprv){
            changedString = aprv
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
}

    
    //MARK: - Change Bilevel
    func changeString_Bilevel() {
        
        // Where are we getting the text From
        let text = VentilatorModes.Bipap.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "Bilevel Positive Airway Pressure"
        let two = "There are four basic settings that need to be set initially:"
        let three = "This minimum pressure helps to keep disease airways and alveoli from collapsing"
        let four = "Noninvasive ventilation does not provide enough support for very sick patients."
        let five = "Suggested Settings:"
        let six = "When increasing the EPAP, make sure to increase the IPAP by the same amount, to ensure the same ratio of pressure support."
        let seven = "Note:"
        let eight = "IPAP"
        let nine = "EPAP"
        let ten = "IPAP = Inspiratory positive airway pressure"
        let eleven = "EPAP = Expiratory positive airway pressure"
        let Aa = "EPAP = IPAP, it is used as CPAP"
        let Bb = "IPAP > EPAP, EPAP is used as PEEP"
        let Cc = "Titrate the SpO2 to be greater than 92%"
        
        
        if text.contains(Cc){
            changedString = Cc
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(Bb){
            changedString = Bb
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8349413276, green: 0.3352985978, blue: 0.3409483433, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(Aa){
            changedString = Aa
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(eleven){
            changedString = eleven
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(ten){
            changedString = ten
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(nine){
            changedString = nine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(eight){
            changedString = eight
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(seven){
            changedString = seven
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(six){
            changedString = six
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(five){
            changedString = five
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(four){
            changedString = four
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }

    //MARK: - Change CPAP
    func changeString_CPAP() {
        
        // Where are we getting the text From
        let text = VentilatorModes.CPAP.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "The patient must be able to generate a breath to use this mode."
        let two = "Placing an apenic patient on CPAP will cause the patient to code"
        let three = "This minimum pressure helps to keep disease airways and alveoli from collapsing"
        let four = "Noninvasive ventilation does not provide enough support for very sick patients."
        let five = "3. P-Low:"
        let six = "2. T-High:"
        let seven = "4. T-Low:"
        let increaseing = "Increasing the CPAP level can improve alveolar stability, and improve oxygenation. Adding pressure support (PS) to CPAP can improve ventilation (CO2 removal)."
        let remember = "The patient must be able to generate a  breath to use this mode."
        let remember2 = "Remember, the patient must be able to spontaneously breathe on their own."
        
        if text.contains(increaseing){
            changedString = increaseing
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)

            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(remember){
            changedString = remember
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(remember){
            changedString = remember
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(seven){
            changedString = seven
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(six){
            changedString = six
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(five){
            changedString = five
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(four){
            changedString = four
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1) , subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }
    
    
    
    
    
    //MARK: - Change IMV
    func changeString_IMV() {
        
        // Where are we getting the text From
        let text = VentilatorModes.IMV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "Disadvantages to IMV:"
        let two = "the ventilator does not make any attempt to synchronize those spontaneous breaths with mandatory breaths"
        let three = "respiratory rates that exceeded 40 bpm"
        let four = "not synchronized"
       
        

        
        if text.contains(four){
            changedString = four
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }

    //MARK: - Change Inverse Ratio
    func changeString_IRV() {
        
        // Where are we getting the text From
        let text = VentilatorModes.IRV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "very high plateau pressures"
        let two = "subset of pressure control ventilation in which the inspiratory time is longer than the expiratory time"
        let three = "This mode can lead to air trapping, and all patients should be paralyzed and sedated while using IRV."
        let four = "END OF EXPIRATION."
        
        
        
        
        if text.contains(four){
            changedString = four
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }

    
    //MARK: - Change Pressure Control
    func changeString_PCV() {
        
        // Where are we getting the text From
        let text = VentilatorModes.PCV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "Simply put, the pressure is the endpoint rather than volume."
        let two = "constant pressure is maintained throughout the preset inspiratory time (I – time)"
        let three = "respiratory rates that exceeded 40 bpm"
        let four = "not synchronized"
        let A = "Suggested Settings:"
        let B = "Increase the delta until the desired exhaled tidal volume (Vte) is obtained."
        let C = "Setting the pressure:"
        let D = " 75% of the difference between the Ppeak and PEEP"
        let E = "Delta + PEEP"
        let F = "Delta = Pplat - PEEP"
        let G = "As compliance and resistance changes, tidal volumes change (Compliance = volume/pressure)."
        let delta = "Delta = Ppk - PEEP"

        
        if text.contains(delta){
            changedString = delta
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(G){
            changedString = G
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(F){
            changedString = F
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(E){
            changedString = E
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.7378575206, green: 0.2320150733, blue: 0.1414205134, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(D){
            changedString = D
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(C){
            changedString = C
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(B){
            changedString = B
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(A){
            changedString = A
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(four){
            changedString = four
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }

    
    //MARK: - Change PRVC
    func changeString_PRVC() {
        
        // Where are we getting the text From
        let text = VentilatorModes.PRVC.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "It combines the advantages of PCV and AC"
        let two = "PRVC guarantees a tidal volume by increasing the pressure during inspiration and maintains that pressure in the face of decreased pulmonary compliance or resistance"
        let three = "breath will terminate"
        
        let A = "Although there's a constant pressure administered during the breath, the pressure adjusts for each breath as compliance increases or decreases:"
       
        
        
    
        
        
        if text.contains(A){
            changedString = A
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }
    
    //MARK: - Change Pressure Support
    func changeString_PressureSupportVentilation() {
        
        // Where are we getting the text From
        let text = VentilatorModes.PSV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "A preset inspiratory pressure is set which assists the patient's ventilatory effort."
        let two = "patient determines the TV"
        let three = "augmenting the tidal volume"
        
        let A = "The patient needs to be spontaneously breathing on their own"
        
        
        
        
        
        
        if text.contains(A){
            changedString = A
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }
    
    
    //MARK: - Change SIMV
    func changeString_SIMV() {
        
        // Where are we getting the text From
        let text = VentilatorModes.SIMV.rawValue
        
        // Set the attribute to the text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: text)
        
        var changedString = String()
        
        // What text to change
        let whatToKnow = "What to know:"
        let bottomLine = "Bottom Line:"
        let One = "combines breaths and supported breaths"
        let two = "volume or pressure controlled"
        let three = "breath will terminate"
        let A = "SIMV will act exactly the same as A/C in paralyzed patients"
        let B = "Caveat:"
        
        
        
        if text.contains(B){
            changedString = B
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(A){
            changedString = A
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(three){
            changedString = three
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(two){
            changedString = two
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        if text.contains(One){
            changedString = One
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(whatToKnow){
            changedString = whatToKnow
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(bottomLine){
            changedString = bottomLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        // Set the label to the attribute
        self.descriptionLabel.attributedText = attributedText
    }
    
}// End of extension
