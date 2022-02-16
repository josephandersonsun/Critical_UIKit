//
//  12Lead_InformationData.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/9/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


    
    enum EKGDescription: String {
        
        case Overview = """
        \rReading 12 lead EKG's should be methodical, like reading chest x-rays. Below, we'll talk about the different morphology of the rhythm strips and how to assess each complex.
        \rIn a 12 lead EKG, there are 3 limb leads (bipolar), 3 augmented limb leads (unipolar) and 6 precordial leads (v1-v6).
        \rLimb Leads (Bipolar): Consist of leads I, II, and III. There are 2 electrodes (- and +) that are equidistant from the heart and the signal moves towards the + lead- producing a positive-upright deflection on the tracing.
        \rAugmented Limb Leads (Unipolar): This consist of aVR, aVL, and aVF. Ironically, these letters all mean something. the "a" = augmented. The "V" = voltage and the "R,L'F" = right arm, left arm and left leg, respectively. These leads pick up electrical activity from the center of the heart towards the + lead - For example; aVR = center of the heart to the right arm etc..
        \rPrecordial Leads (V1-V6): Precordial refers to the area in the thorax in front of the heart. The letter "V" refers to unipolar, and the corresponding number refers to the location on the precordium. V1 looks at the RV, V2 & V3: Ventricular Septum, V4: Apex of the heart, V5 & V6: Left Ventricle and lateral wall of the heart.
        \rAs in single lead EKGs, there are a few things that we should overall assess while
        looking at the tracing.
        \r 1. Is the atrial and ventricular rate regular?
        \r 2. Are there a P-wave for every QRS complex, and are there T waves?
        \r 3. Is the PR-Interval and QRS complex prolonged or wide?
        \r 4. T-wave morphology normal
        \r 5. Presence of any PVCs, PJCs, or PACs?
        \r 6. Examine the axis and determine where is the rhythm originating from: Atrial, Ventricular, Junctional, Paced?
        \r 7. Make a differential interpretation.
        \rMorphology assessment
        \rP-wave: The P-wave should always be positive in leads II, III, and aVF. If not, then it should not be considered a sinus rhythm. When looking at the precordial leads (V1 – V6), at times, the P waves can be biphasic in V1 (which is negatively deflected) no more than 1 mm.
        \rIn a sinus rhythm, the P wave is always positively deflected in lead II. Biphasic P waves can be physiological in lead I. This is mainly from the negative deflection that's caused when the atrium is depolarized, and the vectors are directed away from V1.
        \rWhen the P waves don't depolarize simultaneously, double P waves are observed on the tracing. This can also represent left or right atrial enlargement.
        \rPR Interval: The PR interval should be between 0.12 – 0.20 seconds in all of the leads. Any increase in the duration of the PR interval could suggest a heart block. You can read more about the details of the different blocks in the EKG section.
        
        QRS complex: The QRS complex is the most visible part of the tracing which is comprised of three graphical deflections that represent depolarization of the ventricles. Typically, the duration should be less than 0.12 seconds. Any prolongation of the QRS complex can denote left or right bundle branch blocks, aberrant conductions, intraventricular disturbances or pre-excitation syndromes, i.e., Wolf-Parkinson-White (WPW).
        \rWith respects to the voltage, high-voltage QRS complexes represent ventricular hypertrophy ( R wave > 35 mm in the precordial leads). Conversely, low-voltage QRS complexes can be indicative of COPD, pericardial fusions, pleural fusions, or just a normal variant. The axis should be normal, or physiological left - in the limb leads between –30° to 90°.
        
        ST Segment: ST elevation is measured at the J point. Usually, it should be flat and isoelectric. It should travel along the baseline. In the population, benign ST elevation is quite common especially in V2 – V6. Variation of the J point can be indicative of early repolarization or Brugada Syndrome – which is talked more about in the Brugada section.
        \rIn normal individuals without ischemic events, concave ST elevations are common. ST elevation characteristically, in the event of ischemic events can be convex, upsloping, downsloping or horizontal.
        \rThese changes can be indicative of STEMI, but also can be indicative of other pathological issues such as bundle branch blocks, coronary vasospasm's, ischemic events, Hyperkalemia, Aortic dissection's, Takotsubo's cardiomyopathy and Pulmonary embolisms alike.
        \rConversely, ST depression is not common and is recognized in the chest leads less than 0.5 mm. any ST depression identified can be indicative of ischemia, bundle branch blocks, left or right ventricular hypertrophy, heart failure.
        
        T Wave: The T wave should be concordant (in the same direction) as the QRS complex; however, it's acceptable to be inverted and lead V1 and also lead III.
        \rDeep T wave inversions in V2-V3 (may extend to V1-V6) without ST-segment changes should be concerning for Wellen's syndrome. Inversions that coincide with ST-segment elevation/depression should be concerning for myocardial ischemia.
        \rPeaked T waves are associated with hyperkalemia, but also can be associated with ventricular hypertrophy, myocarditis or bundle branch blocks.
        """
        
        case MIRegions  =
        """
        Overview
        The basic regions of the heart where myocardial infarctions can occur are the inferior wall, posterior wall,
        lateral wall, septal and anterior walls of the heart.
        """
        
        case LeadAxis =
        """
        Overview: The cardiac axis generally can be frustrating to learn. Simply put, the electrical axis is the direction in which the electrical activity flows through the heart.
        \rAlthough there are several different ways of determining the cardiac axis, we will illustrate the normal axis by comparing the impulse direction of depolarization to the clock position.
        \rWhen looking at the heart from the front, the general direction of the depolarization should go from roughly the 11 o'clock position (where the SA impulse arises) to the 5 o'clock position.
        \rRemember that the heart is rotated in the chest which places the apex at the 5 o'clock position, which is directed towards lead II, lead I is directed towards the 3 o'clock position, and lead III is directed towards the 7 o'clock position.
        \rThis is a normal cardiac axis (2 o'clock - 6 o'clock. One of the most critical factors in determining the appropriate axis of the heart is making sure that the leads are placed correctly.
        \rThe limb leads should be placed on the limbs. That means, the LLQ is not an appropriate substitute for the LL  electrode.
        \rThe Breakdown
        To correctly determine the axis, we will be looking at leads I, II, and III. In each of these
        leads, there can be a ⬆︎ positive (upright) deflection, ⬇︎negative (downward) deflection or ⬇︎⬆︎ biphasic
        (both positive and negative) deflection.
        \rNormal Axis
        This is the easiest one. As the impulse travels from 11 o'clock to 5 o'clock,  A positive deflection will be recognized in all the leads.
        \rLeft Axis Deviation
        LAD typically is a result of an electrical conduction issue and is classified into two subcategories:
        Physiological left axis deviation (normal), and pathological left axis deviation (abnormal).
        \rIn both cases, lead I will remain ⬆︎ upright and positive and lead III will be ⬇︎ negatively deflected, while the changes occur in lead II.  When the axis shifts slightly to the left (towards the 2:30 position), this is categorized as physiological.
        \rYou will notice that lead II can be either ⬆︎ upright or ⬇︎⬆︎ biphasic.  When the impulse shifts pathologically (towards the 12:30 - 1 o'clock position), lead II and III will change to denote a ⬇︎ negative (downward) deflection on the tracing.
        \rLAD causes include LVH, LBBB, Inferior Wall MI, WPW, and Left Anterior Fascicular blocks.
        
        Right Axis Deviation
        All right axis deviations are considered pathological, except in newborns. The impulse moves away from the positive lead, which is lead I and moves towards the 7 o'clock position (which is lead II).
        \rAs a result, lead I is negative ⬇︎. Lead II is either, negative, positive or biphasic ⬆︎,⬇︎⬆︎,⬇︎. Lead III ⬇︎ is deflected negatively.
        
        RAD causes include: RVH, Cor pulmonale, PE, COPD, Pulmonary htn, lateral wall MI, left posterior fascicular blocks, or switched lead placement.
        
        Extreme Right Axis Deviation
        In cases of extreme right axis deviation, the impulse originates at the opposite end (apex) of the heart and moves towards the right shoulder ( 11 o'clock position). As a result, all leads will be negatively deflected.
        \rERAD causes: Misplaced electrodes or ventricular arrhythmias, i.e., Ventricular Tachycardia.
        
        The Main Point
        Normal Axis-
        Lead I:⬆︎ Lead II:⬆︎ Lead III:⬆︎
        \rPhysiological Left Axis Deviation (LAD)
        Lead I:⬆︎ Lead II:⬆︎,⬇︎⬆︎ Lead III:⬇︎
        \rPathological Left Axis Deviation
        Lead I:⬆︎ Lead II:⬇︎ Lead III:⬇︎
        \rRight Axis Deviation (RAD)
        Lead I:⬇︎ Lead II:⬆︎,⬇︎⬆︎,⬇︎ Lead III:⬇︎
        \rExtreme Right Axis Deviation (ERAD)
        Lead I:⬇︎ Lead II:⬇︎ Lead III:⬇︎
        """
        
        case AnteriorWall =
        """
        WHAT TO KNOW
        The anterior wall of the heart is supplied by the left anterior descending artery (LAD), which is a branch of the LCA - Left Coronary Artery.
        \rLesions of the LAD have detrimental prognostic outcomes and are associated with serious left ventricular damage, mostly due to the larger infarction area.
        \rINFARCTION PATTERNS
        Generally, infarctions that are more than 40% of the LV will result in cardiogenic shock.
        \rAnterior infarctions patterns can expand to the septal and lateral portions of the wall.
        \rMainly there will be ST segment elevation, prominent Q wave formation in the precordial leads
        (V1-6) and/or the high lateral leads (I and aVL).
        \rReciprocal ST depression in the inferior leads (mainly III and aVF).
        \r• Anterior = V2-5
        • Anteroseptal = V1-4
        • Anterolateral = V3-6, Lead I + aVL
        • Extensive anterior / anterolateral = V1-6, Lead I + aVL
        • Progressive loss of R wave progression.
        
        \rThe tracing above shows an Anterolateral infarction. Notice the ST elevations in leads V2-V5
        """
        case InferiorWall =
        """
        WHAT TO KNOW
        \rInferior Wall MI's are common. Approximately 40-50% of all MI's come from the inferior wall. 40 % of all inferior wall MI's will have RV involvement.
        \rDuring an inferior wall MI, the culprit vessels are either the RCA or LCx.
        \rThe RCA territory covers the medial part of the inferior wall, including the inferior septum.
        \rThe LCx region covers the lateral part of the inferior wall and the left posterobasal area. The right coronary artery usually supplies this part of the heart.
        \rIn approximately 20% of all of these cases, the circumflex artery wraps around and supplies the inferior wall. Rarely, an inferior wall MI will involve a type III wrap around of the LAD.
        """
        case LateralWall =
        """
        WHAT TO KNOW
        \rLateral wall infarctions occur in the lateral part of the left ventricle. This usually is caused by occlusions in the diagonal branch of the left anterior descending (LAD) or the left circumflex artery (LCx).
        \rINFARCTION PATTERNS
        Anterolateral STEMI due to LAD occlusion.
        \rInferior-posterior-lateral STEMI due to LCx occlusion.
        \rIsolated lateral infarction due to occlusion of smaller branch arteries such as the D1, Obtuse marginal or ramus intermedius.
        \rChanges in leads I, aVL, V5, and V6 will have ST-segment elevations. Elevations localized to just leads I, and aVL are referenced to a high lateral STEMI.
        \rReciprocal depression will be noted in the inferior leads. Hypotension, AV blocks and other myocardial damage usually accompany lateral wall MI's.
        """
        case BrugadaSyndrome =
        """
        WHAT TO KNOW
        \rBrugada's Syndrome is a rare autosomal dominant genetic disorder by which a sodium channelopathy occurs. Since there's a direct mutation in the sodium channels, the outcome is usually syncope,  VT / VF arrest, and sudden cardiac death during sleep.
        \rBOTTOM LINE
        \rThere are 3 distinct ST segment changes in the precordial leads, V1-V3 that should be noted in individuals with suspected Brugada's Syndrome.
        \rType I: Lead V1 has a “coved” ST-segment elevation of at least 2 millimeters, followed by a negative T wave.
        \rType II: There is a “saddleback” appearance of the ST segment in lead V1 with ST-segment elevation of at least 2 mm which can be present in normal individuals as well.
        \rType III: Features of type I (coved) or type II (Saddleback) with less than 2 millimeters of ST-segment elevation.
        """
        case WellensCriteria =
        """
        WHAT TO KNOW
        \rWellen's syndrome is characterized by acute biphasic T waves that are seen in leads V1-V3 or deep symmetric inverted T-waves in V1-V6, I, and aVL without the presence of ST-segment elevation inversions after complaints of angina.
        \rThis is indicative of severe proximal left anterior descending stenosis.
        \rApproximately 10% of patients with acute coronary syndromes will have Wellen's, and out of that 10%, 75% will likely develop a massive anterior wall MI.
        \rPatients have reported having severe angina 24-48 hours prior to the EKG findings.
        """
        case SgarbossasCriteria =
        """
        WHAT TO KNOW
        \rTraditionally it's taught that it's not possible to detect an MI in the presence of a
        left bundle branch block (LBBB).
        \rClinicians frequently confuse ST elevations and ST depression in the presence of a LBBB as a
        STEMI. Usually, there will be ST elevations in leads V1-V2, and depressions and T-wave inversions
        in V5, V6, leads I and aVL.
        \rA left bundle branch block causes substantial changes in left
        ventricular re and depolarization which results in secondary ST-T changes - and
        these changes imitate ischemia.
        \rHowever, Sgarbossa's criteria allow us to detect
        the presence of an acute MI in the presence of a  left bundle branch block through
        a scoring system.
        \rCRITERIA
        \r• ST elevation > 1 mm and in the same direction (concordant) with the QRS complex:  5 points
        \r• ST depression > 1 mm in leads V1, V2, or V3:  3 points
        \r• ST elevation > 5 mm and in the opposite direction (discordant) with the QRS.: 2 points
        """
        
}
