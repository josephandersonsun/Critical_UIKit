//
//  RaceStrokeEval.swift
//  Neuro
//
//  Created by Jadie Barringer III on 2/3/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class RaceStrokeEval: UIViewController {

   
    //MARK: - Outlets
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var sensitivityResultLabel: UILabel!
    @IBOutlet weak var specificityResultLabel: UILabel!
    @IBOutlet weak var pointsResultLabel: UILabel!
    @IBOutlet weak var resultTitleLabel: UILabel!
    
    //Facial Palsy
    @IBOutlet weak var facialPalsy_normaltoMild: UIButton!
    @IBOutlet weak var facialPalsy_Mild: UIButton!
    @IBOutlet weak var facialPalsy_ModeratetoSevere: UIButton!

    //Arm impairment
    @IBOutlet weak var armMotor_normaltoMild: UIButton!
    @IBOutlet weak var armMotor_Mild: UIButton!
    @IBOutlet weak var armMotor_ModeratetoSevere: UIButton!

    // Leg motor impairment
    @IBOutlet weak var legMotor_normaltoMild: UIButton!
    @IBOutlet weak var legMotor_Mild: UIButton!
    @IBOutlet weak var legMotor_ModeratetoSevere: UIButton!

    /// Head Gaze
    @IBOutlet weak var headGaze_absent: UIButton!
    @IBOutlet weak var headGaze_present: UIButton!

    // Hemiparesis
    @IBOutlet weak var hemiparesis_Left: UIButton!
    @IBOutlet weak var hemiparesis_Right: UIButton!
    
    //Right Aphasia buttons
    @IBOutlet weak var aphasiaView: UIView!

    @IBOutlet weak var aphasia_Right_PerfromsBoth: UIButton!
    @IBOutlet weak var aphasia_Right_PerformsOne: UIButton!
    @IBOutlet weak var aphasia_Right_PerformsNeither: UIButton!

    // Left Agnosia
    @IBOutlet weak var agnosiaView: UIView!

    @IBOutlet weak var agnosia_Left_RecognizesBoth: UIButton!
    @IBOutlet weak var agnosia_Left_DoesntRecognizeArmImpairment: UIButton!
    @IBOutlet weak var agnosia_Left_DoesntRecognizeBoth: UIButton!


  
    
    //Updates the score to the label when the button is selected.
    var count: Int = 0 {
        didSet {
            pointsResultLabel.text = " \(count)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        count = 0
        // Do any additional setup after loading the view.
        
        //Hides the apahsia and agnosia view
        
        agnosiaView.isHidden = true
        aphasiaView.isHidden = true
        
        resultDescriptionLabel.text = "Check for left or right sided hemiparesis?"
        resultTitleLabel.text = "Hemiparesis?"

        sensitivityResultLabel.text = ""
        specificityResultLabel.text = ""
        let aphasiaLabelDescription = "Instruct the patient to 1) \"Close your eyes.\" 2) \"Make a fist.\""
        
        let agnosiaLabelDescription = "Ask the patient to 1) While showing them your arm, \"Whose arm is this?\" 2) \"Can you lift both hands and clap?\""
        
    }
    
    //MARK: - Facial Palsy Buttons
    
    @IBAction func facialPaslyNormal(_ sender: Any) {
        if facialPalsy_normaltoMild.isSelected == true {
            facialPalsy_normaltoMild.isSelected = false
        }
        else {
            facialPalsy_normaltoMild.isSelected = true
            facialPalsy_Mild.isSelected = false
            facialPalsy_ModeratetoSevere.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
    }
    
    
    
    @IBAction func facialPaslyMild(_ sender: Any) {
        if facialPalsy_Mild.isSelected == true {
            facialPalsy_Mild.isSelected = false
        }
        else {
            facialPalsy_Mild.isSelected = true
            facialPalsy_normaltoMild.isSelected = false
            facialPalsy_ModeratetoSevere.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()

    }
    
    
    @IBAction func facialPalsyModerateToSevere(_ sender: Any) {
        if facialPalsy_ModeratetoSevere.isSelected == true {
            facialPalsy_ModeratetoSevere.isSelected = false
        }
        else {
            facialPalsy_ModeratetoSevere.isSelected = true
            facialPalsy_normaltoMild.isSelected = false
            facialPalsy_Mild.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()

    }
    
    
    //MARK: - Arm Movement buttons 
    @IBAction func armMovementNormaltoMild(_ sender: Any) {
        if armMotor_normaltoMild.isSelected == true {
            armMotor_normaltoMild.isSelected = false
        }
        else {
            armMotor_normaltoMild.isSelected = true
            armMotor_ModeratetoSevere.isSelected = false
            armMotor_Mild.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    @IBAction func armMovementMild(_ sender: Any) {
        if armMotor_Mild.isSelected == true {
            armMotor_Mild.isSelected = false
        }
        else {
            armMotor_Mild.isSelected = true
            armMotor_ModeratetoSevere.isSelected = false
            armMotor_normaltoMild.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    @IBAction func armModerateToSevere(_ sender: Any) {
        if armMotor_ModeratetoSevere.isSelected == true {
            armMotor_ModeratetoSevere.isSelected = false
        }
        else {
            armMotor_ModeratetoSevere.isSelected = true
            armMotor_Mild.isSelected = false
            armMotor_normaltoMild.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    //MARK: - Leg movement Buttons
    
    @IBAction func legNormalMild(_ sender: Any) {
        if legMotor_normaltoMild.isSelected == true {
            legMotor_normaltoMild.isSelected = false
        }
        else {
            legMotor_normaltoMild.isSelected = true
            legMotor_Mild.isSelected = false
            legMotor_ModeratetoSevere.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    @IBAction func legMild(_ sender: Any) {
        if legMotor_Mild.isSelected == true {
            legMotor_Mild.isSelected = false
        }
        else {
            legMotor_Mild.isSelected = true
            legMotor_normaltoMild.isSelected = false
            legMotor_ModeratetoSevere.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    @IBAction func legModerateToSevere(_ sender: Any) {
        if legMotor_ModeratetoSevere.isSelected == true {
            legMotor_ModeratetoSevere.isSelected = false
        }
        else {
            legMotor_ModeratetoSevere.isSelected = true
            legMotor_normaltoMild.isSelected = false
            legMotor_Mild.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    //MARK: - Absent Gaze Button update
    @IBAction func gazeAbsent(_ sender: Any) {
        if headGaze_absent.isSelected == true {
            headGaze_absent.isSelected = false
        }
        else {
            headGaze_absent.isSelected = true
            headGaze_present.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
       

    }
   //MARK: APhasia Buttons
    @IBAction func recogArm(_ sender: Any) {
        if aphasia_Right_PerformsOne.isSelected == true {
            aphasia_Right_PerformsOne.isSelected = false
        }
        else {
            aphasia_Right_PerformsOne.isSelected = true
            aphasia_Right_PerfromsBoth.isSelected = false
            aphasia_Right_PerformsNeither.isSelected = false
            
            //Agnosia Buttons are off // Takes the button and makes it into a circle
            agnosia_Left_RecognizesBoth.isSelected = false
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
            

        }
        self.calculateRaceScore()
        self.updateSensitivites()

    }
    @IBAction func recogArmorImpairment(_ sender: Any) {
        if aphasia_Right_PerfromsBoth.isSelected == true {
            aphasia_Right_PerfromsBoth.isSelected = false
        }
        else {
            aphasia_Right_PerfromsBoth.isSelected = true
            aphasia_Right_PerformsOne.isSelected = false
            aphasia_Right_PerformsNeither.isSelected = false
            
            
            //Agnosia Buttons are off // Takes the button and makes it into a circle
            agnosia_Left_RecognizesBoth.isSelected = false
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
            
            
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    
    @IBAction func recogNeither(_ sender: Any) {
        if aphasia_Right_PerformsNeither.isSelected == true {
            aphasia_Right_PerformsNeither.isSelected = false
        }
        else {
            aphasia_Right_PerformsNeither.isSelected = true
            aphasia_Right_PerformsOne.isSelected = false
            aphasia_Right_PerfromsBoth.isSelected = false
            
            //Agnosia Buttons are off // Takes the button and makes it into a circle
            agnosia_Left_RecognizesBoth.isSelected = false
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
            
            
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    //MARK: - Agnosia Buttons // Takes the button and makes it into a circle
    @IBAction func recogArmAndImpairment(_ sender: Any) {
        if agnosia_Left_RecognizesBoth.isSelected == true {
            agnosia_Left_RecognizesBoth.isSelected = false
        }
        else {
            agnosia_Left_RecognizesBoth.isSelected = true
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
            
            //Aphasia buttons are off
            aphasia_Right_PerformsNeither.isSelected = false
            aphasia_Right_PerformsOne.isSelected = false
            aphasia_Right_PerfromsBoth.isSelected = false
            
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    
    
    @IBAction func recogArmORTHEImpairment(_ sender: Any) {
        if agnosia_Left_DoesntRecognizeArmImpairment.isSelected == true {
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
        }
        else {
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = true
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
            agnosia_Left_RecognizesBoth.isSelected = false
            
            //Aphasia buttons are off
            aphasia_Right_PerformsNeither.isSelected = false
            aphasia_Right_PerformsOne.isSelected = false
            aphasia_Right_PerfromsBoth.isSelected = false
            
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    @IBAction func doesntRecogBoth(_ sender: Any) {
        if agnosia_Left_DoesntRecognizeBoth.isSelected == true {
            agnosia_Left_DoesntRecognizeBoth.isSelected = false
        }
        else {
            agnosia_Left_DoesntRecognizeBoth.isSelected = true
            agnosia_Left_DoesntRecognizeArmImpairment.isSelected = false
            agnosia_Left_RecognizesBoth.isSelected = false
            
            //Aphasia buttons are off
            aphasia_Right_PerformsNeither.isSelected = false
            aphasia_Right_PerformsOne.isSelected = false
            aphasia_Right_PerfromsBoth.isSelected = false
            
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        
    }
    
    
    
    
    @IBAction func gazePresent(_ sender: Any) {
        if headGaze_present.isSelected == true {
            headGaze_present.isSelected = false
        }
        else {
            headGaze_present.isSelected = true
            headGaze_absent.isSelected = false
        }
        self.calculateRaceScore()
        self.updateSensitivites()
        updateSensitivites()
    }
    
    
    @IBAction func hemiParesisLeft(_ sender: Any) {
        
        if hemiparesis_Left.isSelected {
            
        }else {
            hemiparesis_Left.isSelected = true
            hemiparesis_Right.isSelected = false
            
            agnosiaView.isHidden = false
            aphasiaView.isHidden = true
            
            resultDescriptionLabel.text = "Ask the patient to:\n1) While showing them your arm, \"Whose arm is this?\"\n2) \"Can you lift both hands and clap?\""
            resultTitleLabel.text = "Agnosia"
            resultTitleLabel.backgroundColor = #colorLiteral(red: 0.8349413276, green: 0.3352985978, blue: 0.3409483433, alpha: 1)

            calculateRaceScore()
            updateSensitivites()
        }
    }
    
    
    @IBAction func hemiParesisRight(_ sender: Any) {
        if hemiparesis_Right.isSelected {
            
        }else {
            hemiparesis_Right.isSelected = true
            hemiparesis_Left.isSelected = false
            
            agnosiaView.isHidden = true
            aphasiaView.isHidden = false
            
            resultDescriptionLabel.text = "Instruct the patient to:\n1) \"Close your eyes.\"\n2) \"Make a fist.\""
            resultTitleLabel.text = "Aphasia"
            resultTitleLabel.backgroundColor = #colorLiteral(red: 0.2389388382, green: 0.5892125368, blue: 0.8818323016, alpha: 1)
            calculateRaceScore()
            updateSensitivites()
        }
        
     
    }
    
    
    //MARK: - calculation Race

    func calculateRaceScore () -> Void {
        count = 0
        
        guard let _ = aphasia_Right_PerformsNeither, let _ = aphasia_Right_PerfromsBoth, let _ = aphasia_Right_PerformsOne,let _ = agnosia_Left_DoesntRecognizeBoth, let _ = agnosia_Left_DoesntRecognizeArmImpairment, let _ = agnosia_Left_RecognizesBoth else {
            print ("aphasia or agnosia not selected")
            
            return}
        //Aphasia
        if aphasia_Right_PerfromsBoth.isSelected { count += 0 }
        if aphasia_Right_PerformsOne.isSelected { count += 1 }
        if aphasia_Right_PerformsNeither.isSelected { count += 2 }
        
       
        //Agnosia
        if agnosia_Left_RecognizesBoth.isSelected { count += 0 }
        if agnosia_Left_DoesntRecognizeArmImpairment.isSelected { count += 1 }
        if agnosia_Left_DoesntRecognizeBoth.isSelected { count += 2 }
        
        
        //What happens when the button is seleclted. Score will update with a value.
        //Facial Palsy
        if facialPalsy_normaltoMild.isSelected { count += 0 }
        if facialPalsy_Mild.isSelected { count += 1 }
        if facialPalsy_ModeratetoSevere.isSelected { count += 2 }

        // Arm Motor
        if armMotor_normaltoMild.isSelected { count += 0 }
        if armMotor_Mild.isSelected { count += 1 }
        if armMotor_ModeratetoSevere.isSelected { count += 2 }

        // Leg motor
        if legMotor_normaltoMild.isSelected { count += 0 }
        if legMotor_Mild.isSelected { count += 1 }
        if legMotor_ModeratetoSevere.isSelected { count += 2 }

        
        //Head Gaze
        
        if headGaze_absent.isSelected { count += 0 }
        if headGaze_present.isSelected { count += 1 }
        
      

    }
    
    func aphasiaAgnosiaCount() -> Void {
       
        guard let _ = aphasia_Right_PerformsNeither, let _ = aphasia_Right_PerfromsBoth, let _ = aphasia_Right_PerformsOne else {
            print ("aphasia not selected")
            
            return}
        //Aphasia
        if aphasia_Right_PerfromsBoth.isSelected { count += 0 }
        if aphasia_Right_PerformsOne.isSelected { count += 1 }
        if aphasia_Right_PerformsNeither.isSelected { count += 2 }
        
       
        
    }
    
    func agnosiaCount() {
        
        guard let _ = agnosia_Left_DoesntRecognizeBoth, let _ = agnosia_Left_DoesntRecognizeArmImpairment, let _ = agnosia_Left_RecognizesBoth else {
            print ("agnosia not selected")
            
            return}
    //Agnosia
    if agnosia_Left_RecognizesBoth.isSelected { count += 0 }
    if agnosia_Left_DoesntRecognizeArmImpairment.isSelected { count += 1 }
    if agnosia_Left_DoesntRecognizeBoth.isSelected { count += 2 }
    }
    
    func updateSensitivites() -> Void {
        switch count {
        
        case 1:
            sensitivityResultLabel.text = "100 %"
            specificityResultLabel.text = "13 %"
        case 2:
            sensitivityResultLabel.text = "97 %"
            specificityResultLabel.text = "27 %"
        case 3:
            sensitivityResultLabel.text = "93 %"
            specificityResultLabel.text = "40 %"
        case 4:
            sensitivityResultLabel.text = "89 %"
            specificityResultLabel.text = "55 %"
        case 5:
            sensitivityResultLabel.text = "85 %"
            specificityResultLabel.text = "68 %"
        case 6:
            sensitivityResultLabel.text = "72 %"
            specificityResultLabel.text = "77 %"
        case 7:
            sensitivityResultLabel.text = "53 %"
            specificityResultLabel.text = "89 %"
        case 8:
            sensitivityResultLabel.text = "32 %"
            specificityResultLabel.text = "95 %"
        case 9:
            sensitivityResultLabel.text = "7 %"
            specificityResultLabel.text = "99 %"

        default:
            break
        }
        
    }
   
}


