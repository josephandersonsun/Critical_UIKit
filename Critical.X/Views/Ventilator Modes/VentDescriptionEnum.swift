//
//  VentDescriptionEnum.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/30/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation

enum VentilatorModes: String {
    
    //Assist Control
    case AC =  """
    What to know: Assist control or (A/C) is a term used to describe a mode of ventilation similar to Control Mode Ventilation (CMV), in which the patient can trigger breaths above and over the ventilatory rate set by the ventilator. Depending on the brand of the ventilator, you will see CMV with assist or AC.
    \rThe ventilator delivers a preset number of breaths per minute, regardless of patient effort, thus the control in the name assist control. If the patient wishes to take more than the preset number of breaths, they can- This is the (assist) part.
    \rWhen the patient triggers a breath, it will deliver a breath that contains the full set volume or pressure, at the provider selected inspiratory time. If the patient is over breathing the set rate consistently, air trapping can occur in this mode as a patient may trigger additional breaths before the full exhalation has occurred.
    \rDisadvantages to A/C: 1. Auto-PEEP: In those who are tachypneic and don't have enough time to exhale. 2. Ventilator-Induced Lung Injury (VILI) from volutrauma- over inflation of the alveoli. Consider having pre-set TV ranges 6-8 mL/Kg. Reference the IBW calculator for suggested starting tidal volumes. 3. Asynchrony: the patient desired flow rate/inspiratory time is different than what has been set been selected by the clinician.
    \rBottom Line:🎖 When the ventilator is set at a rate of 14, the ventilator will deliver 14 guaranteed breaths (controlled breaths) per minute - even if the patient does not make any effort. When the ventilator senses an effort from the patient, it will deliver additional breaths (assisted breaths) above and over the set rate. These additional breaths will be the full volume or pressure, and inspiratory time selected by the clinician.
    """
    
    
    //APRV
    case APRV =
    """
    What to know: Airway Pressure Release Ventilation (APRV) is a ventilation mode developed in the late 1980s, and trademarked by Drager. It is also referred to as Bi-level or Bi-Vent. APRV is a variation of CPAP that releases pressure temporarily on exhalation. It is pressure controlled, inverse ratio ventilation that achieves I: E ratios that conventional modes cannot perform.
    \rAPRV utilizes a prolonged breath at a set pressure, providing lung inflation/recruitment. PEEP is implemented by intentional air-trapping (Auto-PEEP), to sustain the recruitment. Since T-Low controls PEEP. It does not add to the P-High, allowing lower peak airway pressures than conventional PCIRV.
    \rThere are four basic settings that need to be set initially:
    \rP-High, T-High, P-Low, and T-Low.
    \r1. P-High: This is the pressure used to recruit the alveoli. It's the CPAP. The higher the P-High, the higher the peak pressure, and thus mean airway pressure (oxygenation). This is typically set 3-5 cmH2O above the mean airway pressure on the conventional mode.
    \r2. T-High: This is the inspiratory time. Since conventional respiratory rates are typically 8-12 breaths per min, the T-high is set to approx: 4.5-6 seconds to compliment the normal rate. A longer T-High can improve oxygenation but may cause hypercapnia, by ultimately decreasing respiratory rate. If V/Q mismatching is improved, ventilation likely will increase.
    \r3. P-Low: This is the pressure that the ventilator will drop to, during the release phase (T-low). This is set to zero, to provide minimal resistance to exhaled gas, facilitating CO2 removal.
    \r4. T-Low: This is the time spent at pLow. Usually, this is set to 0.3-0.8 seconds. This brief period is just enough time to allow for exhaled gas to escape (CO2 removal) while preventing de-recruitment. T-Low should be set to trap 50-75% off the peak expiratory flow rate, for suitable auto-PEEP.
    
    """
    
    // BIPAP
    case Bipap = """
    What to know: Non-invasive ventilation is a method of breathing support that does not require the insertion of an ETT tube. BiPAP stands for Biphasic Positive Airway Pressure. Other names for BiPAP include bilevel ventilation, non-invasive ventilation, non-invasive positive pressure ventilation or NIPPV. BiPAP is provided through a tightly fitted mask. The mass will cover the nose and the mouth.
    \rA softly inflated rim around the edge of the mask creates a tight seal to maintain the level of positive pressure.
    \rWhen the patient attempts to breathe, a flow of air is introduced towards the patient's mouth or nose (creating the upper-pressure level). As the patient breathes in, the flow of air assists the patient's breathing by making it easier to take a significant breath.
    \rWhen the patient exhales, a minimum level of air pressure is trapped within the mask creating the lower pressure level.
    \rThis minimum pressure helps to keep disease airways and alveoli from collapsing. BiPAP can be useful for some patients by giving them enough support to avoid the need for mechanical ventilation. Noninvasive ventilation does not provide enough support for very sick patients. Thus, invasive mechanical ventilation is required.
    \r Suggested Settings:
    \r• IPAP = 10-16 (max 25) cmH20
    \r• EPAP 4-6 (max 10) cmH20
    \r• Titrate the SpO2 to be greater than 92%
    \r• If ventilation needs to be improved, increase the IPAP
    \r• If oxygenation needs to be improved, increase the FiO2 or the EPAP in increments of 2 and keep the PSV > 5.
    \r• Note: When increasing the EPAP, make sure to increase the IPAP by the same amount, to ensure the same ratio of pressure support.
    \rBottom Line:🎖 BiLevel provides two pressure levels (IPAP and EPAP). IPAP = Inspiratory positive airway pressure which controls the peak inspiratory pressure during inspiration and EPAP = Expiratory positive airway pressure which controls the end-expiratory pressure. An inspiratory pressure is set, and the patient triggers a breath allowing them to breathe.
    \rWhen EPAP = IPAP, it is used as CPAP. When the IPAP > EPAP, EPAP is used as PEEP (which is the pressure maintained at the end of exhalation).
    """
    
    
    
    //IMV
    case IMV = """
    What to know: This mode of ventilation was initially created for neonates who had respiratory rates that exceeded 40 bpm. It was also made to address issues with those who were tachypneic on AC.
    \rIMV only provides partial ventilatory support where the patient is allowed to breathe between assisted breaths. However, they are not synchronized to the pre-set rate. Spontaneous breathing helps with auto-PEEP, hyperinflation and muscle atrophy in the chest.
    \rDisadvantages to IMV: This mode can decrease cardiac output and increase the work of breathing, and lead to breath-stacking.
    \rBottom Line:🎖 A set number of breaths and TV is set for a minute. Patients can breathe freely between each breath, but the ventilator does not make any attempt to synchronize those spontaneous breaths with mandatory breaths as in SIMV. Avoid this mode with those who have LV dysfunction of chest muscle weakness. Most modern ventilators do not offer IMV as a selection.
    """
    
    //CPAP/PS
    case CPAP =
    """
    What to know: Continuous Positive Airway Pressure, CPAP, allows for a constant pressure to be maintained above atmospheric pressure throughout the respiratory cycle. The patient must be able to generate a breath to use this mode.
    \rTo start set the ventilator respiratory rate is adjusted to zero so that no control breaths are delivered during the cycle.
    \rA CPAP of 5 cmH20 is traditionally started to maintain pressure above atmospheric pressure. CPAP can be provided alone or in combination with pressure support ventilation.
    \rDuring spontaneous ventilation, the patient receives a constant CPAP above atmospheric pressure augmented with a preset pressure support ventilation during each spontaneous breath. Increasing the CPAP level can improve alveolar stability, and improve oxygenation. Adding pressure support (PS) to CPAP can improve ventilation (CO2 removal).
    \rBottom Line:🎖 A CPAP 5 cmH20 plus pressure support ventilation of 10 cmH20. CPAP by itself or in combination with pressure support is the primary mode used to promote spontaneous ventilation to wean patients from mechanical ventilation.
    \rRemember, the patient must be able to spontaneously breathe on their own. Placing an apneic patient on CPAP will cause the patient to code.
    """
    
    
    
    case IRV = """
    What to know: Inverse Ratio Ventilation is a subset of pressure control ventilation in which the inspiratory time is longer than the expiratory time. IRV's primary indication is in patients with ARDS with refractory hypoxemia or hypercapnia.
    \rA normal I: E ratio is 1:3. However, in IRV, the ratios: 1:1, 2:1, or 3:1 may be used. These increase mean airway pressure, peak airway pressure, and plateau pressure.
    \rThe result may improve oxygenation, but at the expense of compromising venous return and cardiac output. It also may lead to very high plateau pressures - thus is not clear that this mode of ventilation leads to improved survival.
    \rBottom Line:🎖 IRV is very effective in those with decreased Functional Residual Capacity (FRC), which is the amount of air present in the lungs at the END OF EXPIRATION.
    \rInverse Ratio Ventilation does not allow for a spontaneous breathing patient and requires that the patient is heavily sedated and paralyzed.
    \rThis mode can lead to air trapping, and all patients should be paralyzed and sedated while using IRV.
    
    """
    
    
    
    
    // PCV
    case PCV = """
    What to know: Pressure Control Ventilation is a pressure – limiting, time – cycled mode in which a constant pressure is maintained throughout the preset inspiratory time (I – time).
    \rSimply put, the pressure is the endpoint rather than volume. The delivered tidal volume will be based on the pressure level, and the lung compliance and airway resistance of the patient.
    \rWhen a pressure controlled breath is delivered, airway pressure and intrapulmonary pressure equalize, creating a tidal volume. The ventilator maintains this inspiratory pressure until the end of the inspiratory time, then exhalation occurs.
    \rClinicians often change the ventilation mode from volume controlled (CMV, A/C, or SIMV) to pressure control ventilation if adequate ventilation or oxygenation goals are not achieved. Or, if excessive peak airway pressures are required to optimize gas exchange.
    \rPatients with Acute Lung Injury (ALI) or Acute Respiratory Distress Syndrome (ARDS) often require pressure control ventilation. This is primarily due to the difficulties in optimizing ventilation/perfusion goals with conventional volume control modes.
    \rSuggested Settings: Consider switching to pressure control when the PIP approximates 30 cmH20 on 10 PEEP.
    \r• Obtain a baseline ABG.
    \r• In PC, maintain the same tidal volume, respiratory rate, FiO2, I: E ratio and PEEP settings as previously set in volume.
    \r• Setting the pressure: There are a few ways to get to the set delta (pressure).
    \r1. The delta (pressure) is obtained taking 75% of the difference between the sum of the Ppeak and PEEP, while the patient is on volume control.
    \rFor example, if the Ppeak is 42 and the PEEP is 10, the difference is 32. 75% of 32 is a pressure of 24. Therefore, the initial delta is 24 cmH20.
    \r2. Delta + PEEP = Ppk = (32 + 10 = 42)
    \r3. Delta = Ppk - PEEP = (32 = 42 - 10)
    \rIncrease the delta until the desired exhaled tidal volume (Vte) is obtained. Adjust based on the ABG results. As compliance changes, so will the tidal volume. Be mindful that Ppk = Pplt in PCV mode.
    \rBottom Line:🎖 Pressure is the control variable, rather than the volume. Inspiration ends when the inspiratory time ends. A preset pressure is set and is delivered constantly throughout inspiration. Breaths are delivered at a preset rate. As compliance and resistance changes, tidal volumes change (Compliance = volume/pressure).
    
    """
    
    
    
    // PRVC
    case PRVC = """
    What to know: Pressure Regulated Volume Control is a dual-controlled ventilation mode in which the ventilator tries to achieve the set volume by managing delta (driving) pressure (and thus flow). It combines the advantages of PCV and AC.
    \rThe breaths can either be controlled or assisted by the ventilator. Constant pressure is applied during inspiration regardless of whether the breath is assisted or controlled which results in improved oxygenation due to the decelerating inspiratory flow pattern. Some newer ventilators offer a PRVC/SIMV mode, which allows pressure support to be added during spontaneous efforts.
    \rDisadvantages are that this mode is less suitable for those who have high airway resistance (asthma) or severely low lung compliance (ARDS). The tidal volumes are variable, and patient effort is intermittent. PRVC can promote asynchrony in patients that have a high inspiratory flow demand – the patient wants more, and the machine will deliver less. Finally, the pressure delivered is solely based on the last tidal volume delivered.
    \rBottom Line:🎖 PRVC can prevent hypoventilation, limit volutrauma/barotrauma, and guarantee a more consistent tidal volume by managing the pressure during inspiration, in the face of increased/decreased pulmonary compliance or resistance.
    \rOn some ventilators, the first breath is volume controlled, and the machine performs an inspiratory hold to determine plateau pressure. Other ventilators will begin with a preset pressure control level. After that, the ventilator estimates the pressure/volume relationship for each breath and adjusts the level of pressure control to maintain exhaled tidal volumes.
    \rThe subsequent breaths will be PC, and thus the Pplat. PRVC modes have a built-in pressure limit (pop-off, or release) – depending on the ventilator, the pressure limit is 5 or 10 cmH2O below the peak airway pressure alarm setting. This is a safety mechanism within the mode, that attempts to blunt high airway pressure and tidal volumes, thus limiting volutrauma/barotrauma.
    \rAlthough there's a constant pressure administered during the breath, the pressure adjusts for each breath as compliance and resistance increases or decreases.
    
    """
    
    
    
    // PSV
    case PSV = """
    What to know: Pressure Support Ventilation can be used alone or added to SIMV. This mode of ventilation is designed to deliver ventilatory support by augmenting the tidal volume and decreasing the work of breathing of a patient while maintaining gas exchange, thus increasing overall comfort.
    \rIt does not provide full ventilatory support (unless pressures are at high levels - see below) and allows the patient to control their respiratory rate, and partially the inspiratory time and tidal volume, thus, allowing the patient to breathe in somewhat of a physiological way.
    \rThe patient needs to be spontaneously breathing on their own in this mode. A negative pressure effort or flow sensitivity triggers each breath. This mode is standard in weaning the patient off the ventilator by augmenting pressure and decreasing the work of breathing.
    \rWhen the patient triggers a breath, the ventilator delivers a preset inspiratory pressure around 5-20 cmH20, typically. The achieved tidal volume will be based on patient effort, lung compliance, and airway resistance. PEEP is applied during exhalation, which overall decreases the patients work of breathing.
    \rBottom Line:🎖 A preset inspiratory pressure is set which assists the patient's ventilatory effort. Every breath is assisted, and the pressure support is terminated at the end of inspiration. Only a back-up RR rate is set in the event of apnea.
    \rThe patient determines the TV, inspiratory time, flow and respiratory rate. Neither the tidal volume or minute volume is guaranteed. If there's a need to change the TV or MV, the pressure needs to be adjusted. Low-pressure support levels (5-10) usually are sufficient for a patient to overcome any resistance. When pressures are higher (10-40 cmH20) it can function solely as a ventilation mode.
    
    """
    
    
    
    // SIMV
    case SIMV = """
    What to know: Synchronized Intermittent Mandatory Ventilation (SIMV) combines breaths and supported breaths. The mandatory breaths can either can be volume or pressure controlled, or PRVC.
    \rIn this mode, the patient is allowed to breathe spontaneously. The ventilator will deliver a mandatory breath in synch with the patients breathing effort.
    \rThere's an assist window that the ventilator sets to look for spontaneous breathing. If no breath is detected, then a mandatory breath will be given.
    \rCaveat: This is all good if the patient is healthy and strong however, most intubated patients in the ICU are not. It’s easier for these patients to breath faster, rather than take adequate deep breaths.
    \rTherefore, the quality of breaths that are taken over the set rate is usually inadequate and lead to a higher work of breathing. Adding pressure support can normalize spontaneous tidal volumes, and decrease tachypnea.
    \rBottom Line:🎖 SIMV will act exactly the same as A/C in paralyzed/heavily sedated patients. If the ventilator settings are set a TV 550 and a RR 12, the patient is guaranteed 12 breaths per/min at 550 mL's.
    \rFor any additional breaths over the set rate, the patient will receive the set level of pressure support, and tidal volume will be based on patient effort, airway resistance, and lung compliance.
    
    """
    
}
