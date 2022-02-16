//
//  MAP_CPP.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/27/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class MAP_CPP: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    @IBOutlet weak var systolic: UITextField!
    
    @IBOutlet weak var diastolic: UITextField!
    
    @IBOutlet weak var icp: UITextField!
    
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var lbl_Result_MAP: UILabel!
    
    @IBOutlet weak var lbl_Result_CPP: UILabel!

    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        resultView.isHidden = true
        
        
        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.

    }
    
    
    func calculateMap() -> Int  {
        
        // Systolic Blood Pressure Variable
        guard let sbp = Int(systolic.text!) else {
            print("SBP is empty")
            
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter both SBP and DBP values, then recalculate!")
            
            resultView.isHidden = true
            
            return 0
            
        }
        
        // Diastolic blood pressure
        guard let dbp = Int(diastolic.text!) else {
            print("DBP is empty")
            
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter both SBP and DBP values, then recalculate!")
            
            resultView.isHidden = true
            
            return 0
            
        }
        
        let mapResult = (sbp + (2 * dbp)) / 3
        
        return mapResult
        
    }
    
    
    //Dismiss the view
    @IBAction func dismissMAP(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("MAP CPP View Controller was dismissed")
        
    }
  

    func showAnimate()
    {
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView .alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
    }
    @IBAction func calculateButton(_ sender: Any) {
        
        // Unhide the resultView
        resultView.isHidden = false
        
        // ANimate the view In
        showAnimate()
        
        // Hide the keyboard
        self.view.endEditing(true)

        //Calculations
        // If only the BP textFields are filled in, Calculate both MAP only

        if (systolic.text != nil) && diastolic.text != nil {
        
        lbl_Result_MAP.text = "\(calculateMap())"
            
        lbl_Result_CPP.text = "N/A"
            lbl_Result_CPP.alpha = 0.4

        
            print("MAP only Calculated")

        }
        
        // If all three textFields are filled in, Calculate both MAP and CPP
        if (systolic.text != nil) && (diastolic.text != nil) && (lbl_Result_CPP.text != nil) {
            
            guard let icp = Int(icp.text!) else {
                print("ICP is empty")
            
                // If the ICP is empty, just calculate MAP
                lbl_Result_MAP.text = "\(calculateMap())"

                return
                
            }
            
            // If the ICP is filled in,  calculate MAP Both

            print("MAP and CPP Calculated")
            
            lbl_Result_MAP.text = "\(calculateMap())"
        
            let map = calculateMap()
            
            let calculatedCpp = map - icp
            
            lbl_Result_CPP.text = "\(calculatedCpp)"
        }
    
    
    }
    
  /// Keyboard Dismissed after you touch the screen
    func doneButtonAction() {
    
        self.view.endEditing(true)

    }

}
