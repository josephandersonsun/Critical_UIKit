//
//  RSI_Additional.swift
//  Critical_X_RSI
//
//  Created by Jadie Barringer III on 12/28/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit




class RSI_Additional: UIViewController {
    
    @IBOutlet weak var closeButtonAdditional: UIButton!
    @IBOutlet weak var rsiAdditionalView: UIView!
    @IBOutlet weak var heading_Label: UILabel!
    @IBOutlet weak var rsiAdditionalViewHeight: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
        
        // Takes the button and makes it into a circle
        closeButtonAdditional.layer.cornerRadius = closeButtonAdditional.frame.size.width / 2
        
        /// Rounds the corners 15 pixels of the UIView named: popUpView
        rsiAdditionalView.clipsToBounds = true
        rsiAdditionalView.layer.cornerRadius = 15
        
        //rsiDescription_Label.text = ninePs
        //rsiDescription_Label.sizeToFit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    @IBAction func dismissRsiAdditional(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "Preparation" {
           
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Preparation (0-10 min)"
                
                rsiProcessVC.processDescription = "Mnemonic: SOAP ME\n\nPrepare equipment. This should include intubating equipment, oxygen, suction, multiple sized tubes, EGD’s, medications, monitoring equipment and confirmation equipment.\n\n1. Suction\n\n2. Oxygen (mask and BVM ventilation)\n\n3. Airway equipment:\n\nLaryngoscopes: At least two functioning handles and various sized blades\n\nET tube: Chosen size and one size smaller ETT must be available, and ET cuff must be tested.\n\nAdult male: 7.5-8; Adult female: 7-7.5 ; Children: 4 + (age in years/4)\n\n4. Pharmacy:\n\nPatent IV line\n\nSpecific RSI medications: Proper dosing, Sequence of administration, Agents drawn up and labeled.\n\n5. Monitoring Equipment: Blood pressure and Pulse oximetry (ETCO2 if available)."
                
               

                print("plan button pressed")
            }}
        
        if segue.identifier == "positioning" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Positioning"
                
                rsiProcessVC.processDescription = "Remove the front of the cervical collar and CID's if treating a trauma patient. Institute manual in line stabilization.\n\nOptimal positioning is the sniffing position if no cervical spinal injuries are suspected.\n\n\"Ramping\" the head, neck and portion of the thorax for obese patients so that  the ear canal lies horizontal plane with the anterior clavicle or xiphoid process.\n\nCricoid pressure or the Sellicks maneuver if warranted per protocol.\n\nHead of the bed 30 degrees in certain patient groups."
                
                print("Position button pressed")
                
            }}
        
        if segue.identifier == "preox" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Preoxygenation (0-5 min)"
                
                rsiProcessVC.processDescription = "Pre-oxygenation should occur 3 to 5 minutes before the administration of any paralytic agent (time zero).\n\nCan be replaced by eight vital capacity breaths if the patients can do so, on an emergent basis.\n\n Place a nasal cannula and run it at 15 L per minute. Leave it in place throughout the pre-oxygenation phase, until the patient is intubated.\n\nIf the patient is compliant, run 15 L per minute of oxygen into a BVM with a reservoir. Place the patient's face (with the nasal cannula flowing at 15 L per minute) and allow the patient to passively breathe the oxygen via the bag valve mask without ventilating.\n\nA non-rebreather mask at 15 L per minute at a minimum (in conjunction with a nasal cannula at 15 L per minute one available).\n\n\"Nitrogen washout\" with 100% oxygen for 5 minutes – replace room air (80% nitrogen + 20% oxygen) with 100% oxygen in lungs to create oxygen reservoir"
                
                print("preox button pressed")
                
            }}
        if segue.identifier == "pretreat" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Pretreatment"
                
                rsiProcessVC.processDescription = "Mnemonic: LOAD\n\nLidocaine, Opiates, Atropine, Defasciculation\n\n\n1. Lidocaine: 1.5 mg/kg IV\n\n2. Opioid (fentanyl): 3-6 mcg/kg IV (adults) and 1-3 mcg/kg IV (children)\n\n3. Atropine: 2 mg (adults) and 0.02 mg/kg (children; minimum dose 0.1 mg)\n\n4. Defasciculation (Pancuronium, Vecuronium): 0.01 mg/kg (only for adults and children >20 kg)\n\n If cerebral protection is desired, medications must be given at least two minutes prior to intubation. Indications can include increased intracranial pressure and/or head injuries."
                
                
                print("pretreat button pressed")
                
            }}
        if segue.identifier == "postIntubation" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Post-Intubation"
                
                rsiProcessVC.processDescription = "Secure the tube with a commercial device at minimum, additional techniques may be used in addition to a commercial device if needed. Sedate the patient, provide continued chemical paralysis if needed and assure hemodynamic stability.\n\nSedation alone may be adequate to maintain intubation. The clinician should assure that chemical paralysis is not continued unless long acting sedation has been administered.\n\nPain management may be initiated either as an adjunct to enhance the effectiveness of sedation, in the presence of obvious discomfort despite adequate sedation or to manage known or suspected pain. If not administered during the premedication phase it is appropriate at this time.\n\nChemical paralysis may be maintained at the discretion of the clinical crew to maximize oxygenation/ventilation, facilitate rest or attain patient compliance. In many situations the patient can be adequately sedated without the need for continued chemical paralysis. If paralytic agents are given sedation must be given as well.\n\nPush Dose Pressors may be administered to correct for the loss of sympathetic tone associated with RSI pharmacology:\n\n1. Epinephrine 5-20 mcg IV/IO\n\n2. Phenylephrine 100 mcg IV/IO"
                
                print("postIntubation button pressed")
                
            }}
        if segue.identifier == "paralysis" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Paralyze (Zero min)"
                
                rsiProcessVC.processDescription = "1. Induction:\n\nEtomidate (0.3 mg/kg)Hypotensive, Hypovolemic and Bronchospastic patients: Ketamine (1-2 mg/kg)\n\nOthers: Thiopental, Methohexital, Midazolam, Propofol\n\n2. Achieve optimal intubating conditions with the addition of either a depolarizing or non-depolarizing paralytic agents:\n\nDepolarizing paralytic: Succinylcholine:\n\nPreferred due to its short duration of paralysis. May be contraindicated in the presence of known or suspected hyperkalemia (renal failure, toxic ingestion, rhabdomyolysis, etc.) 1.5 mg/kg in adults, 2 mg/kg in children and 3 mg/kg in infant (Onset: 45-60 seconds; Duration: 6-12 minutes)\n\nNon-depolarizing paralytics:\n\nRocuronium: If Succinylcholine is contraindicated or unavailable and Vecuronium is contraindicated or unavailable then Rocuronium may be substituted at this point. 1 mg/kg (Onset: 50-70 seconds; Duration: 30-60 minutes)\n\nVecuronium ➡︎  If Succinylcholine is contraindicated or unavailable then Vecuronium may be substituted at his point at 0.15 mg/kg (Onset: 90-120 seconds; Duration: 60-75 minutes)\n\nPancuronium ➡︎ 0.1 mg/kg (Onset: 100-150 seconds; Duration: 120-150 minutes)."
                
                print("paralysis button pressed")
                
            }}
        if segue.identifier == "placement" {
            
            // We segue to theView and pass the infomation from which row is pressed
            if let rsiProcessVC = segue.destination as? RSIProcess {
                rsiProcessVC.processTitle = "Placement (0+45 seconds)"
                
                rsiProcessVC.processDescription = "First pass success is the goal!\n\nUtilize ELM (External Laryngeal Manipulation) or bi-manual laryngoscopy with an assistant.\n\nIdentify the structures and grade of view upon entry.\n\nInsert ETT tube with right hand until cuff is 2-3 cm below vocal cords (23 cm marker on corner of mouth in adult male and 21 cm in adult female).\n\nRemove stylet and inflate cuff\n\nClinical Confirmation:\n\nObserving ETT pass through vocal cords\n\nClear and equal breath sounds over both lung fields, and absence of breath sounds over epigastrium\n\nSymmetrical chest rise during ventilation\n\nFogging of ETT during ventilation\n\nETCO2 detection:\n\nColor change from purple to yellow will be absent in colorimetric ETCO2 detector if esophageal intubation has occurred."
                
                print("placement button pressed")
                
            }}
        
        
        
        
        
    }
    
    
    
    
    
    
}
