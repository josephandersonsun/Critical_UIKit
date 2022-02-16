//
//  Disclaimer.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 12/4/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

class Disclaimer: UIViewController {

    @IBOutlet weak var disclaimerSubView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /// Rounds the corners 15 pixels of the UIView named: popUpView
        disclaimerSubView.clipsToBounds = true
        disclaimerSubView.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
 

}
