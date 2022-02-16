//
//  24-29KG.swift
//  CriticalPediatrics
//
//  Created by Jadie Barringer III on 9/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension Pediatric_DetailVC {
    
    //MARK: 24-29 kg's
    func case_TwentyFourToTwentyNine() -> Void {
        print("Large Child, Orange Color, 24-30 kg")
        
        // Calculates the conversion from Kg's to Lbs
        let pounds: Double? = (weightEntered)! * 2.2
        
        // Guard function to calculate the weight from the optional value.
        guard let w = weightEntered,
            let lbs = pounds,
            let age = weightEntered
            else {return}
        weightCalcLabel.text = "\(w) kg " + " " + "| " + String.localizedStringWithFormat("%.1f", lbs) + " lbs"
        age_Label.text = approximateAgeFromWeight_5_14(weight: age)
        
        // MARK: Defib calculation and dosages. Stay the same.
        defibrillation_Lbl.text =  defib(Weight: weightEntered!, EnergyOne: 2, EnergyTwo: 4)
        cardioversion_lbl.text =  defib(Weight: weightEntered!, EnergyOne: 0.5, EnergyTwo: 1)
        
        
        
        // MARK: Adds a border line color.
        vitalsView.addBorder(side: .left, thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        ventImageView.addBorder(side:.left,thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        equipmentUIView.addBorder(side:.left,thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        sedationParalytics.addBorder(side:.left,thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        cardiacResuscitation.addBorder(side:.left,thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        medicationsOther.addBorder(side:.left,thickness: 8.0, color:#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), leftOffset: 0.1)
        
        //MARK: - Vital Signs
        systolic.text = CriticalPediatrics.PediatricData.LargeChild.BloodPressure.execute()
        respRate_lbl.text = CriticalPediatrics.PediatricData.LargeChild.RespRate.execute()
        heartRate.text = CriticalPediatrics.PediatricData.LargeChild.Pulse.execute()
        hypotensiveLabel.text = CriticalPediatrics.PediatricData.LargeChild.Hypotensive.execute()
        
        // MARK: EQUIPMENT
        blade_lbl.text = CriticalPediatrics.PediatricData.LargeChild.Laryngescope.execute()
        ettCuff_lbl.text = CriticalPediatrics.PediatricData.LargeChild.ETTSizeCuffed.execute()
        suctionCath_lbl.text = CriticalPediatrics.PediatricData.LargeChild.SuctionCathSize.execute()
        oPa_lbl.text = CriticalPediatrics.PediatricData.LargeChild.OralAirway.execute()
        iGel_lbl.text = CriticalPediatrics.PediatricData.LargeChild.iGel.execute()
        kingLT_lbl.text = CriticalPediatrics.PediatricData.LargeChild.kingLT.execute()
        ezIO_lbl.text = CriticalPediatrics.PediatricData.LargeChild.EZ_IO.execute()
        ngSize_lbl.text = CriticalPediatrics.PediatricData.LargeChild.NGTubeSize.execute()
        
        
        //Calculate the TV tanges.
        let neonateTV_Low = weightEntered! * 4
        let neonateTV_high = weightEntered! * 6
        let neonateTV_Ranges: String = "\(neonateTV_Low)-\(neonateTV_high)"
        
        
        ventDescriptionLabel.text = "For children, consider a volume of \(neonateTV_Ranges) mL's. Avoid Peak Inspiratory Pressures > 40 mmHg. Pressure = PEEP + Peak Inspiratory Pressure (PIP)"
        
        //MARK: Vent
        peep_lbl.text = CriticalPediatrics.PediatricData.LargeChild.PEEP.execute()
        ventMode_lbl.text = CriticalPediatrics.PediatricData.LargeChild.Mode.execute()
        ventRate_lbl.text = CriticalPediatrics.PediatricData.LargeChild.RespiratoryVentRate.execute()
        ventTV_lbl.text = neonateTV_Ranges
        iTime_lbl.text = CriticalPediatrics.PediatricData.LargeChild.Itime.execute()
        pip_lbl.text = CriticalPediatrics.PediatricData.LargeChild.PIP.execute()
        
        
        

    }
}
