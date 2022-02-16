//
//  EKGAttributedText.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/12/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

extension EkgMenuTableViewController {
    
    //MARK: - AFIB
    // We change the colors of the ekg description
    func setAttributedString_ChangeColorsForText_AFIB(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Afib
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        let clinicalManifestations = "Clinical manifestations include:"
        let etiology = "Etiology:"
        let noDiscernablePwaves = "no discernible P-waves"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(clinicalManifestations) {
            changedString = clinicalManifestations
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(etiology) {
            changedString = etiology
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(noDiscernablePwaves) {
            changedString = noDiscernablePwaves
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        return attributedText
    }
    
    
    //MARK: - SVT
    // We change the colors of the ekg description
    func SVT_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.SVT.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
    
    
}

extension EkgMenuTableViewController {
    
    
    //MARK: - VFib
    // We change the colors of the ekg description
    func VFib_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Vfib.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}


extension EkgMenuTableViewController {
    
    
    //MARK: - VTach
    // We change the colors of the ekg description
    func Vtach_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Vtach.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}


extension EkgMenuTableViewController {
    
    
    //MARK: - Sinus Tach
    // We change the colors of the ekg description
    func sinusTach_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.SinusTach.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        let etiology = "Etiology:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(etiology) {
            changedString = etiology
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}


extension EkgMenuTableViewController {
    
    
    //MARK: - Sinus brady
    // We change the colors of the ekg description
    func sinusBrady_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.SinusBrady.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        let etiology = "Etiology:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        if text.contains(etiology) {
            changedString = etiology
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        return attributedText
    }
}


extension EkgMenuTableViewController {
    
    
    //MARK: - Torsades
    // We change the colors of the ekg description
    func torsades_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Torsades.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        let twists = "twist"
        let pmvt = "polymorphic ventricular tachycardia"
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(twists) {
            changedString = twists
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pmvt) {
            changedString = pmvt
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        return attributedText
    }
}




extension EkgMenuTableViewController {
    
    
    //MARK: - NSR
    // We change the colors of the ekg description
    func NSR_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.NormalSinus.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8322971463, green: 0.7651839852, blue: 0.6244494915, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}



extension EkgMenuTableViewController {
    
    
    //MARK: - Asystole
    // We change the colors of the ekg description
    func asystole_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Asystole.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}


extension EkgMenuTableViewController {
    
    
    //MARK: - Aflutter
    // We change the colors of the ekg description
    func aflutter_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Aflutter.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}



extension EkgMenuTableViewController {
    
    
    //MARK: - ThirdDegree
    // We change the colors of the ekg description
    func ThirdDegree_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.ThirdDegreeHeartBlock.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        let primaryPacer = "primary pacemaker"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(primaryPacer) {
            changedString = primaryPacer
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        return attributedText
    }
}



extension EkgMenuTableViewController {
    
    
    //MARK: - 2ndDegreeTypeII
    // We change the colors of the ekg description
    func secDegreeTypeII_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.SecondDegreeTypeII.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}



extension EkgMenuTableViewController {
    
    
    //MARK: - Wenckebach
    // We change the colors of the ekg description
    func wenkebach_setAttributedString_ChangeColorsForText(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = RhythmDescription.Wenkebach.rawValue
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let rate = "Rate:"
        let rhythm = "Rhythm:"
        let pWave = "P-Wave:"
        let pRInterval = "P-R Interval:"
        let qrs = "QRS:"
        
        
        // Change the text here
        if text.contains(rate) {
            changedString = rate
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.4600000083, green: 0.7400000095, blue: 0.7900000215, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(rhythm) {
            changedString = rhythm
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(pWave) {
            changedString = pWave
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(pRInterval) {
            changedString = pRInterval
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(qrs) {
            changedString = qrs
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9925034642, green: 0.8121734858, blue: 0, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
}
