

//
//  File.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation


//MARK: - Image Enum
enum UltraSoundImages: String {
    
    
    
    // RUQ
    case RUQAnatomy = "RUQAnatomyFast"
    case SweepThroughRUQ = "SweepThroughRUQ"
    case RUQProbePosition = "RUQProbePosition"
    case RUQPatology = "Pathology-RUQ"
    case PathologyRUQ_Image = "Pathology_RUQ_FreeFluidImage"
    case PathologyRUQ_FluidPGGutter = "Pathology_RUQ_ParaglottcFreeFluid"
    
    
    // LUQ Views
    
    case LUQProbe = "LUQProbePosition"
    case LUQProbeAnatomy = "LUQ_ProbeAnatomy"
    case LUQ_SweepThrough = "LUQ_SweepThrough"
    case Pathology_LUQ_Img = "Pathology_LUQ_Image"
    case Pathology_LUQ_PosFAST2 = "LUQ_PosFast2"
    case Pathology_LUQ_PosFast1 = "LUQ_PosFast1"
    
    // Cardiac Views
    
    case CardiacSubXiphoidViewGif = "Cardiac-SubxiphoidGIF" //
    case CardiacProbe = "CardiacProbe"
    case HeartParasternalGif = "Heart_Parasternal"
    case subXyphoidGif = "Cardiac-SubxiphoidGIF_ANNOTATED"
    case SubxyphoidImg = "SubxyphoidImgAnatomy"
    case PericardialEffusion_GIF = "Cardiac_LG_Effusion_GIF"
    case SubXiphoidEffusionImage = "SubXiphoid_EffusionImg"
    case PLAX_EffusionGIF = "PLAX_EffusionGIF_Annotated"
    
    
    // Thoracic
    case ThoracicAnatomy = "ThoracicAnatomy"
    case ThoracicProbe = "ThoracicProbe"
    case ABLinesThoracic = "A-BLines_Thorax"
    case MMode = "MModeImg"
    case NormalLungVPTX = "LungSlidingNormalVsPTX"
    case LungPointSignGif   = "LungPointSign"
    
    // Pelvic
    case NormalFemalePelvic_ShortAX_GIF = "Pelvic-NormalFemale"
    case NormalMALEPelvic_ShortAX_GIF = "Pelvic_NormalMale"
    case PelvicProbe = "PelvicProbe"
    case Pelvic_Normal_Male_FemaleScan = "Pelvic-NormalMaleAndFemale"
    case Pelvic_Pelvic_PosFast1 = "Pelvic_PosFast1"
    case PosFast_Female_Pelvis = "Pelvic_Pos_Fast_Female"
    
} // End Enum







//MARK: - View Description Enum
enum UltraSound_AcousticViewDescription: String {
    
    //MARK: - RUQ
    case RUQ_morrisonsTextDescription =
    """
    \rThe RUQ is the most sensitive region for free- fluid accumulation surrounding the liver and the right kidney, and in the hepatorenal recess, called Morison's pouch. This view is also used to detect free fluid between the pleural space on the right side.
    \rWhen viewing the Right Upper Quadrant, the probe indicator should be pointing cephalad on the patients right mid-axillary side.
    
    \rThese are the visible areas of focus:
    \r1. Hepatorenal Recess - Morison's Pouch
    \r2. Inferior hepatic edge/inferior pole of the kidney
    \r3. The diaphragm
    \r4. Pleural Space
    
    \rTechnique:
    \rProbe Indicator: Cephalad (points cranially).
    \rIn this view, the liver is easily seen. The diaphragm, slightly more difficult to identify. If you are unable to identify the diaphragm, have the patient take a breath or wait for inspiration as the diaphragm should lower into view.
    
    \rSometimes rib shadows can obstruct the view. Widely fan through the field and follow the lower edge of the liver down toward the posterior until there is a good view of the tip. If there is free fluid (jet black) in Morison's pouch, it should be seen around the lower edge and tip of the liver.
    
    \rBelow you can see a full sweep of the RUQ. Notice the landmarks.
    """
    
    //MARK: - LUQ
    case leftUpperQuadrant =
    """
    \rThe LUQ a.k.a the perisplenic, or splenorenal view is used to visualize the presence of free-fluid surrounding the spleen (splenorenal recess a.k.a, Koller's pouch) and in left pleural space around the costophrenic angle.
    \rIt's technically challenging and less sensitive for free-fluid than the RUQ due to the spleen being smaller to identify compared to the liver, the acoustic window being lessened due to obstruction from the stomach and the clinician having to reach across the patient.
    
    \rThe traditional acoustic windows obtained in the LUQ are:
    \r1. Splenorenal Interface
    \r2. Inferior tip of the spleen
    \r3. The diaphragm, above and below
    \r4. Inferior Pole of the Left Kidney
    
    \rTechnique:
    \rProbe Indicator: More cephalad (points cranially) and posterior.
    \rStart midaxillary around the 8th ICS sweeping anterior to posterior until the splenorenal interface is identified. If there is difficulty visualizing the acoustic window, it may be because the transducer is not posterior or superior enough. Once the spleen/kidney is located fan the probe in all directions to evaluate the area.
    
    \rIn a routine scan, the spleen, and left kidney are tightly juxtaposed separated by a hyperechoic line. The echogenic line just cephalad to the spleen is the diaphragm.
    \rIf there is free fluid accumulation, it is more likely to be found in the subphrenic space (between the spleen and diaphragm). Pleural effusions will appear as an anechoic (jet black) stripe or triangle just superior to the diaphragm.
    
    \rBelow you can see a full sweep of the LUQ. Notice the landmarks.
    """
    
    
    case CardaicView =
    """
    \rThe cardiac view is used to detect circumferential free fluid around the pericardial sac, free fluid between the RV and liver, and to identify cardiac tamponade. It can be separated into three separate views:
    \rThe traditional cardiac acoustic windows obtained are:
    \r1. Subxyphoid
    \r2. Parasternal Long Axis (PLAX)
    \r3. Parasternal Short Axis (PSAX)
    
    As it's usually sufficient to evaluate one view to check for the presence of pericardial effusions, it's essential to learn all in the event one view is not easily obtained.
    \rTechnique:
    \rProbe Indicator: Probe indicator points towards the left side of the patient.
    \rStart inferiorly to the xiphoid process and place the probe in the transverse axis parallel to the abdominal wall. Firmly plunge the probe slightly under the ribs until the cardiac silhouette comes into view.
    
    \rIn a routine scan, the four chambers of the heart, and the pericardial sac should be visible. The pericardium is hyperechoic. The sonographer should be able to appreciate these eight landmarks. 1. Liver 2. Right Atrium 3. Left Atrium 4. Mitral Valve 5. Left Ventricle 6. Right Ventricle 7. Ventricular septum and 8. Tricuspid valve.
    
    \rBelow you can see appreciate an overview of the subxiphoid view. Notice the landmarks.
    """
    
    case Thoracic =
    """
    \rThe anterior thoracic view is used to evaluate the presence of a pneumothorax, hemothorax, pulmonary edema or pleural effusion, pleural sliding or lung consolidation.  In most cases, the anterior window should be able to rule out a pneumothorax but does not exclude the possibility of smaller pneumothoraces.
    
    \rThe traditional cardiac acoustic windows obtained are:
    \r1. Anterior Chest.
    \r2. Lateral Chest Wall.
    \r3. Costophrenic Angle.
    
    \rTechnique:
    \rProbe Indicator: Indicator facing cephalad.
    \rBegin with the transducer over the 3rd or 4th ICS, midclavicular. The depth should be shallow initially to evaluate lung sliding, and approx. 13-15 cm deep for the rest of the exam. The sonographer should immediately be able to identify at least two ribs and the pleural line.
    \rIn a typical scan, A-line lines, lung sliding, and the presence of the "bat wing" sign should be immediately visible. The body of the bat should represent the pleural line, and the wings serve as the two adjacent ribs. To observe lung sliding, use the M-mode.
    \rA-Lines: These horizontal artifactual lines are produced by a reflection and duplication of the pleural line which is parallel, deep and equidistant from the pleural line which represents normal aeration of the lung. Usually seen in normal "dry."
    \rBelow you can see an overview of the anterior thoracic window view. Notice the "bat wing" sign.
    
    """
    
    
    case Pelvic =
    """
    The pelvis is the most dependent part of the peritoneal space and the most likely place to appreciate free fluid. The pelvic view is used to evaluate free fluid around the bladder and the pouch of Douglas. Although it is essential for the bladder to be filled in order to fully evaluate the pelvis, with an empty bladder, it is harder to detect free fluid. Also, try to get an image before a Foley catheter is placed.
    
    \rTechnique:
    \rProbe Indicator: 2 Views: Longitudinal (Cephalad) and Transverse (to the patients right).
    
    \rBegin with the probe midline in the abdomen and approx. 2 cm above the symphysis pubis with the indicator pointing cephalad. Scan the pelvic region until the bladder comes into view. It is easily identifiable due to the anechoic urine in the bladder. Sweep the entire bladder and look everywhere as free fluid can collect anywhere in the pelvis.
    
    \rRotate the probe 90 degrees transverse and sweep left to right. In males, free fluid usually will collect in the rectovesical pouch (between the bladder and prostate). In females, in the pelvic Cul de Sac (posterior to the uterus in females).
    \rSometimes, seminal fluid can be mistaken for free fluid in males. In females, ovarian cysts, fibroids and physiological fluid such as menstruation and infection can be mistaken as well.
    
    """
    
    
    
}//End Enum




//MARK: - Abnormal Enum
enum AbnormalFindings: String {
    
    
    // Right Upper Quadrant
    case RUQ = """
    Concerning findings in the RUQ should be consistent with solid organ injuries and hemoperitoneum.
    
    1) Hemoperitoneum: When there is a suspected hemoperitoneum,  the sonographer will notice an anechoic (black) region usually in the Morison's pouch, between the liver and kidney. If there is free fluid (jet black) in Morison's pouch, it should be seen around the lower edge and tip of the liver.
    
    2) Solid Organ Injuries: Look for lacerations to the liver and kidneys as well as ruptures.
    
    \rPositive FAST & Stable patient -> Send to CT
    \rPositive FAST & Unstable patient -> OR
    \rNegative FAST + Stable patient, low MOI -> Observe and consider serial exams to monitor.
    """
    
    
    // Left Upper Quadrant
    case LUQ = """
    Concerning findings in the LUQ should be consistent with solid organ injuries and/or hemoperitoneum.
    
    1) Hemoperitoneum: When there is a suspected hemoperitoneum, the sonographer will notice an anechoic (black) region around the spleen usually at the inferior and superior poles of the left kidney between the spleen and diaphragm.
    \rDue to the phrenicocolic ligament blood is restricted to flow down the paracolic gutter, so it collects in perisplenic space. Also, a fluid collection can be appreciated in the pleural and subdiaphragmatic spaces as well.
    
    2) Solid Organ Injuries: Look for renal and splenic lacerations as well as ruptures.
    
    \rPositive FAST & Stable patient -> Send to CT
    \rPositive FAST & Unstable patient -> OR
    \rNegative FAST + Stable patient, low MOI -> Observe and consider serial exams and monitor.
    """
    
    case Cardiac = """
    
    \rConcerning findings in the cardiac views should be consistent with cardiac asystole, pericardial effusions, cardiac tamponade, and hyperdynamic activity:
    
    \r1) Cardiac Asystole: Cardiac stand still. No activity present.
    
    \r2) Pericardial Effusion: Fluid in the pericardium will appear anechoic (jet black) between the RV and pericardium. As more fluid collects in the pericardium, it will fully surround all four chambers. Increasing intrapericardial pressure leads to increased pressure on the RV which restricts RV filling - followed by decreased LV filling and stroke volume.
    
    \r3) Cardiac Tamponade: Defined when pericardial effusion pressure exceeds atrial and ventricular pressures, coupled with a dilated IVC (which overall inhibits cardiac filling). Although considered a late finding, the clinician will also see septal bowing or flattening towards the LV.
    
    \rNote: In those patients who are hypotensive with ventricular collapse, consider a pericardiocentesis.
    """
    
    case Thoracic =
    """
    \rConcerning findings in the thoracic view should be consistent with B-lines, pleural effusions, pneumothorax, and consolidation:
    
    \rB-Lines: These are laser-like verticle lines that arise from the pleural line down to the bottom of the screen that moves with normal respiration. This is indicative of alveolar-interstitial syndrome.
    
    In those patients with pulmonary edema, the frequency of B-lines correlates with the severity of the edema. They can also be used to monitor the effectiveness of therapy.
    
    \rPleural Effusion: Pleural effusions will show as an anechoic (jet black) collection observed at the costophrenic angle above the diaphragm (diaphragmatic recess) when the probe is in the posterior axillary line.
    
    \rBarcode Sign: A.k.a stratosphere sign. In the M-mode, barcode sign represents absent lung sliding which is indicative of a pneumothorax at the intercostal space.
    
    The sonographer will see a continuous pattern of linear lines that extend from left to right, parallel to the hyperechoic pleural line. The sandy beach appearance will be a continuance of the linear pattern of lines viewed in the chest wall.
    
    """
    
    case Pelvic =
    """
    \rConcerning findings in a pelvic scan can be dependent on the orientation of the probe and the gender of the patient.
    
    \rIn females, initially fluid will collect in the pouch of Douglas, posterior to the uterus in the pelvic Cul De Sac, also posterior and lateral to the bladder and posterior to the uterus.
    
    \rIn males, fluid tends to collect posterior to the bladder in the rectovesical pouch (the potential space between the bladder and prostate), and superior to the bladder.
    """
    
    
} // End of extension




