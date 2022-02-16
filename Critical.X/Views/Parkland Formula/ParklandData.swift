//
//  ParklandData.swift
//  Parkland Formula
//
//  Created by Jadie Barringer III on 1/10/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class ParklandData: UIViewController {

    @IBOutlet weak var ruleofNineLabel: UILabel!
    @IBOutlet weak var ruleOfNineDataView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let ruleofNinesText = "For adults:\n\nArms - 9%, Legs - 18%, Head - 9%, Torso (front) - 18%, and Torso (back) - 18%\n\n\nFor children:\n\nRelative to their weight, they have larger Total Body Surface Areas compared to Adults.\n\nArms - 9%, Legs - 14%, Head - 18%, Torso (front) - 18%, and Torso (back)"
        // Do any additional setup after loading the view.
        
        ruleofNineLabel.text = ruleofNinesText
        
        ruleOfNineDataView.clipsToBounds = true
        ruleOfNineDataView.layer.cornerRadius = 10
    }

   
    

    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
    }
    

}
