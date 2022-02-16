//
//  ClinicalProceduresTBV.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/9/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class ClinicalProceduresTBV: UITableViewController {

    /**
     Animate Label
     
     - Remark: Animates a UILabel using the AKLabel file.
     - SeeAlso: https://github.com/akshaysyaduvanshi/AKLabel
     - Requires: AKLabel.swift file to function. Need to also change the outlet to the AKLabel subclass.
     - Warning: If the subclass is not changed, or the IBOutlet doesnt reflect the AKLabel as well as importing the label, it will crash.
     **/
   
    @IBOutlet weak var proceduresSubtitle: AKLabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
   
        let subtititleText = "Procedures and Imaging"
        proceduresSubtitle.animate(text: subtititleText, duration: 1, completion: nil)
        
      
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
    }
    override func viewDidDisappear(_ animated: Bool) {
        proceduresSubtitle.text = ""
        
     
    }

    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

 
    
  

}
