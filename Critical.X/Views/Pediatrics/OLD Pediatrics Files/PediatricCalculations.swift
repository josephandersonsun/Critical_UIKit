//
//  PediatricCalculations.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 12/6/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit



enum PediatricEquipment {
   
    
    
    /// 0-2 kg
    enum Premature: String {
    

        case Years = "Premature"
        case BloodPressure = "60 - 70 mm/Hg"
        case RespRate = "30 - 50 Breaths"
        case Pulse = "120 - 160"
        
        case CentralLineFemoral = "7 cm @ teeth/gums"
        case ETTSizeCuffed = "2.0 mm "
        case ETTSizeUnCuffed = "2.5 mm"
        case OralAirway = "40 mm"
        case SuctionCathSize = "<  8F"
        case NGTubeSize = "<  5F"
        case FoleyCathSize = " <  5F"
        case ChestTubeSize = "<  10F"
        case CentralLine = "3F/8 cm"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
        
    
    }
    /// 3-5 kg
    enum Term: String {
        
        case Years = "Term Newborn"
        case BloodPressure = "60 - 70 mm/Hg"
        case Pulse = "120 - 160"
        case RespRate = "30 - 50 min"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "2.5 mm"
        case ETTSizeUnCuffed = "3.0 mm"
        case SuctionCathSize = "6-8F"
        case NGTubeSize = "< 5-8F"
        case FoleyCathSize = "5-8F"
        case ChestTubeSize = "10-12F"
        case CentralLine = "3F/8 cm"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 6-7 kg
    enum SmallInfant: String {
        
        case Years = "Term Newborn"
        case BloodPressure = "70 - 100 mm/Hg"
        case Pulse = "120 - 160"
        case RespRate = "30 - 45 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.0 mm"
        case ETTSizeUnCuffed = "3.5 mm"
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "<  10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 8-9 kg
    enum Infant: String {
        
        case Years = "Child"
        case BloodPressure = "70 - 100 mm/Hg"
        case Pulse = "80 - 140"
        case RespRate = "20 - 30 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.0 mm"
        case ETTSizeUnCuffed = "3.5 mm"
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "<  10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
  
    /// 10-11 kg
    enum Toddler: String {
        
        case Years = "Toddler"
        case BloodPressure = "80 - 110 mm/Hg"
        case Pulse = "80 - 130"
        case RespRate = "20 - 30 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.0 mm"
        case ETTSizeUnCuffed = "3.5 mm"
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "<  10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 12-14 kg
    enum SmallChild: String {
        
        case Years = "Small Child"
        case BloodPressure = "80 - 110 mm/Hg"
        case Pulse = "80 - 130"
        case RespRate = "20 - 30 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 "
        case ETTSizeCuffed = "3.5"
        case ETTSizeUnCuffed = "5.0"
        case SuctionCathSize = "8F"
        case NGTubeSize = "8 - 10F"
        case FoleyCathSize = "8 F"
        case ChestTubeSize = "16 - 20F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    
    /// 15-18 kg
    enum Child_15_18: String {
        
        case Years = "Child"
        case BloodPressure = "80 - 110 mm/Hg"
        case Pulse = "80 - 120"
        case RespRate = "20 - 30 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.5 Uncuffed, 3.0 Cuffed"
        case ETTSizeUnCuffed = ""
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "<  10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 19-23 kg
    enum Child_19_23: String {
        
        case Years = "Child"
        case BloodPressure = "80 - 110 mm/Hg"
        case Pulse = "80 - 120"
        case RespRate = "20 - 30 Breaths"
       
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.5 Uncuffed, 3.0 Cuffed"
        case ETTSizeUnCuffed = ""
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "<  10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 24-29 kg
    enum LargeChild: String {
        
        case Years = "Large Child"
        case BloodPressure = "80 - 120 mm/Hg"
        case Pulse = "70 - 110"
        case RespRate = "20 - 30 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "3455"
        case ETTSizeCuffed = "3.0"
        case ETTSizeUnCuffed = "3.5"
        case SuctionCathSize = "< 8F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "< 10F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 30- 36 kg
    enum Adult: String {
        
        case Years = "Adult"
        case BloodPressure = "110 - 120 mm/Hg"
        case Pulse = "55 - 105"
        case RespRate = "12 - 20 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "3.0"
        case ETTSizeUnCuffed = "3.5"
        case SuctionCathSize = "12 - 14F"
        case NGTubeSize = "< 5F"
        case FoleyCathSize = " < 5F"
        case ChestTubeSize = "24 - 36F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "15 - 20 /min"
        
    }
    
    /// 40 ++ kg
    enum LargeAdult40: String {
        
        case Years = "Adult"
        case BloodPressure = "110 - 120 mm/Hg"
        case Pulse = "55 - 105"
        case RespRate = "12 - 20 Breaths"
        
        case OralAirway = "< 50 mm"
        case CentralLineFemoral = "9-10 cm @ teeth/gums"
        case ETTSizeCuffed = "7.0"
        case ETTSizeUnCuffed = "3.5"
        case SuctionCathSize = "14F"
        case NGTubeSize = "12 - 14F"
        case FoleyCathSize = "14 F"
        case ChestTubeSize = "24 - 36F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "12 - 20 /min"
        
    }
    /// 50 ++ kg
    enum LargeAdult50: String {
        
        case Years = "Adult"
        case BloodPressure = "110 - 120 mm/Hg"
        case Pulse = "60 - 100"
        case RespRate = "12 - 20 Breaths"
        
        case OralAirway = "90 mm"
        case CentralLineFemoral = "21 cm @ teeth/gums"
        case ETTSizeCuffed = "7.5 - 8.0"
        case ETTSizeUnCuffed = "Use Cuffed"
        case SuctionCathSize = "14F"
        case NGTubeSize = "16 - 18F"
        case FoleyCathSize = "18F"
        case ChestTubeSize = "36 - 40F"
        
        case PEEP = "3-5 cmH20"
        case RespiratoryVentRate = "12 - 20 /min"
        
    }
}



    

    
    // func executePedsEquipDescription()->String {return DrugDoseDescription.Decardon.rawValue}





