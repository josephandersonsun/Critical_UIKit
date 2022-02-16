//
//  _12Lead_Attributes.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/9/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation

import UIKit

// Because we will be referencing this in the segue.
//MARK: - Overview
extension _12Lead_Collection_VC {

    //MARK: - OVerview

    
    // We change the colors of the ekg description
func overViewAttribute(text: String) -> NSAttributedString
{
    
    // Where do we want to get the text info from ( source )
    let changedText = EKGDescription.Overview
    
    let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
    
    // Change the colors of the individual words within the text
    // Global string variable
    var changedString = String()
    
    let augmented = "Augmented Limb Leads (Unipolar):"
    let limb = "Limb Leads (Bipolar):"
    let precordial = "Precordial Leads (V1-V6):"
    let morphology = "Morphology assessment"
    let qrs = "QRS complex:"
    let pwave = "P-wave:"
    let Twave = "T Wave:"
    let stSegment = "ST Segment:"
    
    // Change the text here
    if text.contains(augmented) {
        changedString = augmented
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    // Change the text here
    if text.contains(Twave) {
        changedString = Twave
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    // Change the text here
    if text.contains(stSegment) {
        changedString = stSegment
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    
    // Change the text here
    if text.contains(pwave) {
        changedString = pwave
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    
    if text.contains(precordial) {
        changedString = precordial
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    if text.contains(limb) {
        changedString = limb
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
        
    }
    
    if text.contains(morphology) {
        changedString = morphology
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
        
    }
    
    
    if text.contains(qrs) {
        changedString = qrs
        // Set the string to the changed String so its set at the end
        
        // This is the color of the singled out text.
        attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
        //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
        let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: changedString)
        
    }
    
    
    
    return attributedText
}


}

//MARK: - MI Regions
extension _12Lead_Collection_VC {
    
    func miRegions_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.MIRegions
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = ""
        let B = ""
        let C = ""
        let D = ""
        let E = ""
        let F = ""
        let G = ""
        let H = ""
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(G) {
            changedString = G
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(H) {
            changedString = H
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        // Change the text here
        if text.contains(F) {
            changedString = F
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(D) {
            changedString = D
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(E) {
            changedString = E
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }

}

//MARK: - Lead Axis
extension _12Lead_Collection_VC {
    
    func leadAxis_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.LeadAxis
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "Overview"
        let B = "The Breakdown"
        let C = "The Main Point"
        let D = "Normal Axis-"
        let E = "Physiological Left Axis Deviation (LAD)"
        let F = "Pathological Left Axis Deviation"
        let G = "Right Axis Deviation (RAD)"
        let H = "Extreme Right Axis Deviation (ERAD)"
        let I = "Normal Axis"
        let J = "Right Axis Deviation"
        let K = "Extreme Right Axis Deviation"
        let L = "Left Axis Deviation"
        let M = "ERAD causes:"
        let N = "LAD causes include:"
        
        // Change the text here
        if text.contains(N) {
            changedString = N
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        // Change the text here
        if text.contains(M) {
            changedString = M
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(I) {
            changedString = I
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(J) {
            changedString = J
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
       
        
        // Change the text here
        if text.contains(K) {
            changedString = K
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        // Change the text here
        if text.contains (L) {
            changedString = L
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        // Change the text here
        if text.contains(G) {
            changedString = G
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        // Change the text here
        if text.contains(H) {
            changedString = H
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        // Change the text here
        if text.contains(F) {
            changedString = F
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(D) {
            changedString = D
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(E) {
            changedString = E
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
    
}

//MARK: - Anterior Wall
extension _12Lead_Collection_VC {
    
    func anteriorWall_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.AnteriorWall
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "WHAT TO KNOW"
        let B = "INFARCTION PATTERNS"
        let C = "Anterior = V2-5"
        let D = "Anteroseptal = V1-4"
        let E = "Anterolateral = V3-6, Lead I + aVL"
        let F = "Extensive anterior / anterolateral = V1-6, Lead I + aVL"
        let G = "The tracing above shows an Anterolateral infarction. Notice the ST elevations in leads V2-V5"
        let H = "Progressive loss of R wave progression."
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(G) {
            changedString = G
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(H) {
            changedString = H
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color:#colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1) , subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        // Change the text here
        if text.contains(F) {
            changedString = F
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(D) {
            changedString = D
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(E) {
            changedString = E
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
    
}

//MARK: - Inferior Wall
extension _12Lead_Collection_VC {
    
    func inferiorWall_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.InferiorWall
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "WHAT TO KNOW"
        let G = "RCA or LCx"
       
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        // Change the text here
        if text.contains(G) {
            changedString = G
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        return attributedText
    }
    
}

//MARK: - Lateral Wall
extension _12Lead_Collection_VC {
    
    func lateralWall_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.LateralWall
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "WHAT TO KNOW"
        let B = "INFARCTION PATTERNS"
        let C = "(LAD) or the left circumflex artery (LCx)"
        
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
    
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
    
        
        
        return attributedText
    }
    
}

//MARK: - Brugadas
extension _12Lead_Collection_VC {
    
    func brugada_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.BrugadaSyndrome
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "Type I:"
        let B = "Type II:"
        let C = "Type III:"
        let D = "WHAT TO KNOW"
        let E = "BOTTOM LINE"
      
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
  
        
        
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(D) {
            changedString = D
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(E) {
            changedString = E
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
    
}

//MARK: - Wellen's Syndrome
extension _12Lead_Collection_VC {
    
    func wellens_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.WellensCriteria
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "WHAT TO KNOW"

        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
      
        
        
        return attributedText
    }
    
}

//MARK: - Sgarbossas
extension _12Lead_Collection_VC {
    
    func sgarbossas_Attribute(text: String) -> NSAttributedString
    {
        
        // Where do we want to get the text info from ( source )
        let changedText = EKGDescription.SgarbossasCriteria
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText.rawValue)
        
        // Change the colors of the individual words within the text
        // Global string variable
        var changedString = String()
        
        let A = "WHAT TO KNOW"
        let B = "CRITERIA"
        let C = "ST elevation > 1 mm and in the same direction (concordant) with the QRS complex:  5 points"
        let D = "ST depression > 1 mm in leads V1, V2, or V3:  3 points"
        let E = "ST elevation > 5 mm and in the opposite direction (discordant) with the QRS.: 2 points"
      
        
        // Change the text here
        if text.contains(A) {
            changedString = A
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
       
        
        if text.contains(C) {
            changedString = C
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        if text.contains(B) {
            changedString = B
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        if text.contains(D) {
            changedString = D
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
            
        }
        
        
        if text.contains(E) {
            changedString = E
            // Set the string to the changed String so its set at the end
            
            // This is the color of the singled out text.
            attributedText.apply(color: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), subString: changedString)
            //attributedText.underLine(subString: changedString)            // declare the font of the singled out text
            let customFont = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
            
            // Change the font of the string
            attributedText.apply(font: customFont!, subString: changedString)
            
        }
        
        
        
        return attributedText
    }
    
}
