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
        if segue.identifier == "Morrisons" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            
         

            
            if let morrisonsViewController = segue.destination as? FASTDetailVC {
                
                // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
                setID = 0
                print("SetID was registered at \(setID) ACTIVATE RUQ")
                
                //Headings and Titles
                morrisonsViewController.fast_Title = "Morrisons Pouch"
               
                morrisonsViewController.fast_description = ViewDescription.RUQ_morrisonsTextDescription.rawValue
               
                morrisonsViewController.abnormalFindingsonScan = AbnormalFindings.RUQ.rawValue
               
                morrisonsViewController.probeTitle = "3.5 Htz"
                
                // Image Views
                // Ultrasound probe position
                morrisonsViewController.ultraSoundName = UltraSoundImages.SweepThroughRUQ.rawValue
                
                // First image
                morrisonsViewController.initialImageString = UltraSoundImages.RUQProbePosition.rawValue
                
                
                print("Morrisons Pouch was selected")
            }
        }
        
        
        // Left Upper Quadrant
        if segue.identifier == "LUQ" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            
            // We use this ID to set and number, then reference the number to see if its set so we can reference it in the containerViewController
            setID = 1
            print("SetID was registered at \(setID). ACTIVATE LUQ")
            
            
            if let LUQ = segue.destination as? FASTDetailVC {
                
                //Headings and Titles
                LUQ.fast_Title = "Perisplenic View - LUQ"
                
                LUQ.fast_description = ViewDescription.leftUpperQuadrant.rawValue
                
                //Headings and Titles
                LUQ.fast_description = ViewDescription.RUQ_morrisonsTextDescription.rawValue
                
                LUQ.abnormalFindingsonScan = AbnormalFindings.RUQ.rawValue
                
                LUQ.probeTitle = "3.5 Htz"
                
                // Image Views
                // Ultrasound probe position
                LUQ.ultraSoundName = UltraSoundImages.SweepThroughRUQ.rawValue
                
                // First image
                LUQ.initialImageString = UltraSoundImages.RUQProbePosition.rawValue
                
                
                print("LUQ Pouch was selected")
            }
        }

    }
    }


