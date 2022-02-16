//
//  NIHStrokeScale.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/19/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class NIHStrokeScale: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var NIHScrollView: UIScrollView!
    //MARK: //////// IBOutlets There are 15 sections of the stroke scale //////
    
     //MARK: - LOC -IBOutlet
    @IBOutlet weak var loc_alert: UIButton!
    @IBOutlet weak var loc_Drowsy: UIButton!
    @IBOutlet weak var loc_Obtunded: UIButton!
    @IBOutlet weak var loc_Comatose: UIButton!

    //MARK: - LOC Questions -IBOutlet
    @IBOutlet weak var locQuestion_Both: UIButton!
    @IBOutlet weak var locQuestion_One: UIButton!
    @IBOutlet weak var locQuestion_Neither: UIButton!

    //MARK: - LOC COmmands -IBOutlet
    @IBOutlet weak var loc_Commands_Both: UIButton!
    @IBOutlet weak var loc_Commands_One: UIButton!
    @IBOutlet weak var loc_Commands_Neither: UIButton!

    //MARK: - Eye Movements -IBOutlet
    @IBOutlet weak var eyeMovements_Normal: UIButton!
    @IBOutlet weak var eyeMovements_MildGaze: UIButton!
    @IBOutlet weak var eyeMovements_CompleteGaze: UIButton!

    //MARK: - Visual Fields -IBOutlet
    @IBOutlet weak var visualFields_Normal: UIButton!
    @IBOutlet weak var visualFields_PartialHemianopia: UIButton!
    @IBOutlet weak var visualFields_CompleteHemianopia: UIButton!
    @IBOutlet weak var visualFields_BilateralHemianopia: UIButton!

    //MARK: - Facial -IBOutlet
    @IBOutlet weak var facial_Normal: UIButton!
    @IBOutlet weak var facial_Minor_Paralysis: UIButton!
    @IBOutlet weak var facial_Partial_Paralysis: UIButton!
    @IBOutlet weak var facial_Complete_Paralysis: UIButton!
    
    
    //MARK: - Motor- LA -IBOutlet
    @IBOutlet weak var leftArm_Normal: UIButton!
    @IBOutlet weak var leftArm_Drift: UIButton!
    @IBOutlet weak var leftArm_Drifts_Within10Sec: UIButton!
    @IBOutlet weak var leftArm_Movement: UIButton!
    @IBOutlet weak var leftArm_CompleteParalysis: UIButton!
    @IBOutlet weak var leftArm_AmputationJointFusion: UIButton!

    //MARK: - Motor RA -IBOutlet
    @IBOutlet weak var rightArm_Normal: UIButton!
    @IBOutlet weak var rightArm_Drift: UIButton!
    @IBOutlet weak var rightArm_Drifts_Within10Sec: UIButton!
    @IBOutlet weak var rightArm_Movement: UIButton!
    @IBOutlet weak var rightArm_CompleteParalysis: UIButton!
    @IBOutlet weak var rightArm_AmputationJointFusion: UIButton!
    
    //MARK: - Motor LL -IBOutlet
    @IBOutlet weak var leftLeg_Normal: UIButton!
    @IBOutlet weak var leftLeg_Drift: UIButton!
    @IBOutlet weak var leftLeg_Drifts_Within10Sec: UIButton!
    @IBOutlet weak var leftLeg_Movement: UIButton!
    @IBOutlet weak var leftLeg_CompleteParalysis: UIButton!
    @IBOutlet weak var leftLeg_AmputationJointFusion: UIButton!
    
    //MARK: - Motor RL -IBOutlet
    @IBOutlet weak var rightLeg_Normal: UIButton!
    @IBOutlet weak var rightLeg_Drift: UIButton!
    @IBOutlet weak var rightLeg_Drifts_Within10Sec: UIButton!
    @IBOutlet weak var rightLeg_Movement: UIButton!
    @IBOutlet weak var rightLeg_CompleteParalysis: UIButton!
    @IBOutlet weak var rightLeg_AmputationJointFusion: UIButton!
    
    //MARK: - Limb Ataxia -IBOutlet
    @IBOutlet weak var LimbAtaxia_Absent: UIButton!
    @IBOutlet weak var LimbAtaxia_PresentIn1: UIButton!
    @IBOutlet weak var LimbAtaxia_PResentIn2: UIButton!
    
    //MARK: - Sensory -IBOutlet
    @IBOutlet weak var sensory_Normal: UIButton!
    @IBOutlet weak var sensory_MildToModerate: UIButton!
    @IBOutlet weak var sensory_SevereToTotal: UIButton!
    
    //MARK: - Language Aphasia -IBOutlet
    @IBOutlet weak var languageAphasia_Normal: UIButton!
    @IBOutlet weak var languageAphasia_MildToModerate: UIButton!
    @IBOutlet weak var languageAphasia_Severe: UIButton!
    @IBOutlet weak var languageAphasia_Mute: UIButton!
    
    //MARK: - Dysarthria (slurred) -IBOutlet
    @IBOutlet weak var dysarthria_Normal: UIButton!
    @IBOutlet weak var dysarthria_MildToModerate: UIButton!
    @IBOutlet weak var dysarthria_Severe: UIButton!
    @IBOutlet weak var dysarthria_Intubated: UIButton!
    
    //MARK: - Neglect -IBOutlet
    @IBOutlet weak var neglect_NoAbnormality: UIButton!
    @IBOutlet weak var neglect_Mild: UIButton!
    @IBOutlet weak var neglect_Profound: UIButton!

    // Small window view ! 
    @IBOutlet weak var scoreView: UIView! {
        didSet {
            // Takes the view and makes it into a circle
            scoreView.layer.cornerRadius = scoreView.frame.size.width / 2
        }
    }
    @IBOutlet weak var floatingScoreLabel: UILabel!
    
    @IBOutlet weak var interpretationLabel: UILabel!
    
    //MARK: Updates the score to the label when the button is selected.
    @IBOutlet weak var nihScoreLabel: UILabel!
    
    
    var count: Int = 0 {
        didSet {
            nihScoreLabel.text = " \(count)"
            
            floatingScoreLabel.text = "\(count)"
            
            
            print("NIH Score is now \(count)")

        }
    }

 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set scrollView delegate to self
        NIHScrollView.delegate = self
        
        // Hide the score window initially
        self.scoreView.isHidden = true

        // Initially set this text since the count is zero
        interpretationLabel.text = "No stroke symptoms"

        
        print("NIH label position is \(nihScoreLabel.frame.minY)")
        
        // Start with the Score as zero
        count = 0
        
        self.NIHScrollView.contentSize = CGSize(width: view.frame.width, height: 3450)

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        // Set a variable to the contentOffset position Y
        let scrollPosition = self.NIHScrollView.contentOffset.y
        
        // Change the color of the backround depending where we are scrolling.
        switch scrollPosition {
        
        case 0...510:
           
            scoreView.backgroundColor =  #colorLiteral(red: 0.03563400358, green: 0.1026722118, blue: 0.1450521946, alpha: 1)
        
        default:
            scoreView.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)

        }
       
        //Conditional when the scrollView starts to scroll past a certain Y value
        if (scrollPosition >= 25) {
            
            // animate the view In
            UIView.animate(withDuration: 5, animations: {
                
                //write a code to unhide
                self.scoreView.isHidden = false
              
                
                print("Position:  \(self.NIHScrollView.contentOffset.x) , \(self.NIHScrollView.contentOffset.y) ")
                
                print("Floating view is visible")
                
            }, completion: nil) // End animation block
        
        } // End if statement
        
        else {
            
            //Slide it up incrementally, etc.
            UIView.animate(withDuration: 1, animations: {
                //
                self.scoreView.isHidden = true
                
                print("Floating view is HIDDEN")
                
            }, completion: nil) // End animation block
        } // End else  statement
    }

    
  
    //MARK: - Setting Points for each button the points
    func calculateScore() {
        count = 0
        

        // if  <#Button#>  .isSelected { count += <# What Score #> }

        //MARK: - LOC
        if  loc_alert.isSelected { count += 0 }
        if  loc_Drowsy.isSelected { count += 1 }
        if  loc_Obtunded.isSelected { count += 2 }
        if  loc_Comatose.isSelected { count += 3 }

        //MARK: - LOC Questions
        if  loc_Commands_Both.isSelected { count += 0 }
        if  loc_Commands_One.isSelected { count += 1 }
        if  loc_Commands_Neither.isSelected { count += 2 }
        
        //MARK: - LOC COmmands
        if  locQuestion_Both.isSelected { count += 0 }
        if  locQuestion_One.isSelected { count += 1 }
        if  locQuestion_Neither.isSelected { count += 2 }
        
        //MARK: - Eye Movements
        if  eyeMovements_Normal.isSelected { count += 0 }
        if  eyeMovements_MildGaze.isSelected { count += 1 }
        if  eyeMovements_CompleteGaze.isSelected { count += 2 }
        
        //MARK: - Visual Fields
        if  visualFields_Normal.isSelected { count += 0 }
        if  visualFields_PartialHemianopia.isSelected { count += 1 }
        if  visualFields_CompleteHemianopia.isSelected { count += 2 }
        if  visualFields_BilateralHemianopia.isSelected { count += 3 }
        
        //MARK: - Facial
        if  facial_Normal.isSelected { count += 0 }
        if  facial_Minor_Paralysis.isSelected { count += 1 }
        if  facial_Partial_Paralysis.isSelected { count += 2 }
        if  facial_Complete_Paralysis.isSelected { count += 3 }

        //MARK: - Motor- LA
        if  leftArm_Normal.isSelected { count += 0 }
        if  leftArm_Drift.isSelected { count += 1 }
        if  leftArm_Drifts_Within10Sec.isSelected { count += 2 }
        if  leftArm_Movement.isSelected { count += 3 }
        if  leftArm_CompleteParalysis.isSelected { count += 4 }
        if  leftArm_AmputationJointFusion.isSelected { print("Left Arm N/A due to amputation or joint fusion")}

        //MARK: - Motor RA
        if  rightArm_Normal.isSelected { count += 0 }
        if  rightArm_Drift.isSelected { count += 1 }
        if  rightArm_Drifts_Within10Sec.isSelected { count += 2 }
        if  rightArm_Movement.isSelected { count += 3 }
        if  rightArm_CompleteParalysis.isSelected { count += 4 }
        if  rightArm_AmputationJointFusion.isSelected { print("Right Arm N/A due to amputation or joint fusion")}
        
        //MARK: - Motor LL
        if  leftLeg_Normal.isSelected { count += 0 }
        if  leftLeg_Drift.isSelected { count += 1 }
        if  leftLeg_Drifts_Within10Sec.isSelected { count += 2 }
        if  leftLeg_Movement.isSelected { count += 3 }
        if  leftLeg_CompleteParalysis.isSelected { count += 4 }
        if  leftLeg_AmputationJointFusion.isSelected { print("Left Leg N/A due to amputation or joint fusion")}
        
        //MARK: - Motor RL
        if  rightLeg_Normal.isSelected { count += 0 }
        if  rightLeg_Drift.isSelected { count += 1 }
        if  rightLeg_Drifts_Within10Sec.isSelected { count += 2 }
        if  rightLeg_Movement.isSelected { count += 3 }
        if  rightLeg_CompleteParalysis.isSelected { count += 4 }
        if  rightLeg_AmputationJointFusion.isSelected { print("Right Leg N/A due to amputation or joint fusion")}
        
        
        //MARK: - Limb Ataxia
        if  LimbAtaxia_Absent.isSelected { count += 0 }
        if  LimbAtaxia_PresentIn1.isSelected { count += 1 }
        if  LimbAtaxia_PResentIn2.isSelected { count += 2 }
        
        
        //MARK: - Sensory
        if  sensory_Normal.isSelected { count += 0 }
        if  sensory_MildToModerate.isSelected { count += 1 }
        if  sensory_SevereToTotal.isSelected { count += 2 }
        
        
        //MARK: - Language Aphasia
        if  languageAphasia_Normal.isSelected { count += 0 }
        if  languageAphasia_MildToModerate.isSelected { count += 1 }
        if  languageAphasia_Severe.isSelected { count += 2 }
        if  languageAphasia_Mute.isSelected { count += 3 }

        
        
        //MARK: - Dysarthria (slurred)
        
        if  dysarthria_Normal.isSelected { count += 0 }
        if  dysarthria_MildToModerate.isSelected { count += 1 }
        if  dysarthria_Severe.isSelected { count += 2 }
        if  dysarthria_Intubated.isSelected { print( "N/A due to intubation") }

       
        //MARK: - Neglect
        if  neglect_NoAbnormality.isSelected { count += 0 }
        if  neglect_Mild.isSelected { count += 1 }
        if  neglect_Profound.isSelected { count += 2 }

        // Updates the Interpretation Label since this is called at every button press to evaluate the count.
        
        switch count {
        
        case 0 :
            
            interpretationLabel.text = "No stroke symptoms"
            
            interpretationLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        
        case 1...4 :
            
            interpretationLabel.text = "Minor stroke"
            
            interpretationLabel.textColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        
        case 5...15 :
            
            interpretationLabel.text = "Moderate stroke"
            
            interpretationLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        
        case 16...20:
            
            interpretationLabel.text = "Moderate to severe stroke"
            
            interpretationLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        case 21...42 :
           
            interpretationLabel.text = "Severe stroke"
            
            interpretationLabel.textColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            
        default:
            break
        }
        
        

    }

} // End calculateScroe fn






extension NIHStrokeScale {
    
    //MARK: - Neglect
    @IBAction func neglect_NoAbnormality(_ sender: Any) {
        // When the button is selected
        if neglect_NoAbnormality.isSelected == true {
            neglect_NoAbnormality.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            neglect_NoAbnormality.isSelected = true // SELECTED
            neglect_Mild.isSelected = false
            neglect_Profound.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func neglect_Mild(_ sender: Any) {
        // When the button is selected
        if neglect_Mild.isSelected == true {
            neglect_Mild.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            neglect_NoAbnormality.isSelected = false
            neglect_Mild.isSelected = true // SELECTED
            neglect_Profound.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func neglect_Profound(_ sender: Any) {
        // When the button is selected
        if neglect_Profound.isSelected == true {
            neglect_Profound.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            neglect_NoAbnormality.isSelected = false
            neglect_Mild.isSelected = false
            neglect_Profound.isSelected =  true // SELECTED
            
        }
        self.calculateScore()
    }
    
    
}



extension NIHStrokeScale {
    
    //MARK: - Dysarthria
    @IBAction func dysarthria_Normal(_ sender: Any) {
        // When the button is selected
        if dysarthria_Normal.isSelected == true {
            dysarthria_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            dysarthria_Normal.isSelected = true // SELECTED
            dysarthria_MildToModerate.isSelected = false
            dysarthria_Severe.isSelected = false
            dysarthria_Intubated.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func dysarthria_MildToModerate(_ sender: Any) {
        // When the button is selected
        if dysarthria_MildToModerate.isSelected == true {
            dysarthria_MildToModerate.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            dysarthria_Normal.isSelected = false
            dysarthria_MildToModerate.isSelected = true // SELECTED
            dysarthria_Severe.isSelected = false
            dysarthria_Intubated.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func dysarthria_Severe(_ sender: Any) {
        // When the button is selected
        if dysarthria_Severe.isSelected == true {
            dysarthria_Severe.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            dysarthria_Normal.isSelected = false
            dysarthria_MildToModerate.isSelected = false
            dysarthria_Severe.isSelected =  true // SELECTED
            dysarthria_Intubated.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    
    @IBAction func dysarthria_Intubated(_ sender: Any) {
        // When the button is selected
        if dysarthria_Intubated.isSelected == true {
            dysarthria_Intubated.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            dysarthria_Normal.isSelected = false
            dysarthria_MildToModerate.isSelected = false
            dysarthria_Severe.isSelected = false
            dysarthria_Intubated.isSelected = true // SELECTED
            
        }
        self.calculateScore()
    }
    
    
    
    
}






extension NIHStrokeScale {
    
    //MARK: - Language aphasia
    @IBAction func languageAphasia_Normal(_ sender: Any) {
        // When the button is selected
        if languageAphasia_Normal.isSelected == true {
            languageAphasia_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            languageAphasia_Normal.isSelected = true // SELECTED
            languageAphasia_MildToModerate.isSelected = false
            languageAphasia_Severe.isSelected = false
            languageAphasia_Mute.isSelected = false

        }
        self.calculateScore()
    }
    
    
    @IBAction func languageAphasia_MildToModerate(_ sender: Any) {
        // When the button is selected
        if languageAphasia_MildToModerate.isSelected == true {
            languageAphasia_MildToModerate.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            languageAphasia_Normal.isSelected = false
            languageAphasia_MildToModerate.isSelected = true // SELECTED
            languageAphasia_Severe.isSelected = false
            languageAphasia_Mute.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func languageAphasia_Severe(_ sender: Any) {
        // When the button is selected
        if languageAphasia_Severe.isSelected == true {
            languageAphasia_Severe.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            languageAphasia_Normal.isSelected = false
            languageAphasia_MildToModerate.isSelected = false
            languageAphasia_Severe.isSelected =  true // SELECTED
            languageAphasia_Mute.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    
    @IBAction func languageAphasia_Mute(_ sender: Any) {
        // When the button is selected
        if languageAphasia_Mute.isSelected == true {
            languageAphasia_Mute.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            languageAphasia_Normal.isSelected = false
            languageAphasia_MildToModerate.isSelected = false
            languageAphasia_Severe.isSelected = false
            languageAphasia_Mute.isSelected = true // SELECTED
            
        }
        self.calculateScore()
    }
    
    
    

}// End extension



extension NIHStrokeScale {
    
    //MARK: - Sensory
    @IBAction func sensory_Normal(_ sender: Any) {
        // When the button is selected
        if sensory_Normal.isSelected == true {
            sensory_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            sensory_Normal.isSelected = true // SELECTED
            sensory_MildToModerate.isSelected = false
            sensory_SevereToTotal.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func sensory_MildToModerate(_ sender: Any) {
        // When the button is selected
        if sensory_MildToModerate.isSelected == true {
            sensory_MildToModerate.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            sensory_Normal.isSelected = false
            sensory_MildToModerate.isSelected = true // SELECTED
            sensory_SevereToTotal.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func sensory_SevereToTotal(_ sender: Any) {
        // When the button is selected
        if sensory_SevereToTotal.isSelected == true {
            sensory_SevereToTotal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            sensory_Normal.isSelected = false
            sensory_MildToModerate.isSelected = false
            sensory_SevereToTotal.isSelected = true // SELECTED
            
        }
        self.calculateScore()
    }
    
} // End extension




extension NIHStrokeScale {
    
    //MARK: - Limb Ataxia
    @IBAction func LimbAtaxia_Absent(_ sender: Any) {
        // When the button is selected
        if LimbAtaxia_Absent.isSelected == true {
            LimbAtaxia_Absent.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            LimbAtaxia_Absent.isSelected = true // SELECTED
            LimbAtaxia_PresentIn1.isSelected = false
            LimbAtaxia_PResentIn2.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func LimbAtaxia_PresentIn1(_ sender: Any) {
        // When the button is selected
        if LimbAtaxia_PresentIn1.isSelected == true {
            LimbAtaxia_PresentIn1.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            LimbAtaxia_Absent.isSelected = false
            LimbAtaxia_PresentIn1.isSelected = true // SELECTED
            LimbAtaxia_PResentIn2.isSelected = false
            
        }
        self.calculateScore()
    }
    
    
    @IBAction func LimbAtaxia_PResentIn2(_ sender: Any) {
        // When the button is selected
        if LimbAtaxia_PResentIn2.isSelected == true {
            LimbAtaxia_PResentIn2.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            LimbAtaxia_Absent.isSelected = false
            LimbAtaxia_PresentIn1.isSelected = false
            LimbAtaxia_PResentIn2.isSelected = true // SELECTED
            
        }
        self.calculateScore()
    }
    
} // End extension






extension NIHStrokeScale {
    //MARK: - Right Leg
    @IBAction func rightLeg_Normal(_ sender: Any) {
        // When the button is selected
        if rightLeg_Normal.isSelected == true {
            rightLeg_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = true // SELECTED
            rightLeg_Drift.isSelected = false
            rightLeg_Drifts_Within10Sec.isSelected = false
            rightLeg_Movement.isSelected = false
            rightLeg_CompleteParalysis.isSelected = false
            rightLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightLeg_Drift(_ sender: Any) {
        // When the button is selected
        if rightLeg_Drift.isSelected == true {
            rightLeg_Drift.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = false
            rightLeg_Drift.isSelected = true // SELECTED
            rightLeg_Drifts_Within10Sec.isSelected = false
            rightLeg_Movement.isSelected = false
            rightLeg_CompleteParalysis.isSelected = false
            rightLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func rightLeg_Drifts_Within10Sec(_ sender: Any) {
        // When the button is selected
        if rightLeg_Drifts_Within10Sec.isSelected == true {
            rightLeg_Drifts_Within10Sec.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = false
            rightLeg_Drift.isSelected = false
            rightLeg_Drifts_Within10Sec.isSelected = true // SELECTED
            rightLeg_Movement.isSelected = false
            rightLeg_CompleteParalysis.isSelected = false
            rightLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightLeg_Movement(_ sender: Any) {
        // When the button is selected
        if rightLeg_Movement.isSelected == true {
            rightLeg_Movement.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = false
            rightLeg_Drift.isSelected = false
            rightLeg_Drifts_Within10Sec.isSelected = false
            rightLeg_Movement.isSelected = true // SELECTED
            rightLeg_CompleteParalysis.isSelected = false
            rightLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func rightLeg_CompleteParalysis(_ sender: Any) {
        // When the button is selected
        if rightLeg_CompleteParalysis.isSelected == true {
            rightLeg_CompleteParalysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = false
            rightLeg_Drift.isSelected = false
            rightLeg_Drifts_Within10Sec.isSelected = false
            rightLeg_Movement.isSelected = false
            rightLeg_CompleteParalysis.isSelected = true // SELECTED
            rightLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightLeg_AmputationJointFusion(_ sender: Any) {
        // When the button is selected
        if rightLeg_AmputationJointFusion.isSelected == true {
            rightLeg_AmputationJointFusion.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightLeg_Normal.isSelected = false
            rightLeg_Drift.isSelected = false
            rightLeg_Drifts_Within10Sec.isSelected = false
            rightLeg_Movement.isSelected = false
            rightLeg_CompleteParalysis.isSelected = false
            rightLeg_AmputationJointFusion.isSelected = true // SELECTED
        }
        self.calculateScore()
    }
    
    
    
}// End extension






extension NIHStrokeScale {
    //MARK: - Left Leg
    @IBAction func leftLeg_Normal(_ sender: Any) {
        // When the button is selected
        if leftLeg_Normal.isSelected == true {
            leftLeg_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = true // SELECTED
            leftLeg_Drift.isSelected = false
            leftLeg_Drifts_Within10Sec.isSelected = false
            leftLeg_Movement.isSelected = false
            leftLeg_CompleteParalysis.isSelected = false
            leftLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func leftLeg_Drift(_ sender: Any) {
        // When the button is selected
        if leftLeg_Drift.isSelected == true {
            leftLeg_Drift.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = false
            leftLeg_Drift.isSelected = true // SELECTED
            leftLeg_Drifts_Within10Sec.isSelected = false
            leftLeg_Movement.isSelected = false
            leftLeg_CompleteParalysis.isSelected = false
            leftLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func leftLeg_Drifts_Within10Sec(_ sender: Any) {
        // When the button is selected
        if leftLeg_Drifts_Within10Sec.isSelected == true {
            leftLeg_Drifts_Within10Sec.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = false
            leftLeg_Drift.isSelected = false
            leftLeg_Drifts_Within10Sec.isSelected = true // SELECTED
            leftLeg_Movement.isSelected = false
            leftLeg_CompleteParalysis.isSelected = false
            leftLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func leftLeg_Movement(_ sender: Any) {
        // When the button is selected
        if leftLeg_Movement.isSelected == true {
            leftLeg_Movement.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = false
            leftLeg_Drift.isSelected = false
            leftLeg_Drifts_Within10Sec.isSelected = false
            leftLeg_Movement.isSelected = true // SELECTED
            leftLeg_CompleteParalysis.isSelected = false
            leftLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func leftLeg_CompleteParalysis(_ sender: Any) {
        // When the button is selected
        if leftLeg_CompleteParalysis.isSelected == true {
            leftLeg_CompleteParalysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = false
            leftLeg_Drift.isSelected = false
            leftLeg_Drifts_Within10Sec.isSelected = false
            leftLeg_Movement.isSelected = false
            leftLeg_CompleteParalysis.isSelected = true // SELECTED
            leftLeg_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func leftLeg_AmputationJointFusion(_ sender: Any) {
        // When the button is selected
        if leftLeg_AmputationJointFusion.isSelected == true {
            leftLeg_AmputationJointFusion.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftLeg_Normal.isSelected = false
            leftLeg_Drift.isSelected = false
            leftLeg_Drifts_Within10Sec.isSelected = false
            leftLeg_Movement.isSelected = false
            leftLeg_CompleteParalysis.isSelected = false
            leftLeg_AmputationJointFusion.isSelected = true // SELECTED
        }
        self.calculateScore()
    }
    
    
    
}// End extension




extension NIHStrokeScale {
    //MARK: - Right Arm
    @IBAction func rightArm_Normal(_ sender: Any) {
        // When the button is selected
        if rightArm_Normal.isSelected == true {
            rightArm_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = true // SELECTED
            rightArm_Drift.isSelected = false
            rightArm_Drifts_Within10Sec.isSelected = false
            rightArm_Movement.isSelected = false
            rightArm_CompleteParalysis.isSelected = false
            rightArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightArm_Drift(_ sender: Any) {
        // When the button is selected
        if rightArm_Drift.isSelected == true {
            rightArm_Drift.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = false
            rightArm_Drift.isSelected = true // SELECTED
            rightArm_Drifts_Within10Sec.isSelected = false
            rightArm_Movement.isSelected = false
            rightArm_CompleteParalysis.isSelected = false
            rightArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func rightArm_Drifts_Within10Sec(_ sender: Any) {
        // When the button is selected
        if rightArm_Drifts_Within10Sec.isSelected == true {
            rightArm_Drifts_Within10Sec.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = false
            rightArm_Drift.isSelected = false
            rightArm_Drifts_Within10Sec.isSelected = true // SELECTED
            rightArm_Movement.isSelected = false
            rightArm_CompleteParalysis.isSelected = false
            rightArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightArm_Movement(_ sender: Any) {
        // When the button is selected
        if rightArm_Movement.isSelected == true {
            rightArm_Movement.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = false
            rightArm_Drift.isSelected = false
            rightArm_Drifts_Within10Sec.isSelected = false
            rightArm_Movement.isSelected = true // SELECTED
            rightArm_CompleteParalysis.isSelected = false
            rightArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func rightArm_CompleteParalysis(_ sender: Any) {
        // When the button is selected
        if rightArm_CompleteParalysis.isSelected == true {
            rightArm_CompleteParalysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = false
            rightArm_Drift.isSelected = false
            rightArm_Drifts_Within10Sec.isSelected = false
            rightArm_Movement.isSelected = false
            rightArm_CompleteParalysis.isSelected = true // SELECTED
            rightArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func rightArm_AmputationJointFusion(_ sender: Any) {
        // When the button is selected
        if rightArm_AmputationJointFusion.isSelected == true {
            rightArm_AmputationJointFusion.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            rightArm_Normal.isSelected = false
            rightArm_Drift.isSelected = false
            rightArm_Drifts_Within10Sec.isSelected = false
            rightArm_Movement.isSelected = false
            rightArm_CompleteParalysis.isSelected = false
            rightArm_AmputationJointFusion.isSelected = true // SELECTED
        }
        self.calculateScore()
    }
    
    
    
}// End extension







extension NIHStrokeScale {
    //MARK: - Left Arm
    @IBAction func leftArm_Normal(_ sender: Any) {
        // When the button is selected
        if leftArm_Normal.isSelected == true {
            leftArm_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Normal.isSelected = true // SELECTED
            leftArm_Drift.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = false
            leftArm_Movement.isSelected = false
            leftArm_CompleteParalysis.isSelected = false
            leftArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }
   
    @IBAction func leftArm_Drift(_ sender: Any) {
        // When the button is selected
        if leftArm_Drift.isSelected == true {
            leftArm_Drift.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Drift.isSelected = true // SELECTED
            leftArm_Normal.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = false
            leftArm_Movement.isSelected = false
            leftArm_CompleteParalysis.isSelected = false
            leftArm_AmputationJointFusion.isSelected = false
        }
        self.calculateScore()
    }


    @IBAction func leftArm_Drifts_Within10Sec(_ sender: Any) {
        // When the button is selected
        if leftArm_Drifts_Within10Sec.isSelected == true {
            leftArm_Drifts_Within10Sec.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Drift.isSelected = false
            leftArm_Normal.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = true // SELECTED
            leftArm_Movement.isSelected = false
            leftArm_CompleteParalysis.isSelected = false
            leftArm_AmputationJointFusion.isSelected = false
        }
        
        print("leftArm_Drifts_Within10Sec")
        self.calculateScore()
    }
    
    @IBAction func leftArm_Movement(_ sender: Any) {
        // When the button is selected
        if leftArm_Movement.isSelected == true {
            leftArm_Movement.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Drift.isSelected = false
            leftArm_Normal.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = false
            leftArm_Movement.isSelected = true // SELECTED
            leftArm_CompleteParalysis.isSelected = false
            leftArm_AmputationJointFusion.isSelected = false
        }
        print("leftArm_Movement")

        self.calculateScore()
    }

    
    @IBAction func leftArm_CompleteParalysis(_ sender: Any) {
        // When the button is selected
        if leftArm_CompleteParalysis.isSelected == true {
            leftArm_CompleteParalysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Drift.isSelected = false
            leftArm_Normal.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = false
            leftArm_Movement.isSelected = false
            leftArm_CompleteParalysis.isSelected = true // // SELECTED
            leftArm_AmputationJointFusion.isSelected = false
        }
        
        print("leftArm_CompleteParalysis")

        self.calculateScore()
    }
   
    @IBAction func leftArm_AmputationJointFusion(_ sender: Any) {
        // When the button is selected
        if leftArm_AmputationJointFusion.isSelected == true {
            leftArm_AmputationJointFusion.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            leftArm_Drift.isSelected = false
            leftArm_Normal.isSelected = false
            leftArm_Drifts_Within10Sec.isSelected = false
            leftArm_Movement.isSelected = false
            leftArm_CompleteParalysis.isSelected = false
            leftArm_AmputationJointFusion.isSelected = true // SELECTED
        }
        
        print("leftArm_AmputationJointFusion")

        self.calculateScore()
    }
    
    
    
}// End extension






extension NIHStrokeScale {
    
    //MARK: - Facial
    @IBAction func facial_Normal(_ sender: Any) {
        // When the button is selected
        if facial_Normal.isSelected == true {
            facial_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            facial_Normal.isSelected = true // SELECTED
            facial_Minor_Paralysis.isSelected = false
            facial_Partial_Paralysis.isSelected = false
            facial_Complete_Paralysis.isSelected = false
            
        }
        print("facial_Normal")

        self.calculateScore()
    }
    
    
    @IBAction func facial_Minor_Paralysis(_ sender: Any) {
        // When the button is selected
        if facial_Minor_Paralysis.isSelected == true {
            facial_Minor_Paralysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            facial_Minor_Paralysis.isSelected = true // SELECTED
            facial_Normal.isSelected = false
            facial_Partial_Paralysis.isSelected = false
            facial_Complete_Paralysis.isSelected = false
            
        }

        print("facial_Minor_Paralysis")
        self.calculateScore()
    }
    
   
    @IBAction func facial_Partial_Paralysis(_ sender: Any) {
        // When the button is selected
        if facial_Partial_Paralysis.isSelected == true {
            facial_Partial_Paralysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            facial_Partial_Paralysis.isSelected = true // SELECTED
            facial_Normal.isSelected = false
            facial_Minor_Paralysis.isSelected = false
            facial_Complete_Paralysis.isSelected = false
            
        }
        print("facial_Partial_Paralysis + 2")

        self.calculateScore()
    }

    @IBAction func facial_Complete_Paralysis(_ sender: Any) {
        // When the button is selected
        if facial_Complete_Paralysis.isSelected == true {
            facial_Complete_Paralysis.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            facial_Complete_Paralysis.isSelected = true // SELECTED
            facial_Normal.isSelected = false
            facial_Minor_Paralysis.isSelected = false
            facial_Partial_Paralysis.isSelected = false
            
        }
        print("facial_Complete_Paralysis + 3")
        self.calculateScore()
    }
    

}// End extension



extension NIHStrokeScale {
    //MARK: Visual Fields
    
    @IBAction func visualFields_Normal(_ sender: Any) {
        // When the button is selected
        if visualFields_Normal.isSelected == true {
            visualFields_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            visualFields_Normal.isSelected = true // SELECTED
            visualFields_PartialHemianopia.isSelected = false
            visualFields_CompleteHemianopia.isSelected = false
            visualFields_BilateralHemianopia.isSelected = false

        }
        print("visualFields_Normal")

        self.calculateScore()
    }
   
    
    @IBAction func visualFields_PartialHemianopia(_ sender: Any) {
        // When the button is selected
        if visualFields_PartialHemianopia.isSelected == true {
            visualFields_PartialHemianopia.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            visualFields_PartialHemianopia.isSelected = true // SELECTED
            visualFields_Normal.isSelected = false
            visualFields_CompleteHemianopia.isSelected = false
            visualFields_BilateralHemianopia.isSelected = false
            
        }
        print("visualFields_PartialHemianopia")

        self.calculateScore()
    }
    
    @IBAction func visualFields_CompleteHemianopia(_ sender: Any) {
        // When the button is selected
        if visualFields_CompleteHemianopia.isSelected == true {
            visualFields_CompleteHemianopia.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            visualFields_CompleteHemianopia.isSelected = true // SELECTED
            visualFields_Normal.isSelected = false
            visualFields_PartialHemianopia.isSelected = false
            visualFields_BilateralHemianopia.isSelected = false
            
        }
        print("visualFields_CompleteHemianopia")

        self.calculateScore()
    }
    
    @IBAction func visualFields_BilateralHemianopia(_ sender: Any) {
        // When the button is selected
        if visualFields_BilateralHemianopia.isSelected == true {
            visualFields_BilateralHemianopia.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            visualFields_BilateralHemianopia.isSelected = true // SELECTED
            visualFields_Normal.isSelected = false
            visualFields_PartialHemianopia.isSelected = false
            visualFields_CompleteHemianopia.isSelected = false
            
        }
        print("visualFields_BilateralHemianopia")
        self.calculateScore()
    }
    
}


extension NIHStrokeScale {
    //MARK:  Eye Movement
    
    @IBAction func eyeMovements_Normal(_ sender: Any) {
        // When the button is selected
        if eyeMovements_Normal.isSelected == true {
            eyeMovements_Normal.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            eyeMovements_Normal.isSelected = true // SELECTED
            eyeMovements_MildGaze.isSelected = false
            eyeMovements_CompleteGaze.isSelected = false
        }
        print("eyeMovements_Normal")
        self.calculateScore()
    }
    
    @IBAction func eyeMovements_MildGaze(_ sender: Any) {
        // When the button is selected
        if eyeMovements_MildGaze.isSelected == true {
            eyeMovements_MildGaze.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            eyeMovements_MildGaze.isSelected = true // SELECTED
            eyeMovements_CompleteGaze.isSelected = false
            eyeMovements_Normal.isSelected = false
        }
        print("eyeMovements_MildGaze")
        self.calculateScore()
    }
    
    @IBAction func eyeMovements_CompleteGaze(_ sender: Any) {
        // When the button is selected
        if eyeMovements_CompleteGaze.isSelected == true {
            eyeMovements_CompleteGaze.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            eyeMovements_CompleteGaze.isSelected = true // SELECTED
            eyeMovements_MildGaze.isSelected = false
            eyeMovements_Normal.isSelected = false
        }
        print(sender)
        self.calculateScore()
    }
    
    
    
}
extension NIHStrokeScale {
    
    //MARK: - LOC Button Actions
    //MARK: LOC Action
    @IBAction func pressedLOC_Alert(_ sender: Any) {
        // When the button is selected
        if loc_alert.isSelected == true {
            loc_alert.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_alert.isSelected = true  // Selected
            loc_Drowsy.isSelected = false
            loc_Obtunded.isSelected = false
            loc_Comatose.isSelected = false
        }
        self.calculateScore()
    }
    
    //MARK: - Pressed Drowsy
    
    @IBAction func pressed_LOC_Drowsy(_ sender: Any) {
        // When the button is selected
        if loc_Drowsy.isSelected == true {
            loc_Drowsy.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Drowsy.isSelected = true    // Selected
            loc_alert.isSelected = false
            loc_Obtunded.isSelected = false
            loc_Comatose.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func pressed_LOC_Obtunded(_ sender: Any) {
        // When the button is selected
        if loc_Obtunded.isSelected == true {
            loc_Obtunded.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Obtunded.isSelected = true // Selected
            loc_Drowsy.isSelected = false
            loc_alert.isSelected = false
            loc_Comatose.isSelected = false
        }
        self.calculateScore()
    }
    
    
    @IBAction func pressed_LOC_Comatose(_ sender: Any) {
        // When the button is selected
        if loc_Comatose.isSelected == true {
            loc_Comatose.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Comatose.isSelected = true // Selected
            loc_alert.isSelected = false
            loc_Obtunded.isSelected = false
            loc_Drowsy.isSelected = false
        }
        self.calculateScore()
    }
    
}

extension NIHStrokeScale {
    
    //MARK: LOC Questions
    //MARK: - Pressed both
    @IBAction func locQuestion_Both(_ sender: Any) {
        // When the button is selected
        if locQuestion_Both.isSelected == true {
            locQuestion_Both.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            locQuestion_Both.isSelected = true // SELECTED
            locQuestion_One.isSelected = false
            locQuestion_Neither.isSelected = false
        }
        self.calculateScore()
    }
    
    //MARK: - Loc Buttons Pressed
    @IBAction func locQuestion_One(_ sender: Any) {
        // When the button is selected
        if locQuestion_One.isSelected == true {
            locQuestion_One.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            locQuestion_One.isSelected = true // SELECTED
            locQuestion_Both.isSelected = false
            locQuestion_Neither.isSelected = false
        }
        self.calculateScore()
    }
    
    @IBAction func locQuestion_Neither(_ sender: Any) {
        // When the button is selected
        if locQuestion_Neither.isSelected == true {
            locQuestion_Neither.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            locQuestion_Neither.isSelected = true // SELECTED
            locQuestion_Both.isSelected = false
            locQuestion_One.isSelected = false
        }
        self.calculateScore()
    }
    
    
}

extension NIHStrokeScale {
    
    //MARK: - LOC Commands Pressed
    @IBAction func loc_Commands_Both(_ sender: Any) {
        // When the button is selected
        if loc_Commands_Both.isSelected == true {
            loc_Commands_Both.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Commands_Both.isSelected = true // SELECTED
            loc_Commands_One.isSelected = false
            loc_Commands_Neither.isSelected = false
        }
        self.calculateScore()
    }

    
    @IBAction func loc_Commands_One(_ sender: Any) {
        // When the button is selected
        if loc_Commands_One.isSelected == true {
            loc_Commands_One.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Commands_One.isSelected = true // SELECTED
            loc_Commands_Both.isSelected = false
            loc_Commands_Neither.isSelected = false
        }
        self.calculateScore()
    }

    
    @IBAction func loc_Commands_Neither(_ sender: Any) {
        // When the button is selected
        if loc_Commands_Neither.isSelected == true {
            loc_Commands_Neither.isSelected = false
        }
            // Same button is true and others are turned off cause only one from the section can talley
        else {
            loc_Commands_Neither.isSelected = true // SELECTED
            loc_Commands_One.isSelected = false
            loc_Commands_Both.isSelected = false
        }
        self.calculateScore()
    }

}// End Extension
