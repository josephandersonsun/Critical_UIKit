//
//  MiniPopUpData.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 12/8/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import Foundation



enum DrugClass:String {
   
    case Adenosine = "Antiarrhythmic Agent, Diagnostic Agent"
    case Decardon = "Corticosteroid, Systemic Glucocorticoid"
    case Dopamine = "Adrenergic Agonist Agent, Sympathomimetic"
    case Amiodarone = "Class III, Antiarrhythmic Agent"
    case Atropine = "Anticholinergic Agent; Antidote for Organophosphate Poisoning"
    case Bicarb = "Alkalinizing Agent, Sodium Salt"
    case Dextrose = "Hyperglycemic Agent"
    case Calcium = "Calcium Salt, Electrolyte Supplement"
    case Lidocaine = "Class IB Antiarrhythmic Agent"
    case Defibrillation = "Electrical Energy"
    case SyncCardioversion = "Sync Cardioversion"
    case Epi = "Adrenergic Agonist, Bronchodilator, Sympathomimetic"
    case Cardene = "Antihypertensive Agent, Calcium Channel Blocker"
    case Levophed = "Alpha-Adrenergic Agonist, Sympathomimetic."
    case Labetalol = "Antihypertensive"
    case Lasix = "Loop Diuretic"
    case Milrinone = "Phosphodiesterase Inhibitor"
    case Nitro = "Antihypertensive Agent, Nitrate, Vasodilator"
    case Nipride = "Antihypertensive Agent, Vasodilator"
    case Vasopressin = "Antidiuretic Hormone"
    case Etomidate = "General Anesthetic, Sedative"
    case Ativan = "Benzodiazepine, Hypnotic, Sedative"
    case Morphine = "Analgesic, Narcotic"
    case Fentanyl = "Analgesic, Narcotic, General Anesthetic"
    case Precedex = "Sedative"
    case Dobutamine = "Inotropic agent, Sympathomimetic"
    case Propofol = "General Anesthetic"
    case Versed = "Benzodiazepine, Sedative"
    case Ketamine = "Dissociative Anesthetic"
    case FluidBolus = "IV Fluid Bolus"
    case Albuterol = "Beta2-Adrenergic Agonist, Bronchodilator, Sympathomimetic"
    case Albumin = "Blood Product Derivative, Plasma Volume Expander"
    case Benadryl = "Antihistamine, Sedative"
    case SoluCortef = "Corticosteroid; Glucocorticoid"
    case MagSulfate = "Anticonvulsant, Electrolyte Supplement"
    case SoluMedrol = "Corticosteroid, Glucocorticoid"
    case Narcan = "Opiate Antagonist"
    case EpiDrip = "Sympathomimetic, Bronchodilator"
    case Depolarizing = "Depolarizing Paralytic"
    case NonDepolarizing = "Non-Depolarizing Paralytic"
    
    //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
    func executeDrugClassDescription() ->String { return self.rawValue }
}



enum DrugInformation: String {
    
    case Adenosine = "Children <50 kg: Initial: 0.05 to 0.1 mg/kg (maximum initial dose: 6 mg).\n\nIf conversion of PSVT does not occur within 1 to 2 min, may increase dose by 0.05 to 0.1 mg/kg. May repeat until sinus rhythm is established or to a maximum single dose of 0.3 mg/kg or 12 mg. Follow each dose with normal saline flush."
    
    case Decadron = "Infants, Children, and Adolescents: Oral, IM, IV: 0.5 mg/kg/dose (maximum dose: 10 mg/dose) administered 6 to 12 hrs prior to extubation then q 6 hrs for 6 doses (total dexamethasone dose: 3 mg/kg.\n\nReference:(Anene 1996; Khemani 2009; Tellez 1991)"
    
    case Dopamine = "Continuous IV or intraosseous infusion: 2 to 20 mcg/kg/minute, titrate  by 5- to 10-mcg/kg/min increments until optimal response is obtained.\nLow dosage: 1 to 5 mcg/kg/minute, increased renal blood flow and urine output.\nIntermediate dosage: 5 to 15 mcg/kg/minute, increased renal blood flow, heart rate, cardiac contractility, cardiac output, and blood pressure.\nHigh dosage: >15 mcg/kg/minute, alpha-adrenergic effects begin to predominate, vasoconstriction, increased blood pressure.\nReference:(PALS [Chameides 2011])"
    
    case Amiodarone = "Infants, Children, and Adolescents: IV, I.O.: 5 mg/kg (maximum: 300 mg/dose) rapid bolus; may repeat twice up to a maximum total dose of 15 mg/kg during acute treatment.\n\nReferences:(PALS [de Caen 2015]; PALS [Kleinman 2010])"
    
    case Atropine = "Infants, Children, and Adolescents:\nIV, I.O.: 0.02 mg/kg/dose; minimum dose recommended by PALS: 0.1 mg; however, use of a minimum dosage of 0.1 mg in patients <5 kg will result in dosages >0.02 mg/kg and is not recommended (Barrington 2011); there is no documented minimum dosage in this age group; maximum single dose: 0.5 mg; may repeat once in 3 to 5 min; maximum total dose: 1 mg.\n\nReferences: (AHA 2015; PALS 2011)."
    
    case Bicarb = "Usual dosage: 1 to 2 mEq/kg/dose (Berg 2010). In 55 asphyxiated neonates, a fixed dose of 1.8 mEq/kg/dose over 3 to 5 min administered within first 5 min of life did not show clinical benefit (eg, survival, acid-base status, neurodevelopmental outcomes) compared to control group.\n\nReferences:(Lokesh 2004; Murki 2004)."
    
    case Dextrose = "IV: 0.2 g/kg/dose (2 mL/kg/dose of D10W); followed by a continuous IV infusion at a rate of 5 to 8 mg/kg/minute to maintain plasma glucose ≥40 to 50 mg/dL; if plasma glucose concentrations remain low, increase infusion in 2 mg/kg/minute increments; if rates >12 to 14 mg/kg/minute are required further work up may be needed (Fanaroff 2013).IV, IO: 0.5 to 1 g/kg/dose (5 to 10 mL/kg/dose of D10W).\n\nReferences: Chameides, Leon, and Mark Ralston. Pediatric Advanced Life Support. Dallas, TX: American Heart Association, 2011. Print.(Adamkin 2011; Fanaroff 2013; Lilien 1980)"
    
    case Calcium = "Cardiac arrest in the presence of hyperkalemia or hypocalcemia, hypermagnesemia, or calcium channel blocker toxicity: Dose expressed as calcium gluconate: IV, I.O.: 60 to 100 mg/kg/dose; may repeat in 10 min if necessary; if effective, consider IV infusion.\n\nReferences:(Avery 1994; Hegenbarth 2008)"
    
    case Lidocaine = "Loading dose: 1 mg/kg/dose; follow with continuous IV infusion; may repeat bolus if delay between initial bolus and start of infusion is >15 min \n\nContinuous IV infusion: 20 to 50 mcg/kg/minute; per manufacturer, do not exceed 20 mcg/kg/minute in patients with shock, hepatic disease, cardiac arrest, or CHF"
    
    case Defibrillation = "Defibrillation is indicated in the treatment of the following: ventricular fibrillation and pulseless ventricular tachycardia."
    
    case SyncCardioversion = "Cardioversion should be used in unstable patients with organized cardiac rhythms. For example 1)supraventricular tachycardia (SVT), 2) atrial fibrillation, atrial flutter, or 3) ventricular tachycardia with a pulse."
    
    case Epi = "Pulseless Arrest: IV, I.O.: 0.01 mg/kg (0.1 mL/kg of 0.1 mg/mL solution) (maximum single dose: 1 mg); q 3 to 5 min until return of spontaneous circulation. Bradycardia: IV, I.O.: 0.01 mg/kg (0.1 mL/kg of 0.1 mg/mL solution) (maximum dose: 1 mg or 10 mL); may repeat q 3 to 5 min as needed."
    
    case Cardene = "Continuous IV infusion: Note: Use should be reserved for severe hypertension: Limited data available: Initial: 0.5-1 mcg/kg/minute; titrate dose according to blood pressure; rate of infusion may be increased q 15-30 min; usual dose: 1-3 mcg/kg/minute; maximum dose: 4-5 mcg/kg/minute.\n\nReferences:(Flynn, 2000; Flynn, 2001; NHBPEP, 2004)."
    
    case Levophed = "Hypotension/shock: Infants, Children, and Adolescents: Continuous IV infusion: Initial: 0.05 to 0.1 mcg/kg/minute, titrate to desired effect; usual maximum dose: 2 mcg/kg/minute.\n\nReferences:(Fuhrman 2011; PALS [Kleinman 2010]; Park 2014)."
    
    case Lasix = "Lasix is a loop diuretic yada yada"
    
    case Milrinone = "PALS Guidelines 2010: IV, I.O.: Loading dose: 50 mcg/kg administered over 10 to 60 min followed by a continuous infusion of 0.25 to 0.75 mcg/kg/minute"
    
    case Nitro = "Adolescents: Continuous IV infusion: Initial: 5 to 10 mcg/minute; titrate q 3 to 5 min as needed to maximum rate of 200 mcg/minute.\n\nReferences (AHA [Chameides 2011]; Park 2014)"
    
    case Nipride = "Continuous IV infusion: Initial: 0.3 to 0.5 mcg/kg/minute, titrate q 5 min to desired effect; usual dose: 3 to 4 mcg/kg/minute; maximum dose: 10 mcg/kg/minute (Chandar 2012; Hegenbarth 2008; NHBPEP 2004; Park 2014); increased infusion rates are correlated with increased cyanide concentrations.\n\nReferences: (Hammer 2015)"
    
    case Vasopressin = "Central diabetes insipidus: Infants, Children, and Adolescents: Continuous IV infusion: Initial: 0.5 milliunits/kg/hr; titrate upward in 0.5 milliunits/kg/hr increments at approximately 10-minute intervals to target urine output (suggested output target: <2 mL/kg/hr) (Sperling 2014; Wise-Faberowski 2004); infusion rates up to 10 milliunits/kg/hr have been reported (Alharfi 2013). Note: Use in conjunction with fluid therapy, monitor urine output and specific gravity, serum and urine electrolytes (primarily Na), and plasma osmolality."
    
    case Etomidate = "Children >10 years and Adults: Initial: 0.2-0.6 mg/kg over 30-60 seconds; maintenance: 10-20 mcg/kg/minute; smaller doses may be used to supplement subpotent anesthetic agents"
    
    case Ativan = "IV: 0.05 to 0.1 mg/kg (maximum: 4 mg/dose) slow IV over 2 to 5 min; may repeat in 5 to 15 min if needed (AAP [Hegenbarth 2008]; NCS [Brophy 2012]; Kleigman 2007); usual total maximum dose: 8 mg (Crawford 1987; NICE 2012). Note: May be administered IM if IV not possible.\n\nReferences: (Hegenbarth 2008)."
    
    case Morphine = "Usual range: 0.1 to 0.2 mg/kg/dose q 2 to 4 hrs as needed; use lower doses in opioid naïve patients; usual maximum dose: Infants: 2 mg/dose; Children 1 to 6 years: 4 mg/dose; Children 7 to 12 years: 8 mg/dose; Adolescents: 10 mg/dose"
    
    case Fentanyl = "IV: Initial: 1 to 2 mcg/kg/dose; may repeat at 30- to 60-minute intervals; in opioid-tolerant children, titration to higher doses may be required. Note: Usual adolescent starting dose is 25 to 50 mcg.\n\nReferences: (Hegenbarth 2008; Nelson 1996; WHO 2012)."
    
    case Precedex = "Continuous IV infusion: Initial: 0.1 to 0.3 mcg/kg/hr, adjust dose to desired level of sedation; reported titration was variable; however, many increased by 0.1 mcg/kg/hr as needed to desired level of sedation. Reported dose variable, usual reported range: 0.2 to 0.6 mcg/kg/hr. Maximum dose: 1.5 mcg/kg/hr.\n\nReferences:(Bejian 2009; Chrysosotomou 2009; Chysosotomou 2014; O’Mara 2009; O’Mara 2012; Su 2016)."
    
    case EpiDrip = "Infants, Children, and Adolescents: Continuous IV or intraosseous infusion: 0.05 to 1 mcg/kg/minute; doses <0.3 mcg/kg/minute generally produce beta-adrenergic effects and higher doses (>0.3 mcg/kg/minute) generally produce alpha-adrenergic vasoconstriction; titrate dosage to desired effect.\n\nReferences:(ACCM [Davis 2017]; PALS [Kleinman 2010])"
    
    case Dobutamine = "Infants, Children, and Adolescents: Continuous IV or intraosseous infusion: Initial: 0.5 to 1 mcg/kg/minute, titrate gradually q few min until desired response achieved; usual range: 2 to 20 mcg/kg/minute.\nReference:(PALS [Chameides 2011])"
    
    case Propofol = "IV: General range: 125 to 300 mcg/kg/minute (7.5 to 18 mg/kg/hr); Initial dose immediately following induction: 200 to 300 mcg/kg/minute; then decrease dose after 30 min if clinical signs of light anesthesia are absent; usual infusion rate after initial 30 min: 125 to 150 mcg/kg/minute (7.5 to 9 mg/kg/hr); infants and children ≤5 years may require higher infusion rates compared to older children."

    
    case Versed = "Initial: 0.05 to 0.1 mg/kg; titrate dose carefully; total dose of 0.6 mg/kg may be required; usual total dose maximum: 6 mg"
    
    case Ketamine = "IV: 1 to 2 mg/kg over 30 to 60 seconds. If initial sedation inadequate or repeated doses are necessary to accomplish a longer procedure, may administer additional doses of 0.5 to 1 mg/kg q 5 to 15 min as needed.\n\nReferences: (ACEP [Green 2011]; Asadi 2013; Berkenbosch 2004, Koruk 2010)"
    
    case FluidBolus = "Children with decompensated hypovolemic shock should receive 20 mL/kg per bolus of isotonic crystalloid, such as normal saline or Ringer's lactate solution, infused over 5 to 10 min and repeated, as needed, up to three times in patients without improvement and no signs of fluid overload. Additional therapies, such as blood transfusion in patients with hypovolemic shock from hemorrhage may be required depending upon the response to fluid administration."
    
    case Albuterol = "Infants, Children, and Adolescents: Intermittent: 0.5% (5 mg/mL) solution: 2.5 mg q 20 min for 3 doses, then 0.15 to 0.3 mg/kg up to 10 mg q 1 to 4 hrs. Continuous nebulization: 0.5 mg/kg/hr up to 10 to 15 mg/hr"
    
    case Albumin = "Hypovolemia,Shock: 5% albumin: IV: 0.5 to 1 g/kg/dose (10 to 20 mL/kg/dose) over 5 to 10 min.\n\nAscites with hypoalbuminemia:25% albumin: IV: 1 g/kg/dose over 2 to 3 hrs; may repeat up to 3 times per day until albumin is > 2.5 g/dL; maximum dose: 25 g/dose.\n\nReferences:(Giefer 2011, Sabri 2003)"
    
    case Benadryl = "Severe allergic reaction: IV, IM, PO: 1-2 mg/kg/dose; maximum single dose: 50 mg/dose.\n\nReferences:(Hegenbarth, 2008; Kliegman, 2011; Liberman, 2008; Lieberman, 2010; Simons, 2011)"
    
    case SoluCortef = "IV: 1 to 2 mg/kg/dose q 6 hrs for 24 hrs, then maintenance of 0.5 to 1 mg/kg q 6"
    
    case MagSulfate = "IV, IO: 25 to 50 mg /kg/dose, over 2 hrs, q 6 hrs for 2 to 3 doses, then recheck serum concentration; maximum dose: 2,000 mg/dose.\n\n 1 gram magnesium sulfate = 8.12 mEq magnesium.\n\nReferences:(Hegenbarth 2008; Kliegman 2011; PALS [Kleinman 2010])"
    
    case SoluMedrol = "1 to 2 mg/kg/day in 2 divided doses; maximum daily dose: 60 mg/day"
    
    case Narcan = "IV: 0.001 to 0.005 mg/kg/dose; titrate to effect may repeat q 2 - 3 min PRN. Max: 0.4 mg/dose.\nReference:(PALS [Chameides 2011])"
    
    case Labetalol = "swrweerffw"
    
    case Rocuronium = "0.5 - 1 mg/kg/dose IV; lasts 15 - 45 min; fastest onset of nondepolarizing agents. Initial infusion: 7 - 10 mcg/kg/min"
    
    case Vecuronium = "0.1 - 0.2 mg/kg/dose IV; lasts 20 - 40 min Initial infusion: 0.1 mg/kg/hr"
    
    case Succinylcholine = "Avoid in renal failure and hyperkalemia.Contraindicated in burns >24hrs and malignant hyperthermia.\n\nInfants ≤6 months: 2 to 3 mg/kg/dose.\n\nInfants >6 months and Children ≤2 years: 1 to 2 mg/kg/dose.\n\nChildren >2 years and Adolescents: 1 mg/kg/dose."
    
    case Nimbex = "Infants and Children <2 years: 0.15 mg/kg over 5 to 10 seconds.\n\nChildren ≥2 years and Adolescents: 0.1 mg/kg over 5 to 10 seconds.\n\nContinuous IV infusion: Infants, Children, and Adolescents: 1 to 4 mcg/kg/minute (0.06 to 0.24 mg/kg/hour)"
 
    //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
    func executeDrugInfoDescription() ->String { return self.rawValue }
}

