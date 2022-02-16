//
//  OBTextDescription.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/28/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation

extension OBCollectionView {
    
    enum fetalDescriptionsText: String {
        
        case normal = """
        \rA normal fetal heart rate range is between 110 and 160 bpm. As the fetus matures, the heart rate will continue to decrease. This includes postnatally as well which is noted due to increased maturation of the vagus nerve.
        \rEach window of interpretation should be approximated at two minutes to evaluate the heart rate. There should be a constant variation from the baseline (variability) which reflects a healthy nervous system, chemoreceptors, baroreceptors, and cardiac responsive. Beat – to - beat, or short-term variability is an important indicator of fetal trouble. As chemoreceptors detect hypoxia, hypercapnia etc., the heart rate compensates thus the change in variability.
        \rLoss of this variability may indicate a pathological process, but also can indicate healthy rest-activity in the fetus or depression of the central nervous system which can be due to medications. Prolonged variability may indicate acute hypoxia or mechanical compression of the umbilical cord.
        """
        
        
        case early = """
        Early decelerations, a.k.a \"head compression\" are caused by fetal head compression during uterine contractions, resulting in vagal stimulation and bradycardia.
        \rThis type of physiological deceleration has a slow onset and similar shape ( which coincides with the \"start\" of the contraction) and a slow return to baseline, (which coincides with the\" end\" of the contraction). The nadir of the deceleration is usually about 30 seconds more after the onset of the deceleration.
        \rThese are seen generally  during active labor. The degree of the early deceleration usually coincides with the strength of the contraction.  The image about is a mirror image of the contraction.
        \rAlthough these decelerations are not associated with fetal distress and are reassuring, they must be carefully differentiated from other non-reassuring decelerations such as hypoxia and acidemia.
        """
        
        
        
        case late = """
        \rLate decelerations also termed as \"uteroplacental insufficiency\" are when the fetal heart rate returns to baseline after the contraction has ended.This represents uterine or placental function. The descent and return are both gradual and smooth. Like early decelerations, this deceleration reaches its nadir within 30 seconds of its onset.
        \rTypically late decelerations are caused by uteroplacental insufficiency or decreased uterine blood flow. This is a non-– reassuring pattern of late decelerations with preserved beat – to - beat variability.
        \rThe second uterine contraction seen above is associated with a shallow and subtle late deceleration. Post date gestation, preeclampsia, chronic hypertension, and diabetes are the likely causes of placental dysfunction.
        \rOther maternal conditions such as acidosis and hypovolemia associated with DKA may lead to decreased in uterine blood flow as well,  which result in late decelerations or decrease baseline variability.
        \rA pattern of persistent late decelerations is not reassuring, and further evaluation of the fetal pH's is indicated. Persistent late decelerations are associated with decreased beat-to-beat variability which is also another ominous sign."
        """
        
        case elevated = """
        Fetal tachycardia is defined as a baseline heart rate greater than 160 bpm minute and is considered a non-reassuring pattern (as seen above). Tachycardia is considered mild when the heart rate is between 160 – 180 bpm and severe when greater than 180 bpm. Tachycardia greater than 200 bpm is usually due to fetal tachyarrhythmia or some type of congenital abnormality rather than just hypoxia alone.
        \rThe most common cause of fetal tachycardia is maternal fever from chorioamnionitis. Others include but are not limited to fetal hypoxia, fetal compromise, maternal infection, hyperthyroidism, maternal or fetal anemia, parasympathetic drugs, atropine, hydroxyzine, sympathetic medications, terbutaline, fetal tachydysrhythmias, hypotension from epidural injection and prematurity.
        \rWandering of the fetal baseline can be indicative of a preterminal event- likely from a neurologically abnormal fetus.
        """
       
        
        case variable = """
        \rThis is the most frequent pattern that you will see during labor.  Variable decels are characterized by sudden and abrupt drops in the fetal heart rate,  usually at the beginning of a contraction with a similar abrupt return to the baseline- reaching a nadir in less than 30 seconds.  You should notice that the decrease must last between 15 seconds and two minutes, it should be greater than 15 ft./m and amplitude.
        \rDepending on the onset,  the deceleration varies typically with the contraction.  The shape of the deceleration can vary widely and may appear as a V, U, or W shape.  They may be either periodic or episodic. Often, there are small decelerations immediately before and immediately following the deceleration  (as you could see above).
        \rThese decelerations are referred to as \"shoulders\". The most frequent reason for variable decelerations is from umbilical cord compression. Initial or mild cord compression will result in occlusion of the umbilical vein, which is larger than the arteries and less rigid, which results in decreased venous return and tachycardia – which augments cardiac output.  This is precisely why you will notice an initial increase in heart rate (shoulder) which proceeds to deceleration.
        Further compression of the umbilical cord leads to occlusion of the umbilical artery resulting in increased sympathetic resistance which is sensed by the baroreceptors resulting in a protective reflex which ultimately slows the heart rate.
        \rAs the cord becomes decompressed, the series of events is reversed.  An acceleration may follow the deceleration before returning to baseline.
        """
    }
    
    
    
    
}
