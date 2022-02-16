//
//  VentManagementTVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/9/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class VentManagementTVC: UITableViewController {
    
    
    /**
     Animate Label
     
     - Remark: Animates a UILabel using the AKLabel file.
     - SeeAlso: https://github.com/akshaysyaduvanshi/AKLabel
     - Requires: AKLabel.swift file to function. Need to also change the outlet to the AKLabel subclass.
     - Warning: If the subclass is not changed, or the IBOutlet doesnt reflect the AKLabel as well as importing the label, it will crash.
     **/
    
    @IBOutlet weak var ventManagementSubtitle: AKLabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Create the title to pass throught the animation closure.
        let subtititleText = "Modes of Ventilation and Capnography"
        // animation method that corresponds to the subtitle
        ventManagementSubtitle.animate(text: subtititleText, duration: 1, completion: nil)
    }
    
    // When the view dissappears, clear the text.
    override func viewDidDisappear(_ animated: Bool) {
        ventManagementSubtitle.text = ""
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the navigatin title
        self.navigationItem.title = "Respiratory"
        

    }
    
    
}
