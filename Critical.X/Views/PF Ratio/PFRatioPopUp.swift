//
//  PFRatioPopUp.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/5/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class PFRatioPopUp: UIViewController {

    @IBOutlet weak var effectViewBlur: UIView!
    var effect:UIVisualEffect!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 0.4) {
            
            self.effectViewBlur.transform = CGAffineTransform.identity
        }
       

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dissmissPopUp(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View PF Ratio PopUp Controller was dismissed")
        
    }
    
}
