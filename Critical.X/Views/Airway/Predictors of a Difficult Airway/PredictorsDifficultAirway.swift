//
//  PredictorsDifficultAirway.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 12/22/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
// Close button Outlets


class PredictorsDifficultAirway: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// Closes the different view Controller
    @IBAction func closeRODS(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("RODS View Controller was dismissed")
        
    }

    @IBAction func closeMOANS(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("MOANS View Controller was dismissed")
        
    }
    
    @IBAction func closeSHORT(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Short View Controller was dismissed")
        
    }
}
