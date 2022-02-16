//
//  IABP_Data.swift
//  Intra Aortic Balloon Pump
//
//  Created by Jadie Barringer III on 1/22/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


enum BalloonPump {
    
    case NormalTiming, EarlyInflation, LateInflation, EarlyDeflation, LateDeflation, AorticDissection, Augmentation, BleedingAtSite, BalloonRupture, Dysrhythmias, VascularInjuries, FailureToPump, LimbIschemia, CardiacArrest
    
    //Function to show the detail Information
    func iabpTitle() -> String {
        
        /// Switch on itself to the cases above in the enum
        switch self {
            
        case .NormalTiming:
            
            return "Normal Timing"
            
        case .EarlyInflation:
            
            return "Early Inflation"
            
        case .LateInflation:
            
            return "Late Inflation"
            
        case .EarlyDeflation:
            
            return "Early Deflation"
            
        case .LateDeflation:
            
            return "Late Deflation"
            
        case .AorticDissection:
            
            return "Aortic Dissection"
            
        case .Augmentation:
            
            return "Augmentation"
            
        case .BleedingAtSite:
            
            return "Bleeding"
            
        case .BalloonRupture:
            
            return "Balloon Rupture"
            
        case .Dysrhythmias:
            
            return "Dysrhythmias"
            
        case .VascularInjuries:
            
            return "Vascular Injuries"
            
        case .FailureToPump:
            
            return "Failure To Pump"
            
        case .LimbIschemia:
            
            return "Limb Ischemia"
            
        case .CardiacArrest:
            
            return "Cardiac Arrest"
            
            
        }
    }
    
    func iabpDescription() -> String {
        
        /// Switch on itself to the cases above in the enum
        switch self {
            
            
        case .NormalTiming:
            
            return "Overview:\n\nThe IABP is placed in the proximal descending aorta, just distal to the (L) Subclavian artery. The balloon is automatically inflated during diastole and deflated just prior to, and during systole. Inflation and deflation is triggered by the ECG, (common) arterial pressure waveform or asynchronously.\n\nThe primary goal of the balloon pump is to increase myocardial oxygen supply and decrease myocardial oxygen demand.\n\nSecond, is to improve cardiac output, ejection fraction, increase coronary perfusion pressure and systemic perfusion, decrease heart rate, pulmonary capillary wedge pressure and systemic vascular resistance.\n\nFinally, the IABP will ultimately decrease Left Ventricular (LV) afterload and increase LV stroke volume.\n\nIndications to go on pump:\n\n• Cardiogenic shock, LV failure\n• Low cardiac output after bypass\n• Bridge to heart transplant \n• Severe left main coronary artery stenosis refractory to cardiac surgery\n• PCI for an acute MI\n• Intractable ventricular arrhythmias\n\nContraindications Include:\n\n• Significant aortic valve regurgitation\n• Aortic Disscection\n• Bleeding disorders\n• Uncontrolled Sepsis\n• Severe peripheral artery disease.\n\nWaveform Interpretation\n\nA. Unassisted Systole\nThe unassisted peak should be higher than the assisted systolic peak.\n\nB. Diastolic Augmentation\nThis is the highest peak, which represents balloon inflation. This should occur just after the dicrotic notch (closure of the aortic valve).\n\nC. There should always be a sharp \"V\" on the waveform at the level of the dicrotic notch. The dicrotic notch should not be visible during the assisted beat.\n\nD. Patient Aortic End Diastolic Pressure (PAEDP)\nThis should always be higher than the Balloon Aortic End Diastolic Pressure (BAEDP).\n\nE. Balloon Aortic End Diastolic Pressure (BAEDP)\nThis is the systolic afterload reduction caused by balloon depletion. This should always be lower than the patient aortic and diastolic pressure considering the afterload reduction is effective."
            
        case .EarlyInflation:
            
            return "Early inflation is inflation of the balloon before the aortic valve closes. The main consequence of early balloon inflation is a reflux of blood into the left ventricle. In return, there will be an increase in SVR and subsequent decrease in cardiac output.\n\nEarly inflation significantly increases causes premature closure of the aortic valve, resulting in approximately 20% - 55% reduction in SV. This decrease in SV is usually not compensated for in subsequent beats. Myocardial relaxation is adversely affected, which further reduces stroke volume. Thus, CO decreases and myocardial contractility is altered, which reduces stroke volume even more."
        case .LateInflation:
            
            return "Late inflation occurs when the balloon inflates markedly after closure of the aortic valve.\nLate inflation also reduces diastolic augmentation time and coronary artery perfusion pressure."
            
        case .EarlyDeflation:
            
            return "When assisted systole and systolic pressure are equal, resulting in a decrease in augmentation time and less reduction of LV stroke volume. Although early deflation may not impair systolic function directly, it may impair myocardial efficiency over time by reducing the balance of oxygen supply and demand.\n\nEarly deflation results in a vacuum effect, and afterload reduction is lost. This occurs primarily because by the time the aortic valve opens, the pressures in the aorta have already equalized."
            
        case .LateDeflation:
            
            return "Late deflation is defined as an elevation of the end-diastolic pressure which is greater than the patient’s native diastolic pressure.\n\nIn late deflation, the balloon is still inflated during the beginning of ventricular systole – resulting in an increased afterload of the LV."
            
        case .AorticDissection:
            
            return ""
        case .Augmentation:
            
            return ""
        case .BleedingAtSite:
            
            return ""
        case .BalloonRupture:
            
            return ""
        case .Dysrhythmias:
            
            return ""
        case .VascularInjuries:
            
            return ""
        case .FailureToPump:
            
            return ""
        case .LimbIschemia:
            
            return ""
        case .CardiacArrest:
            
            return ""
            
        }
    }
    
    // Had to import UIKit for UIImage to work
    func iabpImages() -> UIImage {
        
        //Returns a UIImage to pass to the detailed view Controller
        switch self {
            
        case .NormalTiming:
            return UIImage(named:"NormalTiming")!
            
        case .EarlyDeflation:
            return UIImage(named:"EarlyDeflation1")!
            
        case .EarlyInflation:
            return UIImage(named:"EInflation.overlay2")!
            
        case .LateInflation:
            return UIImage(named:"LateInflationOverlay")!
            
        case .LateDeflation:
            return UIImage(named:"LateDeflationOverlay")!
            
        case .AorticDissection:
            return UIImage(named:"dissection")!
            
        case .Augmentation:
            return UIImage(named:"ElevatedBaseLine.new")!
            
            
        case .BleedingAtSite:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .BalloonRupture:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .Dysrhythmias:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .VascularInjuries:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .FailureToPump:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .LimbIschemia:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        case .CardiacArrest:
            return UIImage(named:"ElevatedBaseLine.new")!
            
        }
    }
    
    enum BalloonPumpComplication {
        
        case AorticDissection, Augmentation, BleedingAtSite, BalloonRupture, Dysrhythmias, VascularInjuries, FailureToPump, LimbIschemia, CardiacArrest
        
        //Function to show the detail Information
        func complicationInfo() -> String {
            
            /// Switch on itself to the cases above in the enum
            switch self {
                
                
                
            case .AorticDissection:
                
                return """
                \rAortic dissection/perforations are the most common cause of IABP related mortality secondary to massive hemorrhaging. Pulsations from the balloon will eject more blood into the false lumen, further expanding and worsening the dissection.
                \rClots that form inside it will be battered around and potentially expelled into the systemic circulation. The probability of perforation or dissection is less than 1.5%.
                \rSigns and symptoms of aortic perforations or dissection include:
                \r• Abdominal pain
                \r• Acute flank/back pain
                \r• Decreased bilateral distal pulses
                \r• B/P variances between the L and R arm
                \r• Hypotension, low hematocrit, and tachycardia
                \r• Decreased pulses in the distal extremities.
                
                \rThese patients need to be prepared for immediate surgical intervention.
                """
                
            case .Augmentation:
                
                return """
                Ineffective augmentation may be caused by the following:
                \r• Helium leakage
                \r• Low SVR or stroke volume
                \r• Hypovolemia or MAP <50
                \r• Tachycardia > 120
                \r• Catheter leak or kinking
                \r• Balloon being positioned in a false lumen
                \r• Balloon volume too low
                
                \rTroubleshooting ineffective augmentation:
                • Treat tachycardia or hypovolemia
                \r• Reposition or replace the balloon
                \r• Recheck the timing of the balloon
                \r• Reconfirm proper balloon volume
                \r• Confirm the absence of blood in the line
                \r• Check for kinking in the tubing
                \r• Auscultate the patient's chest to check for balloon inflation/deflation.
                """
                
            case .BleedingAtSite:
                
                return """
                \rBleeding at the insertion site is common and is likely due to anticoagulation therapy or thrombocytopenia. Patients on the pump are typically anticoagulated to avoid any thrombus formation at the tip of the catheter or within the folds of the balloon.
                \rDuring inflation, the catheter can destroy the platelets resulting in thrombocytopenia. Thus, labs such as CBC's and coags should be ordered before and during therapy to monitor the Hgb and Plt count.
                \rNote that the insertion site dressing should be transparent. If you notice any oozing, bruising or formation of hematomas, or swelling around the area, it may be an indication of bleeding.
                \rRetroperitoneal bleeding signs and symptoms including  hypotension, back, flank or abdominal pain. If there is bleeding at the insertion site, apply direct pressure to the site and prepare to administer blood products if necessary.
                \rFinally, check the insertion site hourly for bleeding or hematomas. Also, a CBC and coags should be monitored for anemia and thrombocytopenia.
                """
                
            case .BalloonRupture:
                
                return """
                \rA leakage of approximately 1-3 mL/kg of helium is fatal to the patient. 0.5 – 1 mL/kg leakage of helium can result in an obstruction of cerebral or coronary blood flow.
                \rImmediately turn off the pump!
                \rSigns/symptoms:
                \r• Leak alarms, loss of augmentation
                \r• Sudden onset of Vascular Ischemia
                \r• Acute Change in Neurological Status
                \r• Rust – colored flakes in the driveline.
                \rInterventions:
                \r• Disconnect the driveline from the pump and manually and deflate the balloon with a 60 cc syringe.
                \r• Replace catheter to prevent entrapment.
                """
                
            case .Dysrhythmias:
                
                return """
                In patients who are experiencing dysrhythmias, leave the pump in the EKG trigger mode. The "pressure" trigger mode is not recommended.
                \rPossible dysrhythmias may include:
                \r• Atrial fibrillation
                \r• Supraventricular tachycardia
                \r• Cardiac arrest
                \rFor patients with underlying dysrhythmias, treat the underlying rhythm. Leave the trigger mode on "EKG." If the patient goes into cardiac arrest, switch the mode to "pressure" and proceed with CPR and recommend ACLS protocols.
                """
                
            case .VascularInjuries:
                
                return """
                The incidence for a patient to have a vascular injury is approximately less than 2%. Usually, this occurs at several sites including: brachial, axillary, subclavian, femoral, iliac, or aortic arch.
                \rReasons may include:
                \r•  Embolisms from clots, helium, air or plaque.\n• Cerebral obstruction (strokes), mesenteric obstructions resulting in mesenteric ischemia.
                \r• Renal instructions (renal failure), subclavian artery obstructions resulting from upper extremity ischemia.
                \r• Spinal artery obstructions resulting in paraplegia.
                \rTo prevent vascular injuries, make sure that the balloon is secured preventing migration of the balloon. Do not raise the head of the bed > 30° or allow the patient to flex his/her hips if the catheter is placed in the femoral artery.
                """
            case .FailureToPump:
                
                return """
                There are a few reasons one may encounter mechanical issues with the balloon failing to pump.
                \r•Cardiac arrest\n• Loss of EKG, pacing, or arterial trigger
                \r• Leaks or kinks in the pump, catheter or tubing.
                \r• The pump may be unplugged\n• Loss of battery or helium.
                \r• Mechanical or power failure.\n\nTroubleshooting:\n\nCheck all the leads, connections, triggers and signals. Do not allow the balloon to be motionless for more than 30 minutes. Manual deflation and inflation q 5-10 mins to help decrease clot formation.
                \r• If the pump doesn't restart, you may have to deflate the balloon manually with a 60 mL syringe to ensure that there are no leaks present.
                """
                
            case .LimbIschemia:
                
                return """
                \rThe incidence for a patient to have limb ischemia is approximately 2%.
                \rReasons include:\n\n• Clots\n• Arterial vasospasms
                \r• Hematomas\n• Peripheral Vascular Disease (PVD)
                \r• Hypotension\n\nTreatment:
                \r• Palpate peripheral pulses and check for capillary refill.
                \r• If peripheral pulses are not present, attempt to confirm with the Doppler.
                \r• Confirm the position of the balloon with a chest x-ray.
                \r• Did not raise the bed > 30° or allow the patient to flex his/her hips.
                \r• Measure the patient's calves every four hours. A fasciotomy may be necessary if compartment syndrome is suspected.
                """
                
            case .CardiacArrest:
                
                return """
                If the patient goes into cardiac arrest during cycle, switch to "pressure triggering" once the pump alarms - due to not being able to trigger from the EKG.
                
                \rRemember, if the pump is on Autopilot (Arrow) or “Auto” (Getinge/Maquet), switch to operator mode (Arrow) or semi-auto mode (Getinge/Maquet) to decrease the arrows. Reduce the pressure threshold if the balloon fails to pump from the pressure trigger by decreasing the arrows in the auxiliary box under the trigger options.
                \rDuring CPR, an arterial pressure tracing is generated therefore the pressure trigger may be used. If the console does not recognize the arterial pressure tracing, the compressions may not be adequate. The balloon pump does not need to be disconnected during defibrillation.
                \rIf CPR cannot generate a consistent and reliable trigger, switch to the internal mode, which will maintain movement of IABP, therefore reducing the risk of any thrombus formation.
                """
                
                
            }
        }
        
    }
    
    
} // end enum

