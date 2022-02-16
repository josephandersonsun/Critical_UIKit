//
//  ResultTextAttributes.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 11/10/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit
//import SwiftyAttributes
extension ABGViewController {
    
    func changeThe_PH_TextAttributes(text: String, subStrings: String) -> NSAttributedString {
        
        //Lets apply special text attributes
        let changedText = text
        
        // Setting the attriubte to the string
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the color of a word in the string
        attributedText.apply(color: #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1), subString: subStrings)
        
        let customFont = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        // Change the font of the string
        attributedText.apply(font: customFont!, subString: subStrings)
        
        return attributedText
    }
    
}

//MARK: - Mixed Alkalosis
extension ResultViewController {
    
    func mixedDisturbance2_CriticalPearls()  {
        
        // Where do we want to get the text info from ( source )
        let changedText = Result.Mixed_Metabolic_Resp_ALKALOSIS.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "With metabolic issuess, look to correct the underlying issue.")
        // Change font
        attributedText.apply(font: customFont!, subString: "With metabolic issuess, look to correct the underlying issue.")
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        //3 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride- unresponsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride- unresponsive")
        
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride-responsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride-responsive")
        
        //5 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Note:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Note:")
        
        //6 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Acetazolamide (Diamox)")
        // Change font
        attributedText.apply(font: customFont!, subString: "Acetazolamide (Diamox)")
        
        //7 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Labs:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Labs:")
        
        
        //8 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        
        //8 Change color
        attributedText.apply(color:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "The priority is to treat any underlying hypoxemia.")
        // Change font
        attributedText.apply(font: customFont!, subString: "The priority is to treat any underlying hypoxemia.")
        
        
        
        // change the textField to attributed text
        criticalPearl.attributedText = attributedText
    }
    
}

extension ResultViewController  {
    
    
    
    func criticalAttributes_CompensatedMetabolic_Alkalosis()  {
        
        // Where do we want to get the text info from ( source )
        let changedText = Result.metabolic_ALKALOSIS.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        let loop = "Loop or Thiazide diuretics:"
        let gastric = "Gastric Suctioning or Vomiting"
        let laxitaves = "Use of laxatives"
        let hypercapnea = "Hypercapnia"
        let contractionalAlk = "Contraction Alkalosis:"
        let administering = "administering NaCl fluids"
        
        
        //A
        if changedText.contains(loop) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: loop)
            // Change font
            attributedText.apply(font: customFont!, subString: loop)
            
        }
        
        //B
        if changedText.contains(gastric) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: gastric)
            // Change font
            attributedText.apply(font: customFont!, subString: gastric)
            
        }
        
        //C
        if changedText.contains(administering) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: administering)
            // Change font
            attributedText.apply(font: customFont!, subString: administering)
            
        }
        
       //D
        if changedText.contains(laxitaves) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: laxitaves)
            // Change font
            attributedText.apply(font: customFont!, subString: laxitaves)
            
        }
        
        //E
        if changedText.contains(hypercapnea) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: hypercapnea)
            // Change font
            attributedText.apply(font: customFont!, subString: hypercapnea)
            
        }
        
        //F
        if changedText.contains(contractionalAlk) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: contractionalAlk)
            // Change font
            attributedText.apply(font: customFont!, subString: contractionalAlk)
            
        }
        
        //G
        attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "(depletion) of chloride ions")
        attributedText.underLine(subString:  "(depletion) of chloride ions")
        // Change font
        attributedText.apply(font: customFont!, subString: "(depletion) of chloride ions")
        

        //H
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        // I
        //Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride- unresponsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride- unresponsive")
        attributedText.underLine(subString: "chloride- unresponsive")
        
        // J
        //Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride-responsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride-responsive")
        attributedText.underLine(subString:"chloride-responsive")

        
        //K C
        //hange color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Note:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Note:")
        
        //L Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Acetazolamide (Diamox)")
        // Change font
        attributedText.apply(font: customFont!, subString: "Acetazolamide (Diamox)")
        
        // M
        //Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Labs:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Labs:")
        
        
        //N
        //Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        
        //O
        //Change color
        attributedText.apply(color:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "The priority is to treat any underlying hypoxemia.")
        // Change font
        attributedText.apply(font: customFont!, subString: "The priority is to treat any underlying hypoxemia.")
        
        
        
        //P
        //change the textField to attributed text
        criticalPearl.attributedText = attributedText
    }
    
    
}

//MARK: - Resp Acidosis
extension ResultViewController {
    
    func changeRespAcidosisTextAttributes_CriticalPearls()  {
        // THIS HAS TO BE CHANGED ....Where do we want to get the text info from ( source )
        let changedText = Result.Resp_ACIDOSIS_Compensated.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory acidosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory acidosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "The PaC02 generally will return to normal after restoring adequate alveolar ventilation.")
        // Change font
        attributedText.apply(font: customFont!, subString: "The PaC02 generally will return to normal after restoring adequate alveolar ventilation.")
        
        
        // Sets the label to the attributed text.
        criticalPearl.attributedText = attributedText
        
    }
}

//MARK: - Metabolic Acidosis

extension ResultViewController {
    
    func changeMetabolicAcidosisTextAttributes_CriticalPearls() {
        
        // THIS NEEDS TO CHANGE
        let changedText = Result.metabolic_ACIDOSIS.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Clinical changes:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Clinical changes:")
        
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "A side effect of NaHC03 treatment is the subsequent rise in PaC02.")
        // Change font
        attributedText.apply(font: customFont!, subString: "A side effect of NaHC03 treatment is the subsequent rise in PaC02.")
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "More than one primary acid-base disorder may be present simultaneously. ")
        // Change font
        attributedText.apply(font: customFont!, subString: "More than one primary acid-base disorder may be present simultaneously.")
        
        //3 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Although there's low-quality evidence from observational studies, current literature suggests that NaHC03 is held unless the pH is < 7.1, then address the primary process once the pH rises.")
        // Change font
        attributedText.apply(font: customFont!, subString: "Although there's low-quality evidence from observational studies, current literature suggests that NaHC03 is held unless the pH is < 7.1, then address the primary process once the pH rises.")
        
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Disadvantages of NaHC03:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Disadvantages of NaHC03:")
        
        //5 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Disadvantages include:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Disadvantages include:")
        
        // Sets the textLabel to the attribute
        criticalPearl.attributedText = attributedText
    }
}


//MARK: - Resp Alkalosis

extension ResultViewController {
    
    func change_Resp_Alkalosis_TextAttributes_CriticalPearls() {
        
        // THIS NEEDS TO CHANGE
        let changedText = Result.Mixed_MetabolicAcidosis_RespAlkalosis.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "decrease in C02 with or without a mandatory decrease in HC03.")
        // Change font
        attributedText.apply(font: customFont!, subString: "decrease in C02 with or without a mandatory decrease in HC03.")
        
        //3 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Note:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Note:")
        
        
        //5 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        // Change font
        attributedText.apply(font: customFont!, subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        
        //6 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Acetazolamide (Diamox)")
        // Change font
        attributedText.apply(font: customFont!, subString: "Acetazolamide (Diamox)")
        

        // Sets the textLabel to the attribute
        criticalPearl.attributedText = attributedText
    }
}

extension ResultViewController {
    
    func change_MetabolicAcid_RespAlkalosis_CriticalPearls() {
        
        // THIS NEEDS TO CHANGE
        let changedText = Result.Mixed_MetabolicAcidosis_RespAlkalosis.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Metabolic acidosis changes
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory alkalosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        
        //2 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "decrease in C02 with or without a mandatory decrease in HC03.")
        // Change font
        attributedText.apply(font: customFont!, subString: "decrease in C02 with or without a mandatory decrease in HC03.")
        
        
        //3 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Note:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Note:")
        
        
        //5 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        // Change font
        attributedText.apply(font: customFont!, subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        
        
        // Sets the textLabel to the attribute
        criticalPearl.attributedText = attributedText
    
    }
    
    
} // end the extension

extension ResultViewController {
    
    func changeAttributes_MixedResp_MetabolicAcidosis() {
        
        
    let mixedMetabolicAcidosisAndAlkalosis = Result.Mixed_MetabolicAcidosis_RespAlkalosis.explain()
    let attributedText = NSMutableAttributedString.getAttributedString(fromString: mixedMetabolicAcidosisAndAlkalosis)
    
    print("Mixed disturbance 3 pushed")
    
    //1 For the Metabolic Acidosis
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "POSITIVE ANION GAP:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "POSITIVE ANION GAP:")
    
    //2
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "NORMAL ANION GAP METABOLIC ACIDOSIS")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "NORMAL ANION GAP METABOLIC ACIDOSIS")
    
    // 3
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "GLYCOL:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GLYCOL:")
    
    // 4
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "OXOPROLINE:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "OXOPROLINE:")
    //5
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "LACTIC ACIDOSIS:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "LACTIC ACIDOSIS:")
    //6
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "D-LACTATE")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "D-LACTATE")
    //7
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "METHANOL:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "METHANOL:")
    //8
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "ASPIRIN:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "ASPIRIN:")
    //9
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "RENAL FAILURE:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "RENAL FAILURE:")
    //10
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "KETOACIDOSIS:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "KETOACIDOSIS:")
    
    //11
    attributedText.apply(color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), subString: "GOLD MARK")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GOLD MARK")
    
    
    
    // Resp Attributes
    //1
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory factors:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 13), subString: "Respiratory factors:")
    
    //2
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Stimulation of the Central Nervous System due to:")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 13), subString: "Stimulation of the Central Nervous System due to:")
    
    // Metabolic ATTRIBUTEs
    // 1
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "METABOLIC ALKALOSIS")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "METABOLIC ALKALOSIS")
    
    // 2
    attributedText.apply(color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), subString: "GROE")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GROE")
    
    
    // 3
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "G- GIT excess acid loss")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "G- GIT excess acid loss")
    
    // 4
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "R- RENAL EXCESS ACID LOSS")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "R- RENAL EXCESS ACID LOSS")
    
    // 5
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "O- OVERDOSE OF BASE")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "O- OVERDOSE OF BASE")
    
    // 6
    attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "E- ENDOCRINE")
    attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "E- ENDOCRINE")
    
    differentialsLabel.attributedText = attributedText
    }
    
}

extension ResultViewController {
    
    func mixedDisturbance1_Explain() {
       
        print("Mixed disorder 1 pushed to result view")
        let mixedAcidosis = Result.Mixed_Metabolic_Resp_Acidosis.explain()
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: mixedAcidosis)
        
        // Change the colors of the individual words within the text Resp Acidosis
        //1
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "In Respiratory Acidosis:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "In Respiratory Acidosis:")
        
        //2
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Hypercatabolic disorders such as:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "Hypercatabolic disorders such as:")
        
        //3
        attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "Any decreased alveolar ventilatory state with or without any compensatory increase in HC03.")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "Any decreased alveolar ventilatory state with or without any compensatory increase in HC03.")
        
        
        //1 For the Metabolic Acidosis
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "POSITIVE ANION GAP:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "POSITIVE ANION GAP:")
        
        //2
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "NORMAL ANION GAP METABOLIC ACIDOSIS")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "NORMAL ANION GAP METABOLIC ACIDOSIS")
        
        // 3
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "GLYCOL:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GLYCOL:")
        
        // 4
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "OXOPROLINE:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "OXOPROLINE:")
        //5
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "LACTIC ACIDOSIS:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "LACTIC ACIDOSIS:")
        //6
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "D-LACTATE")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "D-LACTATE")
        //7
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "METHANOL:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "METHANOL:")
        //8
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "ASPIRIN:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "ASPIRIN:")
        //9
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "RENAL FAILURE:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "RENAL FAILURE:")
        //10
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "KETOACIDOSIS:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "KETOACIDOSIS:")
        
        //11
        attributedText.apply(color: #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), subString: "GOLD MARK")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GOLD MARK")
        
        differentialsLabel.attributedText = attributedText
        
    }
}

extension ResultViewController {
    func mixedDisturbance1_CriticalPearls()  {
        print("Mixed disorder 1 pushed to result view- Critical Pearls")

        let mixedAcidosis = Result.Mixed_Metabolic_Resp_Acidosis.clinicalPearls()
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: mixedAcidosis)
        
       
       
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        let MoreThan = "More than one primary acid-base disorder may be present simultaneously."
        let MV = "Minute Ventilation - RR x TV"
        let clinicalChanges = "Clinical changes:"
        let sideEffect =  "A side effect of NaHC03 treatment is the subsequent rise in PaC02."
        let moreTHanOne =  "More than one primary acid-base disorder may be present simultaneously. "
        let althoughLowQuality = "Although there's low-quality evidence from observational studies, current literature suggests that NaHC03 is held unless the pH is < 7.1, then address the primary process once the pH rises."
        let advantagesOfHC03 = "Disadvantages of NaHC03:"
        let disadvantages = "Disadvantages include:"
        let bicarbNotInvolved = "Bicarbonate is not involved in this disorder as it can't buffer itself. It's almost always contraindicated in treatment."
        
        if mixedAcidosis.contains(bicarbNotInvolved) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: bicarbNotInvolved)
            // Change font
            attributedText.apply(font: customFont!, subString: bicarbNotInvolved)
            
            
        }
        if mixedAcidosis.contains(disadvantages) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: disadvantages)
            // Change font
            attributedText.apply(font: customFont!, subString: disadvantages)
            
            
        }
        
        if mixedAcidosis.contains(advantagesOfHC03) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: advantagesOfHC03)
            // Change font
            attributedText.apply(font: customFont!, subString: advantagesOfHC03)
            
            
        }
        
        if mixedAcidosis.contains(althoughLowQuality) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: althoughLowQuality)
            // Change font
            attributedText.apply(font: customFont!, subString: althoughLowQuality)
            
            
        }
        
        if mixedAcidosis.contains(moreTHanOne) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: moreTHanOne)
            // Change font
            attributedText.apply(font: customFont!, subString: MoreThan)

            
        }
        
       
        if mixedAcidosis.contains(sideEffect) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: sideEffect)
            // Change font
            attributedText.apply(font: customFont!, subString: sideEffect)
            
        }
        
        if mixedAcidosis.contains(clinicalChanges) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: clinicalChanges)
            // Change font
            attributedText.apply(font: customFont!, subString: clinicalChanges)
            
        }
        
        if mixedAcidosis.contains(MoreThan) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: MoreThan)
            // Change font
            attributedText.apply(font: customFont!, subString: MoreThan)
            
        }
        
        
        if mixedAcidosis.contains(MV) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: MV)
            // Change font
            attributedText.apply(font: customFont!, subString: MV)
            
        }
        
        
        criticalPearl.attributedText = attributedText
    }
}

//MARK: - Mixed Disturbance 4 attributes

extension ResultViewController {
    
    func mixedDisturbance4_Explain()  {
        // Explanation attriubtes
        
        // Set the string to change
        let metabolicAlk = Result.Metabolic_Alkalosis_Respiratory_Acidosis.explain()
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: metabolicAlk)
        
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)

        
        // 1
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "METABOLIC ALKALOSIS")
        attributedText.apply(font: customFont!, subString: "METABOLIC ALKALOSIS")
        
        // 2
        attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: "GROE")
        attributedText.apply(font:customFont!, subString: "GROE")
        
        
        // 3
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "G- GIT excess acid loss")
        attributedText.apply(font: customFont!, subString: "G- GIT excess acid loss")
        
        // 4
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "R- RENAL EXCESS ACID LOSS")
        attributedText.apply(font: customFont!, subString: "R- RENAL EXCESS ACID LOSS")
        
        // 5
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "O- OVERDOSE OF BASE")
        attributedText.apply(font: customFont!, subString: "O- OVERDOSE OF BASE")
        
        // 6
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "E- ENDOCRINE")
        attributedText.apply(font: customFont!, subString: "E- ENDOCRINE")
        
        // Change the colors of the individual words within the text
        //1
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory ACIDOSIS")
        attributedText.apply(font: customFont!, subString: "Respiratory ACIDOSIS")
        
        //2
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Hypercatabolic disorders such as:")
        attributedText.apply(font:customFont!, subString: "Hypercatabolic disorders such as:")
        
        //3
        attributedText.apply(color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "Any decreased alveolar ventilatory state with or without any compensatory increase in HC03.")
        attributedText.apply(font: customFont!, subString: "Any decreased alveolar ventilatory state with or without any compensatory increase in HC03.")
        
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Consider the following in Respiratory Acidosis:")
          attributedText.apply(font:customFont!, subString: "O- OVERDOSE OF BASE")
        
        // Set the attributes label
        differentialsLabel.attributedText = attributedText
    }
    
    
    func mixedDisturbance4_CriticalPearls() {
        // Critical Pearl Attribites
        
        print("Mixed Disturnance 4 critical pearls passed along")
        let changedText = Result.Metabolic_Alkalosis_Respiratory_Acidosis.clinicalPearls()
        
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: changedText)
        
        // Change the colors of the individual words within the text
        
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Bold", size: 14.0)
        
        //1 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory acidosis boils down to one pathway - Minute Ventilation - RR x TV")
        // Change font
        attributedText.apply(font: customFont!, subString: "Respiratory acidosis boils down to one pathway - Minute Ventilation - RR x TV")
        
        //2 Change color
        attributedText.apply(color:#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), subString: "The PaC02 generally will return to normal after restoring adequate alveolar ventilation.")
        // Change font
        attributedText.apply(font: customFont!, subString: "The PaC02 generally will return to normal after restoring adequate alveolar ventilation.")
        
        
       // Start of metabolic alkalosis
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Note:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Note:")
        
        
        //5 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        // Change font
        attributedText.apply(font: customFont!, subString: "Increases in respiratory minute volume or respiratory rate will cause the pH to increase.")
        
        //6 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Contraction Alkalosis:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Contraction Alkalosis:")
        
        //7 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "This generally can be corrected by administering NaCl fluids, intravenously.")
        // Change font
        attributedText.apply(font: customFont!, subString: "This generally can be corrected by administering NaCl fluids, intravenously.")
        
        //8 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride- unresponsive or resistant")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride- unresponsive or resistant")
        //9 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride-responsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride-responsive")
        
        //8 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Loop or Thiazide diuretics:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Loop or Thiazide diuretics:")
       
        
        //8 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: " Correct electrolyte imbalances, avoid hyperventilation and improve bicarb excretion with volume, CL and K+")
        // Change font
        attributedText.apply(font: customFont!, subString: " Correct electrolyte imbalances, avoid hyperventilation and improve bicarb excretion with volume, CL and K+")
        // Sets the label to the attributes text
    
        criticalPearl.attributedText = attributedText
        
    }
}

// Mixed Disturbance 2
extension ResultViewController {
    
    func mixedDisturbance2_Explain()  {
        let mixedAlkalosis = Result.Mixed_Metabolic_Resp_ALKALOSIS.explain()
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: mixedAlkalosis)
        
        // Change the colors of the individual words within the text
        
        //1
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Respiratory factors:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 13), subString: "Respiratory factors:")
        
        //2
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Stimulation of the Central Nervous System due to:")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 13), subString: "Stimulation of the Central Nervous System due to:")
        
        // Metabolic ATTRIBUTEs
        // 1
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "METABOLIC ALKALOSIS")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "METABOLIC ALKALOSIS")
        // Delcare the font to be used and set it to the text
        let customFont  = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        
        let loop = "Loop or Thiazide diuretics:"
        let gastric = "Gastric Suctioning or Vomiting"
        let laxitaves = "Use of laxatives"
        let hypercapnea = "Hypercapnia"
        let contractionalAlk = "Contraction Alkalosis:"
        let administering = "administering NaCl fluids"
        
        
        if mixedAlkalosis.contains(loop) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: loop)
            // Change font
            attributedText.apply(font: customFont!, subString: loop)
            
        }
        
        if mixedAlkalosis.contains(gastric) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: gastric)
            // Change font
            attributedText.apply(font: customFont!, subString: gastric)
            
        }
        
        if mixedAlkalosis.contains(administering) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: administering)
            // Change font
            attributedText.apply(font: customFont!, subString: administering)
            
        }
        
        if mixedAlkalosis.contains(laxitaves) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: laxitaves)
            // Change font
            attributedText.apply(font: customFont!, subString: laxitaves)
            
        }
        
        if mixedAlkalosis.contains(hypercapnea) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: hypercapnea)
            // Change font
            attributedText.apply(font: customFont!, subString: hypercapnea)
            
        }
        
        if mixedAlkalosis.contains(contractionalAlk) {
            
            //4 Change color
            attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: contractionalAlk)
            // Change font
            attributedText.apply(font: customFont!, subString: contractionalAlk)
            
        }
        
        attributedText.apply(color: #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1), subString: "(depletion) of chloride ions")
        attributedText.underLine(subString:  "(depletion) of chloride ions")
        // Change font
        attributedText.apply(font: customFont!, subString: "(depletion) of chloride ions")
        
        
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "Chloride Response:")
        // Change font
        attributedText.apply(font: customFont!, subString: "Chloride Response:")
        
        
        //3 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride- unresponsive")
        
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride- unresponsive")
        attributedText.underLine(subString: "chloride- unresponsive")
        //4 Change color
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "chloride-responsive")
        // Change font
        attributedText.apply(font: customFont!, subString: "chloride-responsive")
        attributedText.underLine(subString:"chloride-responsive")
        
        // 2
        attributedText.apply(color: #colorLiteral(red: 0.9250000119, green: 0.9409999847, blue: 0.9449999928, alpha: 1), subString: "GROE")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "GROE")
        
        
        // 3
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "G- GIT excess acid loss")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "G- GIT excess acid loss")
        
        // 4
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "R- RENAL EXCESS ACID LOSS")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "R- RENAL EXCESS ACID LOSS")
        
        // 5
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "O- OVERDOSE OF BASE")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "O- OVERDOSE OF BASE")
        
        // 6
        attributedText.apply(color: #colorLiteral(red: 0.9843137255, green: 1, blue: 0.7098039216, alpha: 1), subString: "E- ENDOCRINE")
        attributedText.apply(font: UIFont.boldSystemFont(ofSize: 15), subString: "E- ENDOCRINE")
        
        differentialsLabel.attributedText = attributedText
        
    }
    
}
