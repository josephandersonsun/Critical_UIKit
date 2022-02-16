//
//  CalculatedDataViewController.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 11/29/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit


public class CalculatedDataViewController: UIViewController {
    /// UIView References
    
  
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var presentedView: UIView!
    
    /// Button References
    @IBOutlet weak var adenosine_Button: UIButton!
    @IBOutlet weak var decadron_Button: UIButton!
    @IBOutlet weak var dopamine_Button: UIButton!
    @IBOutlet weak var amiodarone_Button: UIButton!
    @IBOutlet weak var atropine_Button: UIButton!
    @IBOutlet weak var epi_Button: UIButton!
    @IBOutlet weak var epiDrip_Button: UIButton!
    @IBOutlet weak var calcium_Button: UIButton!
    @IBOutlet weak var vasopressinBolus_Button: UIButton!
    @IBOutlet weak var lasix_Button: UIButton!
    @IBOutlet weak var vasopressinDrip_Button: UIButton!
    @IBOutlet weak var dextrose_Button: UIButton!
    @IBOutlet weak var bicarb_Button: UIButton!
    @IBOutlet weak var defib_Button: UIButton!
    @IBOutlet weak var cardene_Button: UIButton!
    @IBOutlet weak var dobutamine_Button: UIButton!
    @IBOutlet weak var lidocaine_Button: UIButton!
    @IBOutlet weak var labetalol_Button: UIButton!
    @IBOutlet weak var nitro_Button: UIButton!
    @IBOutlet weak var levophed_Button: UIButton!
    @IBOutlet weak var milrinone_Button: UIButton!
    @IBOutlet weak var benadryl_Button: UIButton!
    @IBOutlet weak var nipride_Button: UIButton!
    @IBOutlet weak var ketamine_Button: UIButton!
    @IBOutlet weak var versed_Button: UIButton!
    @IBOutlet weak var morphine_Button: UIButton!
    @IBOutlet weak var cardioversion_Button: UIButton!
    @IBOutlet weak var etomidate_Button: UIButton!
    @IBOutlet weak var propofol_Button: UIButton!
    @IBOutlet weak var fentanyl_Button: UIButton!
    @IBOutlet weak var ativan_Button: UIButton!
    @IBOutlet weak var precedex_Button: UIButton!
    @IBOutlet weak var albuterol_Button: UIButton!
    @IBOutlet weak var soluCortef_Button: UIButton!
    @IBOutlet weak var soluMedrol_Button: UIButton!
    @IBOutlet weak var albumin_Button: UIButton!
    @IBOutlet weak var magSulfate_Button: UIButton!
    @IBOutlet weak var narcan_Button: UIButton!
    @IBOutlet weak var fluidBolus_button: UIButton!
    @IBOutlet weak var rocuronium_Button: UIButton!
    @IBOutlet weak var vecuronium_Button: UIButton!
    @IBOutlet weak var Succinylcholine_Button: UIButton!
    @IBOutlet weak var nimbex_Button: UIButton!
    
    /// Label References
    
    @IBOutlet weak var age_Label: UILabel!
    @IBOutlet weak var broslowColorLabel: UILabel!
    @IBOutlet weak var pedDrugDose_Label: UILabel!
    @IBOutlet weak var ketamine_label: UILabel!
    @IBOutlet weak var epiLabel: UILabel!
    @IBOutlet weak var adenosineLabel: UILabel!
    @IBOutlet weak var nimbex_Label: UILabel!
    @IBOutlet weak var amiodaroneLabel: UILabel!
    @IBOutlet weak var labetalol_Label: UILabel!
    @IBOutlet weak var atropineLabel: UILabel!
    @IBOutlet weak var cardene_Label: UILabel!
    @IBOutlet weak var versedLabel: UILabel!
    @IBOutlet weak var albuterol_label: UILabel!
    @IBOutlet weak var albumin_label: UILabel!
    @IBOutlet weak var etomidate_label: UILabel!
    @IBOutlet weak var hydrocortisone_label: UILabel!
    @IBOutlet weak var lidocaine_label: UILabel!
    @IBOutlet weak var magnesiumSulfate_Label: UILabel!
    @IBOutlet weak var soluMedrol_Label: UILabel!
    @IBOutlet weak var vecuronium_Label: UILabel!
    @IBOutlet weak var Succinylcholine_Label: UILabel!
    @IBOutlet weak var rocuronium_Label: UILabel!
    @IBOutlet weak var milrinone_Label: UILabel!
    @IBOutlet weak var nitroglycerine_Label: UILabel!
    @IBOutlet weak var nipride_Label: UILabel!
    @IBOutlet weak var levophed_Label: UILabel!
    @IBOutlet weak var bicarb_Label: UILabel!
    @IBOutlet weak var vasopressin_Label: UILabel!
    @IBOutlet weak var propofol_Label: UILabel!
    @IBOutlet weak var lorazepam_Label: UILabel!
    @IBOutlet weak var precedex_Label: UILabel!
    @IBOutlet weak var lasix_Label: UILabel!
    @IBOutlet weak var cardioversion_Label: UILabel!
    @IBOutlet weak var defibrillation_Label: UILabel!
    @IBOutlet weak var narcan_Label: UILabel!
    @IBOutlet weak var benadryl_Label: UILabel!
    @IBOutlet weak var fentanyl_Label: UILabel!
    @IBOutlet weak var morphine_Label: UILabel!
    @IBOutlet weak var normalSalineBolus_Label: UILabel!
    @IBOutlet weak var sodiumBicarbonate_Label: UILabel!
    @IBOutlet weak var glucose_Label: UILabel!
    @IBOutlet weak var calciumChloride_Label: UILabel!
    @IBOutlet weak var decardron_Label: UILabel!
    
    
    
    /// Drip Clculations
    
    //@IBOutlet weak var   amiodaroneDrip_Label: UILabel!
    @IBOutlet weak var vasopressin_Drip_Label: UILabel!
    @IBOutlet weak var dopamineDrip_Label: UILabel!
    @IBOutlet weak var dobutamineDrip_Label: UILabel!
    @IBOutlet weak var epinephrineDrip_Label: UILabel!
    //@IBOutlet weak var   lidocaineDrip_Label: UILabel!
    
    
    @IBOutlet weak var topDescriptionLabel: UILabel!
    @IBOutlet weak var inYears: UILabel!
    
    
    // Non-calculated measures
    
    @IBOutlet weak var bloodPressure_Label: UILabel!
    @IBOutlet weak var pulse_Label: UILabel!
    @IBOutlet weak var respiratoryRate_Label: UILabel!
    @IBOutlet weak var ettCuffed_Label: UILabel!
    @IBOutlet weak var centralLineFemoral: UILabel!
    @IBOutlet weak var suctionCathSize_Label: UILabel!
    @IBOutlet weak var ngTubeSize_Label: UILabel!
    @IBOutlet weak var chestTube_Label: UILabel!
    @IBOutlet weak var ettUncuffed_Label: UILabel!
    @IBOutlet weak var foleyCath_Label: UILabel!
    @IBOutlet weak var oralAirway_Label: UILabel!
    @IBOutlet weak var laryngescopeBlade_Label: UILabel!
    
    
    //VentSettings
    @IBOutlet weak var tidalVolume_Label: UILabel!
    @IBOutlet weak var respRate_Label: UILabel!
    @IBOutlet weak var peep_Label: UILabel!
    @IBOutlet weak var additionalVentilatorText_Label: UILabel!
    
    
    //MARK: Global Variables
    public var name: String?
    public var weightEntered: Double?
    
    
    //MARK: ViewDidLoad
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounds the corner of the buttons
        //adenosine_Button.layer.cornerRadius = 4
        //decadronButton.layer.cornerRadius = 4
        
        // Rounds the corners of the View
        presentedView.clipsToBounds = true
        presentedView.layer.cornerRadius = 5
        
        /// Masks the corners of the bottom if not commented.
        //presentedView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        // if let nameToDisplay = name {
        // dataLabel.text = nameToDisplay }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.presentedView.frame.size.height = 300
        })
        
        // Runs all of the calculated functions in the PedsCalc method.
        PedCalc()
        
    }
    
    
    
    //MARK: Calculates 1 Dose
    func calculateDoseOne (Dose: Double)-> String {
        
        // Takes the weightEntered entered in the textField and uses it in the function
        let patientWeight = weightEntered
        
        let result = "\(patientWeight! * Dose)"
        return result
        //return String(format: "%.0f", result) as String
    }
    
    //MARK: Calculates 2 Dose range as INT
    
    func calculateDoseOne_Int (Dose: Double)-> String {
        
        // Takes the weightEntered entered in the textField and uses it in the function
        let patientWeight = weightEntered
        
        return "\(Int(patientWeight! * Dose))"
    }
    
    
    //MARK: Calculates 2 Dose Range
    
    func calculateDoseTwo (DoseMin: Double, _DoseMax: Double)-> String {
        
        // Takes the weightEntered entered in the textField and uses it in the function
        //        var patientWeight = weightEntered
        
        return "\(weightEntered! * DoseMin) - \(weightEntered! * _DoseMax)"
    }
    
    
 
    
    //MARK: Peds Calculation Function
    func  PedCalc() {
        
        
        /// Closure When calculation has one value to be multiplied
        let doseRange1 = {(initialDose: Double, range1: Double) -> (String) in
            let initialDose = self.weightEntered
            
            return "\(initialDose! * range1)"
        }
        
        /// When calculation has two values to be multiplied
        
        let doseRange2 = {(initialDose: Double, FollowingDose: Double, range1: Double, range2: Double) -> String in
            let initialDose = self.weightEntered
            let FollowingDose = self.weightEntered
            return "\(initialDose! * range1)-\(FollowingDose! * range2)"
        }
        
  
        
        //MARK: Calculates Age from the Weight entered
        
        func approximateAgeFromWeight (weight: Double)-> String {
            
            let weight = weightEntered
            
            //            while weightEntered! < 1.0 {
            //                weight! /=  100.0}
            
            /// To calculate age under 1yr =  2(kg) - 9
            let age: Int = Int(2 * weight!) - 9
            
            if age < 1 {
                
                print("Newborn displayed because the age is less than 1 month")
                return "Newborn"
            } else if age == 1 {
                return "Expected age at \(weight!) kgs is approx. \(Int(age)) month old."
            }
            return "Expected age at \(weight!) kgs is approx. \(Int(age)) months old."
            
        }
        //return "The approximate age at \(weight!)kgs is \(age) months"
        
      
        //MARK: Calculate the patient's age from weight 1 – 5
        func approximateAgeFromWeight_1_5 (weight: Double)-> String {
            
            let weight = weightEntered
            /// To calculate age alPlacesunder 1yr =  2(kg) - 9
            let age = (weight! / 2) - 5
            // If the age is less than 1 month, then we'll pring newborn.
            
            if age == 1 {
                
                return "The expected age at \(weight!) kgs is approx. \(Int(age)) yr. old."
                
            } else {
                
                return "The expected age at \(weight!) kgs is approx. \(Int(age)) y/o."
            }
            
        }
        
        
        //MARK: Calculate the patient's age from weight 5 to 14
        func approximateAgeFromWeight_5_14 (weight: Double)-> String {
            
            let weight = weightEntered
            
            /// To calculate age over 5yr = (weight! / 4)
            let age = (weight! / 4)
        
            return "The age at \(weight!) kgs is approx. \(Int(age)) y/o."
        }
        
    
        //MARK: Drug Dosage Calculations
        
        let calculation = weightEntered    /// The number value entered in the textField
        
        // Calculates the conversion from kgs to Lbs
        let pounds = "\(calculation! * 2.2) lbs"
        
        //Drug Calculations done below
        
        let adenosine1 = doseRange2(weightEntered!, weightEntered!, 0.1, 0.2) + "mg"
        
        let lorazepam = calculateDoseOne(Dose: 0.1) + "mg"
        
        let albumin = calculateDoseTwo(DoseMin: 10, _DoseMax: 20) + "mL's"
        
        let albuterol = calculateDoseOne(Dose: 0.5) + "mg"
        
        let amiodarone = calculateDoseOne(Dose: 5) + "mg"
        //5 mg/kg IV/IO (Max dose 300 mg) bolus for VF / pulseless VT or infuse over 20 - 60 min for a perfusing tachycardia
        
        let atropine = calculateDoseOne(Dose: 0.02 ) + "mg"
        //0.02 mg/kg IV; use 0.04 mg/kg IM/ET IV, Max: 1 mg IV
        
        let bicarb = calculateDoseOne(Dose: 1) + "mEq"
        //1 mEq/kg IV
        
        let  calciumChloride = calculateDoseOne(Dose: 20) + "mg"
        
        let cardioversion = calculateDoseTwo(DoseMin: 0.5, _DoseMax: 1) + "J⚡️"
        
        let defibrillation = calculateDoseTwo(DoseMin: 2 , _DoseMax: 4) + "J⚡️"
        
        let dexamethasone = calculateDoseOne(Dose: 0.6) + "mg"
        
        let glucose = "\(calculation! * 0.5) to \(calculation! * 1) g/kg \n D25: \(calculation! * 2) - \(calculation! * 4) mL's'     D10: \(calculation! * 5) - \(calculation! * 10) mL's"
        
        let benadryl = calculateDoseTwo(DoseMin: 1, _DoseMax: 2) + "mg"
        
        let dobutamineGtt = calculateDoseTwo(DoseMin: 2, _DoseMax: 20) + " mcg/min"
        
        let dopamineGtt = calculateDoseTwo(DoseMin: 2, _DoseMax: 20) + " mcg/min"
        
        let epi = calculateDoseOne(Dose: 0.01) + "mg"
        
        let epiDrip = calculateDoseTwo(DoseMin: 0.05, _DoseMax: 1) + "mcg"
        
        let ketamine = calculateDoseTwo(DoseMin: 1, _DoseMax: 2) + "mg"
        
        let etomidate = calculateDoseOne(Dose: 0.3) + "mg"
        
        let fentanyl = calculateDoseOne(Dose: 1) + "mcg"
        
        let hydrocortison = calculateDoseOne(Dose: 2) + "mg"
        
        let lidocaine = calculateDoseOne(Dose: 1) + "mg"
        
        let lasix = calculateDoseOne(Dose: 1) + "mg"
        // 1 mg per kilogram
        
        let magnesiumSulfate = calculateDoseTwo(DoseMin: 20, _DoseMax: 50) + "mg"
        // 20 to 50 mg/kg
        let morphine = calculateDoseTwo(DoseMin: 0.1, _DoseMax: 0.2) + " mg"
        // 0.1 to 0.2 mg/kg
        let soluMedrol = calculateDoseOne(Dose: 2) + "mg"
        // 2 mg per kilogram
        let milrinone = calculateDoseTwo(DoseMin: 0.25, _DoseMax: 0.75) + "mcg"
        
        let narcan = calculateDoseOne(Dose: 0.1) + "mg"
        // 0.1 mg/kg
        let nitroglycerine = calculateDoseTwo(DoseMin: 0.25, _DoseMax: 3) + "mcg"
        
        let propofol = calculateDoseTwo(DoseMin: 2.5, _DoseMax: 3.5) + "mcg"
        ///Calculated at 2.5 -3.5 mg/kg
        
        let normalSalineBolus = calculateDoseOne(Dose: 20) + "mL's"
        //"\(calculation! * 20) mL's "
        
        let nipride = calculateDoseTwo(DoseMin: 0.3, _DoseMax: 8) + "mcg"
        
        let levophed = calculateDoseTwo(DoseMin: 0.1, _DoseMax: 2) + "mcg/min"
        
        let vasopressin = calculateDoseTwo(DoseMin: 0.5 , _DoseMax: 1 ) + "units"
        
        let vasopressin_Drip = calculateDoseTwo(DoseMin: 0.018, _DoseMax: 0.12) + "units/hr"
        
        let versed = calculateDoseOne(Dose: 0.1) + "mg"
        
        let labetalol = calculateDoseTwo(DoseMin: 1, _DoseMax: 2) + "mg"
        
        let cardene = calculateDoseTwo(DoseMin: 0.25, _DoseMax: 5) + " mcg/min"
        
        let precedex = calculateDoseTwo(DoseMin: 0.2, _DoseMax: 0.6) + "mcg"
        
        let vecuronium = calculateDoseOne(Dose: 0.1) + "mg"
        
        let rocuronium = calculateDoseTwo(DoseMin: 0.6, _DoseMax: 1.2) + "mg"
        
        let Succinylcholine = calculateDoseTwo(DoseMin: 1, _DoseMax: 2) + "mg"
        
        let nimbex = calculateDoseTwo(DoseMin: 0.1, _DoseMax: 0.3) + "mg"
        
        let tidalVolume = "\(Int(calculation! * 8)) - \(Int(calculation! * 12)) cc's"
        
        let neonatetidalVolume = calculateDoseTwo(DoseMin: 4, _DoseMax: 6) + " cc's"
        
        
        
        //MARK: Guard function during the calculations.
        guard let myCalculations = weightEntered , myCalculations < 80.0,  myCalculations > 0.001  else {
            
            
            print("Cannot process because weight out of normal parameters")
            
            // Top label changes, capitalizes it and the color as well
            topDescriptionLabel.text = "Enter a value under 80 kgs".uppercased()
            age_Label.text = ""
            
            topDescriptionLabel.textColor = FlatColor.BackgroundColor.Red.toUIColor()
            
            // Changes the text and text color and capitalizes the text as well.
            inYears.text = "< 80 kgs".uppercased()
            inYears.textColor = FlatColor.BackgroundColor.Red.toUIColor()
            
            // Changing  the color of the views.
            mainView.backgroundColor = FlatColor.BackgroundColor.Black.toUIColor()
            pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Black.toUIColor()
            broslowColorLabel.text = "Enter Value"
            
            //Makes all of the labels blank
            albuterol_label.text = String()
            albumin_label.text = String()
            epiLabel.text = String()
            adenosineLabel.text = String()
            amiodaroneLabel.text = String()
            atropineLabel.text = String()
            defibrillation_Label.text = String()
            cardioversion_Label.text = String()
            versedLabel.text = String()
            glucose_Label.text = String()
            benadryl_Label.text = String()
            calciumChloride_Label.text = String()
            decardron_Label.text = String()
            benadryl_Label.text = String()
            dobutamineDrip_Label.text = String()
            epinephrineDrip_Label.text = String()
            fentanyl_Label.text = String()
            versedLabel.text = String()
            dopamineDrip_Label.text = String()
            etomidate_label.text = String()
            hydrocortisone_label.text = String()
            lidocaine_label.text = String()
            morphine_Label.text = String()
            magnesiumSulfate_Label.text = String()
            narcan_Label.text = String()
            normalSalineBolus_Label.text = String()
            soluMedrol_Label.text = String()
            milrinone_Label.text = String()
            nitroglycerine_Label.text = String()
            nipride_Label.text = String()
            levophed_Label.text = String()
            bicarb_Label.text = String()
            vasopressin_Label.text = String()
            ketamine_label.text = String()
            lorazepam_Label.text = String()
            lasix_Label.text = String()
            propofol_Label.text = String()
            labetalol_Label.text = String()
            cardene_Label.text = String()
            
            /// HIDE THE BUTTONS
            
            adenosine_Button.isHidden = true
            decadron_Button.isHidden = true
            dopamine_Button.isHidden = true
            amiodarone_Button.isHidden = true
            atropine_Button.isHidden = true
            epi_Button.isHidden = true
            epiDrip_Button.isHidden = true
            calcium_Button.isHidden = true
            vasopressinBolus_Button.isHidden = true
            vasopressinDrip_Button.isHidden = true
            dextrose_Button.isHidden = true
            bicarb_Button.isHidden = true
            cardene_Button.isHidden = true
            dobutamine_Button.isHidden = true
            lidocaine_Button.isHidden = true
            labetalol_Button.isHidden = true
            nitro_Button.isHidden = true
            levophed_Button.isHidden = true
            milrinone_Button.isHidden = true
            benadryl_Button.isHidden = true
            nipride_Button.isHidden = true
            ketamine_Button.isHidden = true
            versed_Button.isHidden = true
            morphine_Button.isHidden = true
            etomidate_Button.isHidden = true
            propofol_Button.isHidden = true
            fentanyl_Button.isHidden = true
            ativan_Button.isHidden = true
            precedex_Button.isHidden = true
            albuterol_Button.isHidden = true
            soluCortef_Button.isHidden = true
            soluMedrol_Button.isHidden = true
            albumin_Button.isHidden = true
            magSulfate_Button.isHidden = true
            narcan_Button.isHidden = true
            fluidBolus_button.isHidden = true
            lasix_Button.isHidden = true
            defib_Button.isHidden = true
            precedex_Button.isHidden = true
            vasopressinDrip_Button.isHidden = true
            cardene_Button.isHidden = true
            nimbex_Button.isHidden = true
            vecuronium_Button.isHidden = true
            rocuronium_Button.isHidden = true
            Succinylcholine_Button.isHidden = true
            
            return
        }
        //MARK: GUARD CODE TO INITIATE IF VALID
        // if its not nil, then execute the following code.
        topDescriptionLabel.text = "\(calculation!) kgs or \(pounds)";
        albuterol_label.text = albuterol
        albumin_label.text = albumin
        epiLabel.text = epi
        adenosineLabel.text = adenosine1
        amiodaroneLabel.text = amiodarone
        atropineLabel.text = atropine
        defibrillation_Label.text = defibrillation
        cardioversion_Label.text = cardioversion
        versedLabel.text = versed
        glucose_Label.text = glucose
        benadryl_Label.text = benadryl
        calciumChloride_Label.text = calciumChloride
        decardron_Label.text = dexamethasone
        benadryl_Label.text = benadryl
        dobutamineDrip_Label.text = dobutamineGtt
        epinephrineDrip_Label.text = epiDrip
        fentanyl_Label.text = fentanyl
        versedLabel.text = versed
        dopamineDrip_Label.text = dopamineGtt
        etomidate_label.text = etomidate
        hydrocortisone_label.text = hydrocortison
        lidocaine_label.text = lidocaine
        morphine_Label.text = morphine
        magnesiumSulfate_Label.text = magnesiumSulfate
        narcan_Label.text = narcan
        normalSalineBolus_Label.text = normalSalineBolus
        soluMedrol_Label.text = soluMedrol
        milrinone_Label.text = milrinone
        nitroglycerine_Label.text = nitroglycerine
        nipride_Label.text = nipride
        levophed_Label.text = levophed
        bicarb_Label.text = bicarb
        vasopressin_Label.text = vasopressin
        ketamine_label.text = ketamine
        lorazepam_Label.text = lorazepam
        lasix_Label.text = lasix
        propofol_Label.text = propofol
        labetalol_Label.text = labetalol
        cardene_Label.text = cardene
        vasopressin_Drip_Label.text = vasopressin_Drip
        precedex_Label.text = precedex
        vecuronium_Label.text = vecuronium
        rocuronium_Label.text = rocuronium
        Succinylcholine_Label.text = Succinylcholine
        nimbex_Label.text = nimbex
        tidalVolume_Label.text = tidalVolume
        
        
        //MARK: Switch on weight range
        /* Condition statement if weight falls within a certain range, Execute non weight based functions.
         */
        if let weighValue = weightEntered {
            
            switch weighValue {
                
            //MARK: 0-2 KG
            case 0...2.9:
                print(approximateAgeFromWeight(weight: weighValue))
                print("Premature, Gray")
                
                //Changes the background color according to the broslow tape recommendations
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "GRAY"
                
                //Background colors are changed
                mainView.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                
                // Convert to grams becayse the baby is too small
                topDescriptionLabel.text = " \(Int (calculation! * 1000)) grams or \(pounds)"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight(weight: weighValue)
                
                // Displays Premature in the label
                inYears.text = PediatricEquipment.Premature.Years.rawValue
                
                //Vital Signs
                bloodPressure_Label.text = PediatricEquipment.Premature.BloodPressure.rawValue
                pulse_Label.text = PediatricEquipment.Premature.Pulse.rawValue
                respiratoryRate_Label.text = PediatricEquipment.Premature.RespRate.rawValue
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Premature.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Premature.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Premature.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Premature.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Premature.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Premature.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Premature.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Premature.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Premature.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Premature.PEEP.rawValue
                
                // Since this is a neonatal weight, we'll display a neonatal TV as well.
                additionalVentilatorText_Label.text = "Neonate: \(neonatetidalVolume). Avoid PIP > 40"
                
                
                
                // Changes the color of the buttons to reflect the broslow tape.
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                
                
                
            //MARK: 3-5 KG. Up to 6 kg
            case 3...5.9: // Term Newborn
                print("Premature, Gray, 3-5")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "GRAY"
                inYears.text = PediatricEquipment.Term.Years.rawValue
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight(weight: weighValue)
                print(approximateAgeFromWeight(weight: weighValue))
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Term.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Term.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Term.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Term.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Term.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Term.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Term.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Term.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Term.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Term.PEEP.rawValue
                
                // Since this is a neonatal weight, we'll display a neonatal TV as well.
                additionalVentilatorText_Label.text = "Neonate: \(neonatetidalVolume). Avoid PIP > 40"
                
                // Changes the color of the buttons to Gray.
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Gray.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                
                
                
                
            //MARK: 6-7 KG
            case 6...7.9: // Small Infant
                print("Small Infant, Pink, 6-8")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "PINK"
                inYears.text = "Small Infant"
                
                //Calculates the approx. age from weight
                print(approximateAgeFromWeight(weight: weighValue))
                age_Label.text = approximateAgeFromWeight(weight: weighValue)
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.SmallInfant.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.SmallInfant.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.SmallInfant.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.SmallInfant.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.SmallInfant.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.SmallInfant.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.SmallInfant.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.SmallInfant.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.SmallInfant.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.SmallInfant.PEEP.rawValue
                additionalVentilatorText_Label.text = "Neonate: \(neonatetidalVolume). Avoid PIP > 40"
                
                
                // Changes the color of the buttons to pink.
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Pink.toUIColor()
                
            //MARK: 8-9 KG
            case 8...9.9: //Infant
                
                print("Infant, Red Color, 8-10 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                
                inYears.text = "Infant"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "RED"
                
                
                //Calculates the approx. age from weight
                print(approximateAgeFromWeight(weight: weighValue))
                age_Label.text = approximateAgeFromWeight(weight: weighValue)
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Infant.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Infant.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Infant.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Infant.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Infant.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Infant.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Infant.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Infant.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Infant.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Infant.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40"
                
                
                // Changes the color of the buttons to red.
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                
                
            //MARK: 10-11 KG
            case 10...11.9: //Toddler
                
                print("Toddler, Purple Color, 10-12 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                inYears.text = "Toddler"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "PURPLE"
                
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight(weight: weighValue)
                print(approximateAgeFromWeight(weight: weighValue))
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Toddler.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Toddler.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Toddler.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Toddler.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Toddler.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Toddler.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Toddler.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Toddler.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Toddler.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Toddler.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                // Changing the button color to Purple
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Purple.toUIColor()
                
                
                
            //MARK: 12-15 kgs
            case 12...14.9: //Small child
                
                print("Small Child, Yellow Color, 12-15 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                inYears.text = "Small child"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "YELLOW"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_1_5(weight: weighValue)
                print(approximateAgeFromWeight_1_5(weight: weighValue))
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.SmallChild.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.SmallChild.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.SmallChild.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.SmallChild.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.SmallChild.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.SmallChild.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.SmallChild.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.SmallChild.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.SmallChild.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.SmallChild.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                
                
                
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Yellow.toUIColor()
                
            // MARK: 15-18 kg's
            case 15...18.9: //Child
                
                print("Child, White Color, 15-18 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.White.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.White.toUIColor()
                pedDrugDose_Label.textColor = UIColor.black
                inYears.text = "Child"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "WHITE"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.textColor = FlatColor.BackgroundColor.Black.toUIColor()
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_1_5(weight: weighValue)
                print(approximateAgeFromWeight_1_5(weight: weighValue))
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Child_15_18.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Child_15_18.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Child_15_18.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Child_15_18.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Child_15_18.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Child_15_18.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Child_15_18.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Child_15_18.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Child_15_18.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Child_15_18.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                
                
                /// Changing the button color to Midnight Blue
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Midnight.toUIColor()
                
            //MARK: 19-23 kg's
            case 19...23.9: //Child
                
                print("Child, Blue Color, 19-23 kg")

                mainView.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                inYears.text = "Child"
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "BLUE"
                
                //Calculates the approx. age from weight
                /// If the weight is between 19 - 20 kgs we'll use the other formula for the case.
                if (weighValue >= 19.0) && (weighValue <= 20.0) {
                    print (approximateAgeFromWeight_1_5(weight: weighValue))
                    age_Label.text = approximateAgeFromWeight_1_5(weight: weighValue)
                } else {
                    age_Label.text = approximateAgeFromWeight_5_14(weight: weighValue)
                    print (approximateAgeFromWeight_5_14(weight: weighValue))
                }
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Child_19_23.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Child_19_23.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Child_19_23.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Child_19_23.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Child_19_23.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Child_19_23.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Child_19_23.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Child_19_23.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Child_19_23.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Child_19_23.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
              
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Blue.toUIColor()
                
                
            //MARK: 24-29 kg's
            case 24...29.9: //Large child
                
                print("Large Child, Orange Color, 24-30 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                inYears.text = "Large child"
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "ORANGE"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_5_14(weight: weighValue)
                print (approximateAgeFromWeight_5_14(weight: weighValue))
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.LargeChild.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.LargeChild.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.LargeChild.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.LargeChild.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.LargeChild.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.LargeChild.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.LargeChild.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.LargeChild.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.LargeChild.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.LargeChild.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                
                
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Orange.toUIColor()
                
            //MARK: 30-36 kg's
            case 30...36.9: // Adult
                
                print("Adult, Green Color, 30-37 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                inYears.text = "Adult"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_5_14(weight: weighValue)
                print (approximateAgeFromWeight_5_14(weight: weighValue))
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "GREEN"
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.Adult.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.Adult.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.Adult.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.Adult.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.Adult.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.Adult.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.Adult.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.Adult.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.Adult.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.Adult.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                
                
            //MARK: 40-50 kg's
            case 40...50: // Large Adult 40
                
                print("Adult, Green Color, 40-50 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                inYears.text = "Adult"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_5_14(weight: weighValue)
                print (approximateAgeFromWeight_5_14(weight: weighValue))
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "GREEN"
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.LargeAdult40.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.LargeAdult40.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.LargeAdult40.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.LargeAdult40.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.LargeAdult40.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.LargeAdult40.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.LargeAdult40.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.LargeAdult40.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.LargeAdult40.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.LargeAdult40.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                // cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                
                
                
            //MARK: 50-80 kg's
            case 50...80: // Large Adult 50
                print("Adult, Green Color, 50-80 kg")

                //Changes the background color according to the broslow tape recommendations
                mainView.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                pedDrugDose_Label.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                inYears.text = "Adult"
                
                //Calculates the approx. age from weight
                age_Label.text = approximateAgeFromWeight_5_14(weight: weighValue)
                print (approximateAgeFromWeight_5_14(weight: weighValue))
                
                //Change the label name to reflect broslow color
                broslowColorLabel.text = "GREEN"
                
                
                //Equipment
                oralAirway_Label.text = PediatricEquipment.LargeAdult50.OralAirway.rawValue
                centralLineFemoral.text = PediatricEquipment.LargeAdult50.CentralLineFemoral.rawValue
                ettUncuffed_Label.text = PediatricEquipment.LargeAdult50.ETTSizeUnCuffed.rawValue
                ettCuffed_Label.text = PediatricEquipment.LargeAdult50.ETTSizeCuffed.rawValue
                suctionCathSize_Label.text = PediatricEquipment.LargeAdult50.SuctionCathSize.rawValue
                ngTubeSize_Label.text = PediatricEquipment.LargeAdult50.NGTubeSize.rawValue
                foleyCath_Label.text = PediatricEquipment.LargeAdult50.FoleyCathSize.rawValue
                chestTube_Label.text = PediatricEquipment.LargeAdult50.ChestTubeSize.rawValue
                
                tidalVolume_Label.text = tidalVolume
                respRate_Label.text = PediatricEquipment.LargeAdult50.RespiratoryVentRate.rawValue
                peep_Label.text = PediatricEquipment.LargeAdult50.PEEP.rawValue
                additionalVentilatorText_Label.text = "Avoid PIP > 40 cmH20"
                
                //Change the color of the buttons to reflect broslow weight color
                adenosine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                decadron_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dopamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                amiodarone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                atropine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epi_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                epiDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                calcium_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinBolus_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                vasopressinDrip_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dextrose_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                bicarb_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                cardene_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                dobutamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lidocaine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                labetalol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nitro_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                levophed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                milrinone_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                benadryl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                nipride_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ketamine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                versed_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                morphine_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                etomidate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                propofol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fentanyl_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                ativan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                precedex_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albuterol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluCortef_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                soluMedrol_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                albumin_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                magSulfate_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                narcan_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                fluidBolus_button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                lasix_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                defib_Button.backgroundColor = FlatColor.BackgroundColor.Red.toUIColor()
                //cardioversion_Button.backgroundColor = FlatColor.BackgroundColor.Green.toUIColor()
                
            default:
                break
            }
        }
    }
    
    
    
    //MARK: UIAlert
    func sendALERT() {
        _ = SCLAlertView().showError("Error!", subTitle:"Enter a weight greater than zero, and less than 80 kgs to calculate.", closeButtonTitle:"Got it")
        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
        
    }
    
    @IBAction func adnosineButtonPressed(_ sender: Any) {
        
    }
    @IBAction func closeTheSheet(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    //MARK: PASS DATA SEGUE
    ///PASSING DATA TO MINIDRUG VIEW CONTROLLER FROM CALCULATIONS
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        ///// Checks the segue destination, grabs the weightEntered value from the textfield and passes the data.
        
        ///MARK: Drug Info Language
        
        //MARK: Adenosine
        if segue.identifier == "Adenosine" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = adenosine_Button!.currentTitle!
                MiniDrugVC.drugInfo = DrugInformation.Adenosine.executeDrugInfoDescription()
                MiniDrugVC.drugClass = DrugClass.Adenosine.executeDrugClassDescription()
                print("Adenosine was selected")
                
            }
            //MARK: Decadron
        } else if segue.identifier == "Decadron" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = decadron_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Decardon.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Decadron.executeDrugInfoDescription()
                print("Decadron was selected")
                
            }//MARK: Dopamine
        } else if segue.identifier == "Dopamine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = dopamine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Dopamine.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Dopamine.executeDrugInfoDescription()
                print("Dopamine was selected")
                
            } //MARK: Amiodarone
        } else if segue.identifier == "Amiodarone" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = amiodarone_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Amiodarone.executeDrugClassDescription()
                MiniDrugVC.drugInfo =  DrugInformation.Amiodarone.executeDrugInfoDescription()
                print("Amiodarone was selected")
                
            } //MARK: Atropine
        } else if segue.identifier == "Atropine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = atropine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Atropine.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Atropine.executeDrugInfoDescription()
                print("Atropine was selected")
                
            }//MARK: Bicarb
        } else if segue.identifier == "Bicarb" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = bicarb_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Bicarb.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Bicarb.executeDrugInfoDescription()
                print("Bicarb was selected")
                
            }//MARK: Dextrose
        } else if segue.identifier == "Dextrose" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = dextrose_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Dextrose.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Dextrose.executeDrugInfoDescription()
                print("Dextrose was selected")
                
            }//MARK: Calcium
        } else if segue.identifier == "Calcium" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = calcium_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Calcium.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Calcium.executeDrugInfoDescription()
                print("Calcium was selected")
                
            }//MARK: Lidocaine
        } else if segue.identifier == "Lidocaine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = lidocaine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Lidocaine.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Lidocaine.executeDrugInfoDescription()
                print("Lidocaine was selected")
                
            }//MARK:Defib
        } else if segue.identifier == "Defibrillation" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = defib_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Defibrillation.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Defibrillation.executeDrugInfoDescription()
                print("Defibrillation was selected")
                
            }//MARK:Cardioversion
        } else if segue.identifier == "SyncCardioversion" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = cardioversion_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.SyncCardioversion.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.SyncCardioversion.executeDrugInfoDescription()
                print("SyncCardioversion was selected")
                
            }//MARK: Epi
        } else if segue.identifier == "Epi" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = epi_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Epi.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Epi.executeDrugInfoDescription()
                print("Epi was selected")
                
            }//MARK: Cardene
        } else if segue.identifier == "Cardene" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = cardene_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Cardene.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Cardene.executeDrugInfoDescription()
                print("Cardene was selected")
                
            }//MARK:Levophed
        } else if segue.identifier == "Levophed" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = levophed_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Levophed.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Levophed.executeDrugInfoDescription()
                print("Levophed was selected")
                
            }//MARK: Milrinone
        } else if segue.identifier == "Milrinone" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = milrinone_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Milrinone.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Milrinone.executeDrugInfoDescription()
                print("Milrinone was selected")
                
            }///MARK:Nitro
        } else if segue.identifier == "Nitro" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = nitro_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Nitro.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Nitro.executeDrugInfoDescription()
                print(" Nitro was selected")
                
            }//MARK:Nipride
        } else if segue.identifier == "Nipride" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = nipride_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Nipride.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Nipride.executeDrugInfoDescription()
                print("Nipride was selected")
                
            }//MARK:Vasopressin
        } else if segue.identifier == "Vasopressin" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = vasopressinBolus_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Vasopressin.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Vasopressin.executeDrugInfoDescription()
                print("Vasopressin was selected")
                
            }
            //MARK:VasopressinDrip
        } else if segue.identifier == "VasopressinDrip" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = vasopressinDrip_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Vasopressin.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Vasopressin.executeDrugInfoDescription()
                print("VasopressinDrip was selected")
                
            }//MARK:Etomidate
        } else if segue.identifier == "Etomidate" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = etomidate_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Etomidate.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Etomidate.executeDrugInfoDescription()
                print("Etomidate was selected")
                
            }//MARK:Ativan
        } else if segue.identifier == "Ativan" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = ativan_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Ativan.executeDrugClassDescription()
                MiniDrugVC.drugInfo = DrugInformation.Ativan.executeDrugInfoDescription()
                print("Ativan was selected")
                
            }//MARK:Morphine
            
        } else if segue.identifier == "Morphine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = morphine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Morphine.executeDrugClassDescription()
                MiniDrugVC.drugInfo =  DrugInformation.Morphine.executeDrugInfoDescription()
                print("Morphine was selected")
                
            }//MARK:Fentanyl
        } else if segue.identifier == "Fentanyl" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = fentanyl_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Fentanyl.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Fentanyl.executeDrugInfoDescription()
                print("Fentanyl was selected")
                
            }//MARK:Precedex
        } else if segue.identifier == "Precedex" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = precedex_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Precedex.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Precedex.executeDrugInfoDescription()
                print("Precedex was selected")
                
            }//MARK:Versed
        }  else if segue.identifier == "Versed" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = versed_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Versed.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Versed.executeDrugInfoDescription()
                print("Versed was selected")
                
            }//MARK:Ketamine
        } else if segue.identifier == "Ketamine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = ketamine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Ketamine.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Ketamine.executeDrugInfoDescription()
                print("Ketamine was selected")
                
            }//MARK:FluidBolus
        } else if segue.identifier == "FluidBolus" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = fluidBolus_button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.FluidBolus.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.FluidBolus.executeDrugInfoDescription()
                print("FluidBolus was selected")
                
            }//MARK:Albuterol
        } else if segue.identifier == "Albuterol" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = albuterol_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Albuterol.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Albuterol.executeDrugInfoDescription()
                print("Albuterol was selected")
                
            }//MARK:Albumin
        } else if segue.identifier == "Albumin" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = albumin_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Albumin.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Albumin.executeDrugInfoDescription()
                print("Albumin was selected")
                
            }//MARK:Benadryl
        } else if segue.identifier == "Benadryl" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = benadryl_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Benadryl.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Benadryl.executeDrugInfoDescription()
                print("Benadryl was selected")
                
            }//MARK:SoluCortef
        } else if segue.identifier == "SoluCortef" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = soluCortef_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.SoluCortef.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.SoluCortef.executeDrugInfoDescription()
                print("Solu Cortef was selected")
                
            }//MARK:MagSulfate
        }else if segue.identifier == "MagSulfate" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = magSulfate_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.MagSulfate.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.MagSulfate.executeDrugInfoDescription()
                print("MagSulfate was selected")
                
            }//MARK: SoluMedrol
        }else if segue.identifier == "SoluMedrol" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = soluMedrol_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.SoluMedrol.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.SoluMedrol.executeDrugInfoDescription()
                print("SoluMedrol was selected")
                
            } //MARK: Narcan
        }else if segue.identifier == "Narcan" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = narcan_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Narcan.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Narcan.executeDrugInfoDescription()
                print("Narcan was selected")
                
            } // MARK: Lasix
        }else if segue.identifier == "Lasix" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = lasix_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Lasix.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Lasix.executeDrugInfoDescription()
                print("Lasix was selected")
                
            }
        }else if segue.identifier == "Vasopressin" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = vasopressinDrip_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Vasopressin.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Vasopressin.executeDrugInfoDescription()
                print("Vasopressin Drip was selected")
                
            }
        }else if segue.identifier == "Levophed" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = levophed_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Levophed.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Levophed.executeDrugInfoDescription()
                print("Levophed was selected")
                
            }
        }else if segue.identifier == "Labetalol" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = labetalol_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Labetalol.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Labetalol.executeDrugInfoDescription()
                print("Labetalol was selected")
                
            }
        }else if segue.identifier == "Dobutamine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = dobutamine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Dobutamine.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Dobutamine.executeDrugInfoDescription()
                print("Dobutamine was selected")
                
            }
        }else if segue.identifier == "Lidocaine" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = lidocaine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Lidocaine.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Lidocaine.executeDrugInfoDescription()
                print("Lidocaine was selected")
                
            }
        }else if segue.identifier == "Vasopressin" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = vasopressinBolus_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Vasopressin.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Vasopressin.executeDrugInfoDescription()
                print("Vasopressin Bolus was selected")
                
            }
        }else if segue.identifier == "EpiDrip" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = epiDrip_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.EpiDrip.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.EpiDrip.executeDrugInfoDescription()
                print("EpiDrip was selected")
                
            }
        }else if segue.identifier == "Vecuronium" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = vecuronium_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.NonDepolarizing.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Vecuronium.executeDrugInfoDescription()
                print("Vecuronium was selected")
                
            }
        }else if segue.identifier == "Rocuronium" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = rocuronium_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.NonDepolarizing.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Rocuronium.executeDrugInfoDescription()
                print("Rocuronium was selected")
                
            }
        }else if segue.identifier == "Succs" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = Succinylcholine_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.Depolarizing.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Succinylcholine.executeDrugInfoDescription()
                print("Succs was selected")
                
            }
        }else if segue.identifier == "Nimbex" {
            if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                MiniDrugVC.buttonName = nimbex_Button!.currentTitle!
                MiniDrugVC.drugClass = DrugClass.NonDepolarizing.executeDrugClassDescription()
                MiniDrugVC.drugInfo =   DrugInformation.Nimbex.executeDrugInfoDescription()
                print("Succs was selected")
            }
            }else if segue.identifier == "Propofol" {
                if let MiniDrugVC = segue.destination as? MiniDrugDataViewViewController {
                    MiniDrugVC.buttonName = propofol_Button!.currentTitle!
                    MiniDrugVC.drugClass = DrugClass.Propofol.executeDrugClassDescription()
                    MiniDrugVC.drugInfo =   DrugInformation.Propofol.executeDrugInfoDescription()
                    print("Propofol was selected")
                    
                }//MARK:Albuterol
            }
        }
    
        
    }
    


