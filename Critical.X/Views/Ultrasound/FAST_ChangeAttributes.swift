//
//  FAST_ChangeAttributes.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/23/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit





//MARK: - SEt the attrubutes of the texts to be passed.

extension FAST_MAIN_VC {
    
    
    // Heres the function/ Takes a string and returns atrributed String.
    func changeAttribute_Abnormal (text: String) -> NSAttributedString {
        
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Delcare the differenct strings we want to single out to be highlighted
        
        //4A
        let pelvic = "pelvic Cul De Sac"
        let rectovesical = "rectovesical pouch"
        let Hemoperitoneum = "Hemoperitoneum:"
        let solid = "Solid Organ Injuries:"
        let PosFast = "Positive FAST"
        let negFast = "Negative FAST"
        let effusion = "Pericardial Effusion:"
        let tamponade = "Cardiac Tamponade:"
        let asystole = "Cardiac Asystole:"
        let cardiacNote = "In those patients who are hypotensive with ventricular collapse consider a pericardiocentesis."
        let BLine = "B-Lines:"
        let pleural = "Pleural Effusion:"
        let barcode = "Barcode Sign"
        let probe = "Probe Indicator:"
        
        
        
        if text.contains(barcode){
            changedString = barcode
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(pleural){
            changedString = pleural
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(BLine){
            changedString = BLine
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(probe){
            changedString = probe
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(effusion){
            changedString = effusion
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(tamponade){
            changedString = tamponade
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(asystole){
            changedString = asystole
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9219999909, blue: 0.6761207884, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        
        if text.contains(cardiacNote){
            changedString = cardiacNote
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(negFast){
            changedString = negFast
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(PosFast){
            changedString = PosFast
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(solid){
            changedString = solid
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        
        if text.contains(Hemoperitoneum){
            changedString = Hemoperitoneum
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(pelvic){
            changedString = pelvic
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        
        if text.contains(rectovesical){
            changedString = rectovesical
            // Set the string to the changed String so its set at the end
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            
            let openSansFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            // Change the font of the string
            attributedText.apply(font: openSansFont!, subString: changedString)
        }
        //        // This is the color of the singled out text.
        //        attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
}
