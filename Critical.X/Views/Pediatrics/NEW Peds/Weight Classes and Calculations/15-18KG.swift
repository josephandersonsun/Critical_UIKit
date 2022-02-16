//
//  15-18KG.swift
//  CriticalPediatrics
//
//  Created by Jadie Barringer III on 9/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension Pediatric_DetailVC {

    // MARK: 15-18 kg's
    func case_FifteenToEighteen() -> Void {
        // Calculates the conversion from Kg's to Lbs
        let pounds: Double? = (weightEntered)! * 2.2
        print("\(String(describing: pounds)) pounds")
        print("Child, White Color, 15-18 kg")
        
        // Guard function to calculate the weight from the optional value.
        guard let w = weightEntered,
            let lbs = pounds,
            let age = weightEntered
            
            else {return}
        
        // Takes the pounds and shortens the converstion to one sig figure.
        weightCalcLabel.text = "\(w) kg " + " " + "| " + String.localizedStringWithFormat("%.1f", lbs) + " lbs"
        age_Label.text = approximateAgeFromWeight_1_5(weight: age)
        
        // MARK: Defib calculation and dosages. Stay the same.
        defibrillation_Lbl.text =  defib(Weight: weightEntered!, EnergyOne: 2, EnergyTwo: 4)
        cardioversion_lbl.text =  defib(Weight: weightEntered!, EnergyOne: 0.5, EnergyTwo: 1)
        
        
        
        
        // MARK: Adds a border line color.
        vitalsView.addBorder(side: .left, thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        ventImageView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        equipmentUIView.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        sedationParalytics.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        cardiacResuscitation.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        medicationsOther.addBorder(side:.left,thickness: 8.0, color:FlatColor.BackgroundColor.White.toUIColor(), leftOffset: 0.1)
        
        
        
        //MARK: - Vital Signs
        systolic.text = CriticalPediatrics.PediatricData.Child_15_18.BloodPressure.execute()
        respRate_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.RespRate.execute()
        heartRate.text = CriticalPediatrics.PediatricData.Child_15_18.Pulse.execute()
        hypotensiveLabel.text = CriticalPediatrics.PediatricData.Child_15_18.Hypotensive.execute()
        

        
        // MARK: EQUIPMENT
        blade_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.Laryngescope.execute()
        ettCuff_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.ETTSizeCuffed.execute()
        suctionCath_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.SuctionCathSize.execute()
        oPa_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.OralAirway.execute()
        iGel_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.iGel.execute()
        kingLT_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.kingLT.execute()
        ezIO_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.EZ_IO.execute()
        ngSize_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.NGTubeSize.execute()

        //Calculate the TV tanges.
        let neonateTV_Low = weightEntered! * 4
        let neonateTV_high = weightEntered! * 6
        let neonateTV_Ranges: String = "\(neonateTV_Low)-\(neonateTV_high)"
        
        
        ventDescriptionLabel.text = "For children, consider a volume of \(neonateTV_Ranges) mL's. Avoid Peak Inspiratory Pressures > 40 mmHg. Pressure = PEEP + Peak Inspiratory Pressure (PIP)"
        
        //MARK: Vent
        peep_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.PEEP.execute()
        ventMode_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.Mode.execute()
        ventRate_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.RespiratoryVentRate.execute()
        ventTV_lbl.text = neonateTV_Ranges
        iTime_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.Itime.execute()
        pip_lbl.text = CriticalPediatrics.PediatricData.Child_15_18.PIP.execute()

        
    }
    
}
