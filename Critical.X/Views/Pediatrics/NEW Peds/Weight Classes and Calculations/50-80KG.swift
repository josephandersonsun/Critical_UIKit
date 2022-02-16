//
//  50-80KG.swift
//  CriticalPediatrics
//
//  Created by Jadie Barringer III on 9/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension Pediatric_DetailVC {
    
    //MARK: 50-80 kg's
    func case_FiftyToEighty() -> Void {
        // Calculates the conversion from Kg's to Lbs
        let pounds: Double? = (weightEntered)! * 2.2
        
        print("Adult, Green Color, 50-80 kg")
        
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
        vitalsView.addBorder(side: .left, thickness: 8.0, color:FlatColor.BackgroundColor.Green.toUIColor(), leftOffset: 0.1)
        ventImageView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Green .toUIColor(), leftOffset: 0.1)
        equipmentUIView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Green .toUIColor(), leftOffset: 0.1)
        sedationParalytics.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Green .toUIColor(), leftOffset: 0.1)
        cardiacResuscitation.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Green .toUIColor(), leftOffset: 0.1)
        medicationsOther.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.Green.toUIColor(), leftOffset: 0.1)

        
        
        
        //MARK: - Vital Signs
        systolic.text = CriticalPediatrics.PediatricData.LargeAdult50.BloodPressure.execute()
        respRate_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.RespRate.execute()
        heartRate.text = CriticalPediatrics.PediatricData.LargeAdult50.Pulse.execute()
        hypotensiveLabel.text = CriticalPediatrics.PediatricData.LargeAdult50.Hypotensive.execute()
        
        // MARK: EQUIPMENT
        blade_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.Laryngescope.execute()
        ettCuff_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.ETTSizeCuffed.execute()
        suctionCath_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.SuctionCathSize.execute()
        oPa_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.OralAirway.execute()
        iGel_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.iGel.execute()
        kingLT_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.kingLT.execute()
        ezIO_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.EZ_IO.execute()
        ngSize_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.NGTubeSize.execute()
        
        //Calculate the TV tanges.
        let neonateTV_Low = weightEntered! * 4
        let neonateTV_high = weightEntered! * 8
        let neonateTV_Ranges: String = "\(neonateTV_Low)-\(neonateTV_high)"
        
        
        ventDescriptionLabel.text = "For large teens, consider a volume of \(neonateTV_Ranges) mL's. Avoid Peak Inspiratory Pressures > 40 mmHg. Pressure = PEEP + Peak Inspiratory Pressure (PIP)"
        
        //MARK: Vent
        peep_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.PEEP.execute()
        ventMode_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.Mode.execute()
        ventRate_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.RespiratoryVentRate.execute()
        ventTV_lbl.text = neonateTV_Ranges
        iTime_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.Itime.execute()
        pip_lbl.text = CriticalPediatrics.PediatricData.LargeAdult50.PIP.execute()
        
        
    }
    
}
