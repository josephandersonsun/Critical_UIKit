//
//  FastViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/12/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel


var setID = Int()


class FAST_MAIN_VC: UIViewController {

    @IBOutlet weak var subTitleAnimate: AKLabel!
    @IBOutlet weak var closeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //here we animate the subtitle when it appears. 
        let subtitle = "Focused Assessment with Sonography for Trauma"
        subTitleAnimate.animate(text:subtitle, duration: 1, completion: nil)
        // Do any additional setup after loading the view.
        
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
    }
    
    @IBAction func dismissFASTview(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
   
  
   
    
    //MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        ///RUQ
        // We are using 2 conditionals , SET ID and segue identifier. So one segue, multiple views.
        if segue.identifier == "Morrisons" {
            
         
            if let morrisonsViewController = segue.destination as? FASTDetailVC {
                
              
            
                // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
                setID = 0
                print("SetID was registered at \(setID) ACTIVATE RUQ")
                
                //Headings and Titles
                morrisonsViewController.fast_Title = "Morison's Pouch"
               
                morrisonsViewController.descriptionString = UltraSound_AcousticViewDescription.RUQ_morrisonsTextDescription.rawValue
               
              
                morrisonsViewController.abnormalFindingsonScan = changeAttribute_Abnormal(text: AbnormalFindings.RUQ.rawValue)
               
                morrisonsViewController.probeTitle = "Phased Array"
                
                // Image Views
                // Ultrasound probe position
                morrisonsViewController.ultraSoundName = UltraSoundImages.SweepThroughRUQ.rawValue
                
                // First image
                morrisonsViewController.initialImageString = UltraSoundImages.RUQProbePosition.rawValue
                
                
                print("Morison's Pouch was selected")
            }
        }
        
        
        // Left Upper Quadrant
        if segue.identifier == "LUQ" {
            
            // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
            setID = 1
            print("SetID was registered at \(setID). ACTIVATE LUQ")
            
            
            if let LUQ = segue.destination as? FASTDetailVC {
                
                //Headings and Titles
                LUQ.fast_Title = "Perisplenic View - LUQ"
                                
                //Headings and Titles
                LUQ.descriptionString = UltraSound_AcousticViewDescription.leftUpperQuadrant.rawValue
                
               
                LUQ.probeTitle = "Phased Array"
                
                // Image Views
                // First image
                LUQ.initialImageString = UltraSoundImages.LUQProbe.rawValue
                
                // Ultrasound probe position
                LUQ.ultraSoundName = UltraSoundImages.LUQ_SweepThrough.rawValue
                
                // Abnormal Findings
                LUQ.abnormalFindingsonScan = changeAttribute_Abnormal(text: AbnormalFindings.LUQ.rawValue)
                
                print("LUQ View was selected")
            }
        }
        
        
        // Cardiac Views
        if segue.identifier == "Cardiac" {
            
            // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
            setID = 2
            print("SetID was registered at \(setID). ACTIVATE Cardiac")
            
            
            if let Cardiac = segue.destination as? FASTDetailVC {
                
                //Headings and Titles
                Cardiac.fast_Title = "Cardiac Views"
                
                //Headings and Titles
                Cardiac.descriptionString = UltraSound_AcousticViewDescription.CardaicView.rawValue
                
                
                Cardiac.probeTitle = "Cardiac Probe"
                
                // Image Views
                // First image
                Cardiac.initialImageString = UltraSoundImages.CardiacProbe.rawValue
                
                // Ultrasound probe position
                Cardiac.ultraSoundName = UltraSoundImages.subXyphoidGif.rawValue
                
                // Abnormal Findings
                Cardiac.abnormalFindingsonScan = changeAttribute_Abnormal(text: AbnormalFindings.Cardiac.rawValue)
                
                print("Cardiac was selected")
            }
        }
        
        // Thoracic Views
        if segue.identifier == "Thoracic" {
            
            // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
            setID = 3
            print("SetID was registered at \(setID). ACTIVATE Thoracic")
            
            
            if let thoracic = segue.destination as? FASTDetailVC {
                
                //Headings and Titles
                thoracic.fast_Title = "Anterior Thoracic View"
                
                //Headings and Titles
                thoracic.descriptionString = UltraSound_AcousticViewDescription.Thoracic.rawValue
                
                
                thoracic.probeTitle = "Curvilinear / Phased Array"
                
                // Image Views
                // First image
                thoracic.initialImageString = UltraSoundImages.ThoracicProbe.rawValue
                
                // Ultrasound first GIF
                thoracic.ultraSoundName = UltraSoundImages.ABLinesThoracic
                    .rawValue
                
                // Abnormal Findings
                thoracic.abnormalFindingsonScan = changeAttribute_Abnormal(text: AbnormalFindings.Thoracic.rawValue)
                
                print("Thoracic view was selected")
            }
        }
        
        // Pelvic Views
        if segue.identifier == "Pelvic" {
            
            // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
            setID = 4
            print("SetID was registered at \(setID). ACTIVATE Pelvic")
            
            
            if let thoracic = segue.destination as? FASTDetailVC {
                
                //Headings and Titles
                thoracic.fast_Title = "Pelvic Views"
                
                //Headings and Titles
                thoracic.descriptionString = UltraSound_AcousticViewDescription.Pelvic.rawValue
                
                
                thoracic.probeTitle = "Phased Array"
                
                // First image
                thoracic.initialImageString = UltraSoundImages.PelvicProbe.rawValue
                
                // Ultrasound first GIF
                thoracic.ultraSoundName = UltraSoundImages.Pelvic_Normal_Male_FemaleScan
                    .rawValue
                
                // Abnormal Findings
                thoracic.abnormalFindingsonScan = changeAttribute_Abnormal(text: AbnormalFindings.Pelvic.rawValue)
                
                print("Pelvic view was selected")
            }
        }

    } // End Segue
   
}// End Class



extension FAST_MAIN_VC {
    // Changing the detail attribute
    
    //MARK: - RUQ
    
    
    
    // Heres the function/ Takes a string and returns atrributed String.
    func changeAttribute_RUQ (text: String) -> NSAttributedString {
        
        // 1 set the changed text to the function
        let contextResult = text
        // 2 Set the attributed text
        let attributedText = NSMutableAttributedString.getAttributedString(fromString: contextResult)
        // 3 global vairable to set the seleted text to
        var changedString = String()
        
        //4 Delcare the differenct strings we want to single out to be highlighted
        
        //4A
        let HPRR = "Hepatorenal Recess - Morison's Pouch"

                attributedText.apply(color: #colorLiteral(red: 1, green: 0.9843137255, blue: 0.6588235294, alpha: 1), subString: "Hepatorenal Recess - Morison's Pouch")

        
        
        // Return all the changes that we created as a NSAttributed String
        return attributedText
    }
}


