//
//  ComingSoonVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/5/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class ComingSoonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissComingSoon(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Coming soon Controller was dismissed")
        
    }
  

}
