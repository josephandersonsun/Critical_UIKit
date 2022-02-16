//
//  0-3KG.swift
//  CriticalPediatrics
//
//  Created by Jadie Barringer III on 9/12/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension Pediatric_DetailVC {
    
    // MARK: - WEIGHT CLASS HELPER FUNCTIONS
    
    // What happens when certain weight classes are selected.
    // MARK: - 0-3 kgs
    func case_03 () -> Void {
        
        
        let pounds: Double? = (weightEntered)! * 2.2
        // We arent doing any border colors for premature ones.
        
        //MARK: - Vital Signs
        systolic.text = CriticalPediatrics.PediatricData.Premature.SystolicBP.execute()
        diastolic.text = CriticalPediatrics.PediatricData.Premature.DiastolicBP.execute()
        respRate_lbl.text = CriticalPediatrics.PediatricData.Premature.RespRate.execute()
        heartRate.text = CriticalPediatrics.PediatricData.Premature.Pulse.execute()
        hypotensiveLabel.text = CriticalPediatrics.PediatricData.Premature.Hypotensive.execute()
        
        vitalsView.addBorder(side: .left, thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        ventImageView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        equipmentUIView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        sedationParalytics.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        cardiacResuscitation.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        medicationsOther.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Gray.toUIColor(), leftOffset: 0.1)
        
        // MARK: Guard function to calculate the weight/ age from the entered weight value.
        guard let w = weightEntered,
            let lbs = pounds,
            let age = weightEntered
            else {return}
        
        // MARK: Congerts Kg's to grams
        weightCalcLabel.text = " \(Int (w * 1000)) grams | \(lbs.rounded()) lbs"
        
        // Shows approx age from weight calculated
        age_Label.text = approximateAgeFromWeight(weight: age)
        
        //Calculate the TV tanges. 
        let neonateTV_Low = weightEntered! * 4
        let neonateTV_high = weightEntered! * 6
        let neonateTV_Ranges: String = "\(neonateTV_Low)-\(neonateTV_high)"

        ventDescriptionLabel.text = "Neonates, consider a volume of \(neonateTV_Ranges) mL's. Avoid Peak Inspiratory Pressures > 40 mmHg. Pressure = PEEP + Peak Inspiratory Pressure (PIP)"
        
        // MARK: Defib calculation and dosages. Stay the same.
        defibrillation_Lbl.text =  defib(Weight: weightEntered!, EnergyOne: 2, EnergyTwo: 4)
        cardioversion_lbl.text =  defib(Weight: weightEntered!, EnergyOne: 0.5, EnergyTwo: 1)
        
        
        // MARK: EQUIPMENT
        blade_lbl.text = CriticalPediatrics.PediatricData.Premature.Laryngescope.execute()
        ettCuff_lbl.text = CriticalPediatrics.PediatricData.Premature.ETTSizeCuffed.execute()
        suctionCath_lbl.text = CriticalPediatrics.PediatricData.Premature.SuctionCathSize.execute()
        oPa_lbl.text = CriticalPediatrics.PediatricData.Premature.OralAirway.execute()
        iGel_lbl.text = CriticalPediatrics.PediatricData.Premature.iGel.execute()
        kingLT_lbl.text = CriticalPediatrics.PediatricData.Premature.kingLT.execute()
        ezIO_lbl.text = CriticalPediatrics.PediatricData.Premature.EZ_IO.execute()
        ngSize_lbl.text = CriticalPediatrics.PediatricData.Premature.NGTubeSize.execute()

        
        //MARK: Vent
        peep_lbl.text = CriticalPediatrics.PediatricData.Premature.PEEP.execute()
        ventMode_lbl.text = CriticalPediatrics.PediatricData.Premature.Mode.execute()
        ventRate_lbl.text = CriticalPediatrics.PediatricData.Premature.RespiratoryVentRate.execute()
        ventTV_lbl.text = CriticalPediatrics.PediatricData.Premature.TidalVolume.execute()
        iTime_lbl.text = CriticalPediatrics.PediatricData.Premature.Itime.execute()
        pip_lbl.text = CriticalPediatrics.PediatricData.Premature.PIP.execute()
        
        
        //MARK: MEDICATIONS
        
        print("Weight is \(String(describing: weightEntered)), between 0-5 kg: Blue")
        
    }
    
}
