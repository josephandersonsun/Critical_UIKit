//
//  DifficultAirway_ChildVC.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/19/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class DifficultAirway_ChildVC: UIViewController {

    @IBOutlet weak var difficultScroller: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        difficultScroller.resizeScrollViewContentSize()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissLEMONS(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("LEMONS View Controller was dismissed")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
