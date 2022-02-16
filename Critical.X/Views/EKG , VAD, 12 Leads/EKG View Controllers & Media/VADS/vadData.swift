//
//  vadData.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 3/2/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation



enum VAD_Explanaton: String {
    
    case Overview = """
    A Ventricular Assist Device (VAD) is a pump that takes blood from the lower ventricles and provides cardiac output for the management of end-stage cardiac failure refractory to aggressive medical therapy, typically bridging a patient to cardiac transplantation.
    \rAlthough they are mainly used as a bridge to transplant, these devices can also be for destination therapy (those who are > 70 y/o who don't qualify for a transplant, and a bridge to recovery – potential reversible myocardial pathology. These patients will have the device for the rest of their lives.
    \rFinally, used as a bridge to recovery. There are two main pumps that are used today:
    \r1) Centrifugal flow: (~2,500 rpm)- This blood flow is similar to bypass, the blood path is perpendicular to the rotor. These are mainly used as a bridge to transplant and
    \r2) Axial flow: (~10,000 rpm)- Which the pump rotor is parallel to the blood path, can be used for both bridges to transplant and destination therapy.
    
    Things to Know: Due to the continuous flow of blood, pulses may or may not be present.
    \r● Since blood pressures is challenging to obtain, treat the Mean Arterial Pressure. Reduce the cuff pressure until a constant sound is heard. This signifies the mean arterial pressure. Alternatively, in those who are admitted with an arterial line, place an ultrasound-guided arterial line.
    \r● Use a doppler to obtain the MAP. The first sound heart while taking a BP with the doppler will be the MAP.
    \r● EKG's are typically not affected by the VAD.
    \r● 02 saturations may be difficult to obtain due to flow.
    \r● AED's do not affect VAD performance.
    
    Critical Components: It's important to understand the critical components that make up the device[s]:
    \rBatteries:
    \r● The battery powers the pump and the controller.
    \r● Patients carry at least two lithium batteries at all times and are recharged using a standard power supply.
    \rController (Think as the computer):
    \r● Monitors pump parameters like (flow, speed, power)
    \r● Controls pump the speed, flow, and power supply.
    \r● Records information, i.e., pump data and alarms; displays battery life and overall function.
    \r● Allows for data to be downloaded for analysis.
    \rDriveline:
    \r● Connects and provides power to the pump and the controller.
    \r● It is tunneled subcutaneously from the epigastrium or RUQ to the pump.
    \rInflow cannula:
    \r● Stationed inside the left ventricle to direct blood into the pump.
    \rOutflow graft:
    \r● A flexible, gel-impregnated conduit that directs blood from the pump to the ascending aorta.
    \rThe pump:
    \r● The pump is located at the apex of the left ventricle and houses the impeller which is a frictionless rotor which is magnetically levitated.
    \r● Houses the impeller.
    \r● Rotates at speeds of >3000 rpm & can generate up to 10 liters per minute of blood flow.
    \rCritical Pearls for VADs:
    \r● VADs are preload dependent and afterload sensitive. When in doubt, consider a fluid bolus.
    \r● Consider vasoactive agents if
    \r● CPR is controversial as it can dislodge the cannula. Only consider if there's absolute pump failure and the MAP are zero - check connections first.
    \r● Cardioversion is safe.
    \r● 02 saturations may be difficult to obtain.
    \r● Keep the batteries close and dry.
    \r● Always keep the patients emergency travel bag, which has the controller, emergency contact info for the center and extra batteries with the patient.
    \rPump Parameters: Flow, Power, and PI (Pulsatility Index).
    \r● A combination of these three parameters are the primary indicators to whether the VAD is functioning correctly. Let's take a closer look at the metrics.
    \rFlow:
    \r● Flow is not directly measured, but it's directly proportional to the speed and power. As speed/power is increased, estimated flow is increased. Conditions such as rotor obstructions or thrombi on the bearings can display an ambiguous flow parameter.
    \rPower:
    \r● The amount of power used by the pump is determined by the speed at which the pump is running and the flow of blood. As the power of the pump increases, without the change in speed, suspect the presence of a thrombus.
    \rPulsatility Index (PI):
    \r● During the cardiac cycle, PI is a measurement of the extent of the "pulsing" flow through the pump measured over a 15-sec interval. Even a fragile heart will still exhibit some rhythmic contraction-creating somewhat of a pulse pressure unless it's in V-Fib or asystolic.
    \r● PI is affected by LV preload and pump speed. Preload is directly related to PI. Pump speed is inversely related to PI.
    \r● As preload is increased, PI is increased.
    \r● As the pump speed is increased, preload is decreased which subsequently decreases the PI.
    \r Call your nearest VAD or Cardiac Transplant center ASAP to assist with troubleshooting.
    
    """
    // Total HEart
    case TotalArtificialHeart = """
    Overview:
    \rThe total artificial heart is a device used to bypass the cardiac system and replaces native heart function. It's indicated in patients with biventricular heart failure. It consists of two artificial pneumatically driven ventricles which are made from a biocompatible plastic. This prevents rejection from the body. The TAH is capable of producing a stroke volume of 65 mL and CO of 12 L/min.
    \rWhat to know:
    \r● CPR is contraindicated.
    \r● Each ventricle has an inflow and outflow valve that controls the direction of blood.
    \r● Two cannulas attach to two drivelines which connect to an external pump, which is called the driver.
    \r● The pump, which is battery powered and pneumatically driven creates a vacuum that travels through the drivelines to inflate and deflate the diaphragms in the artificial ventricles.
    \r● This pressure pushes blood in and out of the ventricles and creates produces a pulsatile flow that mimics the natural cardiac rhythm- usually at a fixed rate between 120-140 bpm.
    \r● Because of the pulsatile flow, systolic and diastolic blood pressures can be appreciated.
    \r● A cardiac rhythm of asystole will be displayed on the EKG.
    \r● CO < 3.5 L/min is an emergency.
    \r● Defibrillation is ineffective due to the absence of native ventricles.
    
    
    """
    
    
    
    case HeartMateII = """
    Overview:
    \rThe HeartMate II is a second generation -continuous flow axial pump that can generate up to 10 L/min of flow at a pressure of 100 mmHg. It's synchronized with the activity of the heart, follows Frank-Starlings curve, and follows the natural cardiac cycle.
    \rBlood flows through the apex of the left ventricle into the inflow cannula and is delivered to the ascending aorta via the outflow cannula. Flow is determined by the pump speed.
    \rThe HeartMate II is primarily used as a bridge to transplant and also for destination therapy.
    \rWhat to know:
    \r● Perform CPR only when necessary.
    \r● Able to follow all ACLS protocols if necessary.
    \r● External pacing is not prohibited.
    \r● The patient may or may not have a palpable pulse.
    \r● Since this is a continuous flow device, manual cuff pressures may not be obtained. Consider using a doppler to obtain MAP.
    \r● The EKG's aren't affected by the pump. They can be used to rule out fibrillation if the patient complains of not feeling well.
    \r● Pump flows are usually affected by physiological factors that ultimately affect preload/afterload such as hypovolemia, hypotension. Unless these conditions are addressed, pump flows won't be restored.
    \r● Low flow alarms activate due to obstruction to emptying in the pump or poor filling.
    \r● Higher MAP's > 90 may cause too much resistance and forward flow.
    
    
    \rClick below for more troubleshooting information.
    """
    
    case HVAD = """
    Overview:
    \rThe HeartWare HVAD is a centrifugal - continuous flow,  non-pulsatile device designed to draw blood from the left ventricle & propel it through an outflow graft connected to the patient ’s ascending aorta.
    \rThe inflow cannula is inserted within the left ventricle & blood is carried through the pump via an impeller at operating speeds of 2400-3200 rpm (resulting in up to 10 L/min of blood flow).
    \rWhat to know:
    \r● MAP's should not exceed 85 mmHg.
    \r● ACLS protocols can be performed if necessary.
    \r● Patients may be defibrillated/ cardioverted without having to disconnect the pump.
    \r● Perform CPR only when necessary- auscultate heart sounds to see if the VAD is functioning appropriately.
    \r● Blood pressure should be obtained by using a doppler. The first sound heard is the MAP. If no doppler, use the mean on the non-invasive blood pressure machine.
    \r● These patients should be anticoagulated with an INR goal 2-3. Do not d/c any anticoagulation medication without consulting with the implanting LVAD team.
    """
    
    case Impella = """
    Overview:
    \rThe Impella is a short-term micro-axial flow blood pump that is catheter-based used for partial cardiac support.
    \rThis microdevice is placed under fluoroscopy or echo guidance and advanced across the aortic valve.
    \rFrom here, the pump removes blood from the left ventricle and displaced the blood into the aortic root, resulting in increased net cardiac output.
    \rThere are pressure sensors on each end of the catheter that's able to monitor pressure superior and inferior to the aortic valve, which makes it possible to reposition or adjust easily. It's primarily used for cardiogenic shock, STEMI, and low output syndrome.
    \rThe Impella 2.5 has a 12 F catheter and can pump approximately 2.5 L/min of blood at 0-50,000 rpm.
    \rImpella 5, has a 21 F (which requires a cutdown of the femoral artery) catheter generates 5 L/min.
    \rImpella CP has a 14 F catheter 4 L/min of flow.
    \rWhat to know:
    \r● Perform CPR only when necessary- decrease the flow to P-2 (The P level is the speed which ranges from P-0: 10k RPM -P-9: 33K RPM).
    \r● During transport, place the red impella plug and controller at the level of the heart.
    \r● During a flight, monitor the purge pressures.
    \r● Do not raise the HOB greater than 30 degrees as the catheter can reposition.
    \r● Don't attempt to reposition the catheter. This should be done under fluoroscopy.
    \r● If transporting, before leaving, confirm catheter position is correct via echocardiography.
    """ 
    
    //Takes the string of the enum declared in the case above and exectues the String called "the raw.value"
    func display() ->String { return self.rawValue }
    
    
}


