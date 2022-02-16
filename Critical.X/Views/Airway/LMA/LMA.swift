//
//  LMA.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/19/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import EasyPeasy



class LMA: UIViewController {

    @IBOutlet weak var LMAScrollView: UIScrollView!
    
    // This view is on top of the scrollView where the content is placed.
    @IBOutlet weak var contentView: UIView!
    var lastImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //LMAScrollView.recalculateVerticalContentSize_synchronous()
       // Helper functions to call from the extensions. 
        setUpLabels()
        //contentView.sizeToFit()
        //LMAScrollView.sizeToFit()
        LMAScrollView.recalculateVerticalContentSize_synchronous()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
       // self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
        
        
    }

}// End of the LMA Class


    


