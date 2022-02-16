//
//  Data_Peds.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 12/6/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


public var weightEntered: Double?


class CriticalPediatrics {
    
    enum PediatricData {
        
        /// 0-2 kg
        enum Premature: String {
            
            // Vital Signs
            case Years = "Premature"
            case SystolicBP = "55-90 "
            case DiastolicBP = "35-45"
            case RespRate = "40-70"
            case Pulse = "120-170"
            case Hypotensive = "< 50"
            
            
            case Laryngescope = "0 Miller"
            case ETTSizeCuffed = "2.5 - 3 mm "
            case SuctionCathSize = "6 (f)"
            case OralAirway = "40 mm (00)"
            case iGel = "Size 1"
            case kingLT = "Size 0: 10mL"
            case EZ_IO = "15 mm"
            case NGTubeSize = "5 (f)"

            //Ventilator Settings
            case PEEP = "3-5"
            case RespiratoryVentRate = "40-50/min"
            case TidalVolume = "Variable"
            case Mode = "Pressure"
            case Itime = "0.3 - 0.4"
            case PIP = "18-22"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
            
        }
        
        /// 3-6 kg
        enum Term: String {
            
            case Years = "Term Newborn"
            case SystolicBP = "60-100 "
            case DiastolicBP = "35-45"
            case RespRate = "30-60"
            case Pulse = "100-160"
            case Hypotensive = "< 60"
            
            
            case Laryngescope = "1 Miller"
            case ETTSizeCuffed = "3.0 mm "
            case SuctionCathSize = "6-8 (f)"
            case OralAirway = "40-50 mm"
            case iGel = "Size 1"
            case kingLT = "Size 0: 10mL"
            case EZ_IO = "15 mm"
            case NGTubeSize = "5-8 (f)"
            
            // Vent parameters
            case PEEP = "3-5"
            case RespiratoryVentRate = "30-40/min"
            case TidalVolume = "Variable"
            case Mode = "Pressure"
            case Itime = "0.3-0.5"
            case PIP = "18-20"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
        }
        
        /// 6-8 kg
        enum SmallInfant: String {
            
            case Years = "Term Newborn"
            case BloodPressure = "70 - 100"
            case Pulse = "105 - 160"
            case RespRate = "30-60"
            case Hypotensive = "< 70"
            
            case Laryngescope = "1 Miller"
            case ETTSizeCuffed = "3.0 mm "
            case SuctionCathSize = "6-8 (f)"
            case OralAirway = "50 mm"
            case iGel = "Size 1.5"
            case kingLT = "Size 1: 20mL"
            case EZ_IO = "15 mm"
            case NGTubeSize = "5-8 (f)"
            
            // Vent parameters
            case PEEP = "3-5"
            case RespiratoryVentRate = "20-30/min"
            case TidalVolume = "Variable"
            case Mode = "Pressure"
            case Itime = "0.3-0.5"
            case PIP = "16-18"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        /// 8-9 kg
        enum Infant: String {
            
            case Years = "Child"
            case BloodPressure = "70 - 100"
            case Pulse = "110 - 160"
            case RespRate = "24-38"
            case Hypotensive = "< 70"
            
            case Laryngescope = "1 Miller"
            case ETTSizeCuffed = "3.0 mm "
            case SuctionCathSize = "6-8 (f)"
            case OralAirway = "50 mm"
            case iGel = "Size 1.5"
            case kingLT = "Size 1: 20mL"
            case EZ_IO = "15 mm"
            case NGTubeSize = "5-8 (f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "30-40/min"
            case TidalVolume = "Variable"
            case Mode = "Pressure"
            case Itime = "0.3-0.5"
            case PIP = "16-18"
            
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
            
            
        }
        
        // 1 year old at least
        /// 10-12 kg
        enum Toddler: String {
            
            case Years = "Toddler"
            case BloodPressure = "75 - 105  "
            case Pulse = "90 - 150"
            case RespRate = "20-30"
            case Hypotensive = "< 74"
            
            case Laryngescope = "1-1.5 Miller"
            case ETTSizeCuffed = "3.5 mm "
            case SuctionCathSize = "10 (f)"
            case OralAirway = "60 mm"
            case iGel = "Size 1.5"
            case kingLT = "Size 1: 20mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "8-10 (f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "16-26/min"
            case Mode = "*PC/VC"
            case Itime = "0.6-0.8"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        /// 12-15 kg
        enum SmallChild: String {
            
            case Years = "Small Child"
            case BloodPressure = "75 - 110  "
            case Pulse = "80 - 140"
            case RespRate = "20 - 30 Breaths"
            case Hypotensive = "< 78"
            
            case Laryngescope = "2 Miller"
            case ETTSizeCuffed = "4.0 mm "
            case SuctionCathSize = "10 (f)"
            case OralAirway = "60 mm"
            case iGel = "Size 2"
            case kingLT = "Size 2: 35mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = " 10 (f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "16-26/min"
            case Mode = "*PC/VC"
            case Itime = "0.6-0.8"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        
        /// 15-18 kg
        enum Child_15_18: String {
            
            case Years = "Child"
            case BloodPressure = "76 - 115  "
            case Pulse = "75 - 120"
            case RespRate = "22 - 26"
            case Hypotensive = "< 82"
            
            case Laryngescope = "2 Miller"
            case ETTSizeCuffed = "4.5 mm "
            case SuctionCathSize = "10 (f)"
            case OralAirway = "60 mm"
            case iGel = "Size 2"
            case kingLT = "Size 2: 35mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "10 f"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "16-26/min"
            case Mode = "*PC/VC"
            case Itime = "0.6-0.8"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        // 5 y/o at 20 kg
        // 6 yrs at 22 kg
        
        /// 19-23 kg
        enum Child_19_23: String {
            
            case Years = "Child"
            case BloodPressure = "80 - 115"
            case Pulse = "70-115"
            case RespRate = "20-40"
            case Hypotensive = "< 86"
            
            case Laryngescope = "2 Miller/Mac"
            case ETTSizeCuffed = "5.0 mm "
            case SuctionCathSize = "10 (f)"
            case OralAirway = "70 mm"
            case iGel = "Size 2"
            case kingLT = "Size 2.5: 40-45mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "12-14 (f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "14-20/min"
            case Mode = "*PC/VC"
            case Itime = "0.8-1.0"
            case PIP = "18-25"
            
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        /// 24-29 kg
        enum LargeChild: String {
            
            case Years = "Large Child"
            case BloodPressure = "80-120  "
            case Pulse = "70-110"
            case RespRate = "16-22"
            case Hypotensive = "< 90"
            
            case Laryngescope = "2 Miller/Mac"
            case ETTSizeCuffed = "5.5 mm "
            case SuctionCathSize = "10 (f)"
            case OralAirway = "80 mm"
            case iGel = "Size 2.5"
            case kingLT = "Size 2.5: 40-45mL Size 3: 50-60mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "14-18(f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "14-20/min"
            case Mode = "*PC/VC"
            case Itime = "0.8-1.0"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        
        /// 30- 37 kg
        enum Adult: String {
            
            case Years = "Adult"
            case BloodPressure = "80-120  "
            case Pulse = "55-105"
            case RespRate = "16-22"
            case Hypotensive = "< 90"
            
            case Laryngescope = "3 Miller/Mac"
            case ETTSizeCuffed = "6.0 mm "
            case SuctionCathSize = "10-12 (f)"
            case OralAirway = "80 mm"
            case iGel = "Size 2.5-3"
            case kingLT = "Size 3.0: 50-60mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "16-18(f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "14-20/min"
            case Mode = "*PC/VC"
            case Itime = "0.8-1.0"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        
        /// 40 ++ kg
        enum LargeAdult40: String {
            
            case Years = "Adult"
            case BloodPressure = "90 - 120  "
            case Pulse = "60 - 100"
            case RespRate = "16-22"
            case Hypotensive = "< 90"
            
            case Laryngescope = "3 Miller/Mac"
            case ETTSizeCuffed = "6.0 mm "
            case SuctionCathSize = "14 (f)"
            case OralAirway = "80 mm"
            case iGel = "Size 3"
            case kingLT = "Size 3.0: 50-60mL"
            case EZ_IO = "25 mm"
            case NGTubeSize = "16-18(f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "14-20/min"
            case Mode = "*PC/VC"
            case Itime = "0.8-1.0"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
            
        }
        // 12 years old
        /// 50 ++ kg
        enum LargeAdult50: String {
            
            case Years = "Adult"
            case BloodPressure = "90-120  "
            case Pulse = "60-100"
            case RespRate = "16-20"
            case Hypotensive = "< 90"
            
            case Laryngescope = "3 Miller/Mac"
            case ETTSizeCuffed = "6.5 mm "
            case SuctionCathSize = "14 (f)"
            case OralAirway = "80/90 mm"
            case iGel = "Size 3/4"
            case kingLT = "Size 3/4:50-60ml, 70-80mL"
            case EZ_IO = "25-45 mm"
            case NGTubeSize = "16-18 (f)"
            
            case PEEP = "3-5"
            case RespiratoryVentRate = "12-18/min"
            case Mode = "*PC/VC"
            case Itime = "0.8-1.0"
            case PIP = "18-25"
            
            //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
            func execute() ->String { return self.rawValue }
            
        }
        
        
    }
    
    // func executePedsEquipDescription()->String {return DrugDoseDescription.Decardon.rawValue}
    
}



//Test Class and function
class CriticalPedsData2: CriticalPediatrics {
    
    enum Critical: String {
        case data = "Hi Data"
    }
    
    static func addValues(Dose: CriticalPediatrics.PediatricData.Premature) -> String {
        
        return Dose.rawValue + " Equipment"
        
    }
}



