//
//  CapnographyInformation.swift
//  Capnography
//
//  Created by Jadie Barringer III on 1/21/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


enum CapnographyData {
    
    case Normal, Apnea, Hypoventilation, ElevatedBaseline, Hyperventilation, LossOfAveolarPressure
    
    //Function to show the detail Information
    func waveFormSubtitleData() -> String {
        
        /// Switch on itself to the cases above in the enum
        switch self {
            
        case .Normal:
            
            return "There are 4 phases to a capnogram. Phase I - IV."
        case .Apnea:
            
            return "Complete loss of end-tidal CO2 waveform.\n\nD.O.P.E - Use this pneumonic to troubleshoot an acute loss of the waveform. Disconnections, Obstructions, Pneumothorax, Equipment failures. Also, consider apnea tests in brain-dead patients."
        case .Hypoventilation:
            
            return "This waveform above displays hypoventilation. Notice the gradual increase in end-tidal CO2."
        case .ElevatedBaseline:
            
            return "Notice a gradual increase in the end-tidal CO2.\n\nThis capnogram shows an elevation from the baseline. Usually, this is due to the inability to exhale or inhale, completely. The CO2 doesn't quite get out during exhalation."
            
        case .Hyperventilation:
            
            return "Respiratory rate gets faster. Notice a slight decrease in C02.\n\nFast breathing (tachypnea) doesn't necessarily increase tidal volume. Anxiety, head injuries, diabetic emergencies, pulmonary embolism, acute myocardial infarction, etc. will."
        case .LossOfAveolarPressure:
            
            return "\"Shark's fin\" pattern seen in bronchospasms.\n\nThis displays an abnormal loss of alveolar plateau, meaning the exhalation is some way incomplete or obstructed - hence the\" shark's fin\" pattern. This pattern is usually found in bronchospasms."
            
        }
    }
    
    func possibleCauses() -> String {
        
        /// Switch on itself to the cases above in the enum
        switch self {
            
        case .Normal:
            
            return "• Phase I: Baseline\n\nThis is the inspiratory baseline- the beginning of exhalation, which is due to inspired gas with low levels of carbon dioxide, usually zero. No CO2 is present- this is because no CO2 is going out when the patient is breathing in. This represents air from the trachea, posterior pharynx, mouth, and nose. No gas exchange occurs in this region. Referred to as \"dead space\"\n\n• Phase II: Ascending Phase\n\nThis phase is the beginning of expiration upstroke (the beginning of exhalation). CO2 from the alveoli start to mix with dead space air. Notice the rapid/steep rise. This is due to the mixing of dead space air and alveolar gas from the alveoli/bronchiole transition. The transition should be steep.\n\na. The transition from phase II to III is referred to as the alpha angle.\n\nb. The alpha angle is used to assess the ventilation/perfusion of the lung. V/Q mismatches will have an alpha angle greater than 90 degrees.\n\n• Phase III: Alveolar Plateau\n\nThis represents the alveolar/ expiratory plateau. The sensor is receiving CO2 gas that was previously in the alveoli. CO2 gas now constitutes the majority of the exhaled air. The PETCO2 (Peak End-Tidal CO2), or end of exhaled air is measured at 35-45 mmHg.\n\na. The transition from phase III to 0 (baseline) is the beta angle.\n\nb. The beta angle is used to assess rebreathing. At this point (if paralytics are wearing off) is where you can observe a curare cleft- a dip in the plateau which is indicative of a spontaneous respiratory effort. If rebreathing occurs, the angle is greater than 90 degrees.\n\nc. Phase 0, reflects the inspiratory downstroke and the beginning of inspiration.\n\n• Phase IV: Descending Phase\n\nInspiratory downstroke, inhalation of CO2 free gas, quickly returns to the baseline. The principal determinants of end-tidal CO2 are: \n\n1) Alveolar ventilation.\n\n2) Pulmonary perfusion (cardiac output).\n\n3) CO2 production."
        case .Apnea:
            
            return "• Respiratory arrest\n• Tube dislodgment\n\nThe sudden loss of a waveform indicates that there is no CO2 present. In a spontaneously breathing patient, this means that the patient is most likely in respiratory arrest. If the patient is still breathing, check the equipment. If there is an advanced airway in place, this may be an indication that there may be a problem with the airway.\n\nThe airway may have become displaced or obstructed in some way. If there's any doubt about the patency of the airway, remove it, ventilate the patient with the BVM and reestablish the airway if necessary.\n\nQuickly, disconnect the patient from the ventilator circuit and hook up the bag valve mask. Reassess the airway and perform a physical exam to determine the cause."
        case .Hypoventilation:
            
            return "• Oversedation\n• Central nervous system dysfunctions\n• Drug overdoses\n• Reduced Cardiac output\n• Impending cardiac arrest\n• Hypotension / Hypovolemia / Hypothermia\n\nHypoventilation is seen when there is an increase in end-tidal CO2 levels in the waveform still presents with a normal appearance. This is often seen in patients with decreased respiratory drive due to narcotic overdoses, central nervous system depression, or heavy sedation.\n\nThese patients are not breathing fast or deep enough to adequately remove CO2 from the lungs, thus, resulting in increased end-tidal CO2 levels. Assisting ventilations with a bag valve mask or increasing the vent rate in intubated patients will help improve overall ventilation, thus, reducing overall CO2 levels."
        case .ElevatedBaseline:
            
            return "• COPD and asthma patients \" air trapping\".\n\n• CO2 re-breathing (ventilator circuit issues)\n\nWhen the capnogram shows an elevated baseline, this is an indication that the inspiratory, or expiratory phase is incomplete. The CO2 is not being appropriately removed. This is often due to insufficient expiratory time, inadequate inspiratory flow, or faulty expiratory valve. The CO2 in the lungs ultimately does not get washed out during exhalation. Other causes may include contamination of the CO2 monitor, and valve malfunctions where you will notice the baseline is elevated, where phase III and the downstroke is prolonged."
            
        case .Hyperventilation:
            
            return "• Hyperventilation syndrome\n• Excessive ventilations\n• Pulmonary embolisms\n\nIn hyperventilation, the capnograph starts normal, but as the rate becomes faster, the waveforms grow close together and the level of the end-tidal c02 begin to decrease.\n\nThe most common cause of hyperventilation is overzealous bagging of a patient with an advanced airway.\n\nWhen decreasing end-tidal CO2 levels are noted, slow the respiratory rate at which the patient is being ventilated until the end-tidal CO2 returns to normal.\n\nIn the spontaneously breathing patient, increasing the respiratory rate and decreasing the end-tidal CO2 level can be a sign of hyperventilation syndrome or a pre-existing pulmonary embolism."
            
        case .LossOfAveolarPressure:
            
            return "• Asthma\n• Emphysema\n• COPD\n• Partial Airway Obstruction\n• Equipment tubing\n\nThe loss of a normal unsloping alveolar plateau is an indication of an incomplete or obstructed exhalation. The waveform will often have a \"shark fin\" pattern. Exhalation is being slowed, often by bronchoconstrictions.\n\na. Asthma & Emphysema\n\n In the case of asthma, this sharks fin shape of the waveform is indicative of an obstructive process. Uneven emptying of the alveoli causes the waveform to curve up (in phase 3) resembling the shark's fin. As the hypoxia worsens, and patients become more tired, the shark's fin waveform will continue, but you'll notice a slowing of the rate as the quality of the CO2 builds up.\n\nb. Mechanical / Airway Obstructions\n\nIn the event there is mechanical or partial airway obstruction, the shark's fin shape is present but\"bent\" indicating an obstruction is present. As with asthma patients, there is an uneven emptying of the alveoli mixed with dead space air. This again will cause the shape to curve up resembling a \"sharks fin\".\n\nPhase 4 inhalation is blocked (usually by a foreign body, mucous plug, or tumor) causing the right side of the rectangle to lean left. As the hypoxia begins to worsen and the patient becomes more exhausted, as in the asthmatic, the shark's fin will continue, but you'll notice the quality of CO2 will build up, and the rate slows."

        }
    }
    
    // Had to import UIKit for UIImage to work
    func capnographyImages() -> UIImage {
        
        //Returns a UIImage to pass to the detailed view Controller
        switch self {
            
        case .Normal:
            return UIImage(named:"NormalCapnogram.new")!
        case .Apnea:
            return UIImage(named:"Apnea.new")!
        case .Hypoventilation:
            return UIImage(named:"Hypoventilation.new")!
        case .ElevatedBaseline:
            return UIImage(named:"ElevatedBaseLine.new")!
        case .Hyperventilation:
            return UIImage(named:"Hyperventilation.new")!
        case .LossOfAveolarPressure:
            return UIImage(named:"LossofAlveolarPressure")!
            
        }
    }
    
    
    
    
} // end enum
