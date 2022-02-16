//
//  Intubation.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
class Intubation: UIViewController {
    
    
    @IBOutlet weak var intubationScrollView: UIScrollView!
    @IBOutlet weak var intubationSubtitle: AKLabel!
    @IBOutlet weak var stepOneLabel: UILabel!
    
    // Change the navigation bar colors
    override func viewWillAppear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
       // self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //intubationScrollView.recalculateVerticalContentSize_synchronous()
        
        intubationSubtitle.animate(text: "Intubation", duration: 1, completion: nil)
        // Do any additional setup after loading the view.
        
        showAnimate()
    }
    
    
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimate()
    {
        // Animation for the Results UIView
        self.stepOneLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.stepOneLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 1.0, animations: {
            self.stepOneLabel.alpha = 1.0
            self.stepOneLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }
    
    
}
