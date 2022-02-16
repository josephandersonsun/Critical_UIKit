//
//  ViewController.swift
//  ACLS Changes 2015
//
//  Created by Jadie Barringer III on 1/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class ACLSChanges2015: UIViewController {
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
   
    
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    
    @IBOutlet weak var blsLabel: UILabel!
    @IBOutlet weak var aclsLabel: UILabel!
    @IBOutlet weak var postCardiacArrestLabel: UILabel!
    @IBOutlet weak var blsView: UIView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.
        scrollHeight.constant = blsLabel.frame.origin.y + blsLabel.frame.size.height + aclsLabel.frame.size.height + postCardiacArrestLabel.frame.size.height +  520
        
        
        print("\(blsLabel.frame.origin.y + postCardiacArrestLabel.frame.size.height +  280) ACLS Height constraint Value")
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //adds a line seperation border to the BLS card view seperating the title form the text.
        //blsView.addBorder(side: .top, thickness: 3, color: Colorify.Niagara, topOffset: 40.0)
        
        
        //MARK: CPR KeyPoints
        blsLabel.text = "• Initiate chest compressions before rescue breaths.\n\n• Use \"Compressions, Airway, Breathing rather than A-B-C\" algorithm to reduce delay to the first compression.\n\n• The rescuer should begin CPR with a 30:2 ratio.\n\n• Allow for complete chest recoil, minimize interruptions and avoid excessive ventilation.\n\n• Compression rate was modified to 100 to 120/min.\n\n• Compression depth for adults should be at least 2 inches - not to exceed 2.5 inches.\n\n• Allow full chest wall recoil after each compression.\n\n• Passive ventilation may be considered.\n\n• For patients intubated and undergoing CPR, a ventilation rate of 1 breath q 6 seconds (10 breaths per minute) is recommended."
        
        
        
        //MARK: ACLS KeyPoints
        aclsLabel.text = "• Studies show that vasopressin and epi together offer no advantage compared to single dose epi alone. Vasopressin doesn't offer any benefit over epinephrine. Thus, vasopressin was removed from the 2015 update.\n\n• A low end-tidal CO2 in intubated patients after 20 min of CPR provides a low likelihood of resuscitation. For pronouncement decision making, consider low end tidals after 20 minutes of CPR in conjunction with other factors to help determine when to terminate resuscitation efforts.\n\n• The routine use of lidocaine is no longer recommended.\n\n• Lidocaine drips may be considered immediately after ROSC from v-fib or pulseless v-tach.\n\n• ß-blocker use after cardiac arrest may be associated with better outcomes than when ß-blockers are not used."
        
        //MARK: Post Code KeyPoints
        postCardiacArrestLabel.text = "• Emergent Cardiac Catheterization is recommended for all patients with ST elevation or hemodynamic instability.\n\n• All comatose adult patients with ROSC after cardiac arrest should be placed on hypothermia protocol between 32°C and 36°C - maintained for at least 24 hours.\n\n• Neurological prognostication is now recommended, but no sooner than 72 hours after the patient has been warmed.\n\n• All patients who progress to brain death post-cardiac arrest or whose family members wish to withdraw life support should be considered for organ donation. Please consult with your local protocols to evaluate clinical triggers."
        
    }
    
    let pediatricBLS = "• Initiate chest compressions before rescue breaths.\n\n• Use \"Compressions, Airway, Breathing rather than A-B-C\" algorithm to reduce delay to the first compression.\n\n• The rescuer should begin CPR with a 30:2 ratio.\n\n• Allow for complete chest recoil, minimize interruptions and avoid excessive ventilation.\n\n• Compression rate was modified to 100 to 120/min.\n\n• Compression depth for adults should be at least 2 inches - not to exceed 2.5 inches.\n\n• Allow full chest wall recoil after each compression.\n\n• Passive ventilation may be considered.\n\n• For patients intubated and undergoing CPR, a ventilation rate of 1 breath q 6 seconds (10 breaths per minute) is recommended."
    
    let pediatricPALS = ""
    
    
    
    
    @IBAction func dismissACLS(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    
}//End of the class

