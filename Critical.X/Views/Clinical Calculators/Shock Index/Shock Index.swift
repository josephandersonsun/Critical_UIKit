//
//  Shock Index.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/18/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
import SCLAlertView

class Shock_Index: UIViewController {

    
    @IBOutlet weak var  txt_heartRate : UITextField!
    @IBOutlet weak var txt_SBP: UITextField!
    @IBOutlet weak var resultViewSHOCK: UIView!
    @IBOutlet weak var titleLabelShock: AKLabel!
    @IBOutlet weak var resultLabelTExt: UILabel!
    @IBOutlet weak var interpretationLabel: UILabel!
    
    @IBAction func dismissShockPage(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Shock View Controller was dismissed")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        
        // Hide the resultView initiall
        resultViewSHOCK.isHidden = true

        
        // ANimate the title coming in
        titleLabelShock.animate(text: "Shock Index", duration: 1, completion: nil)
        // Do any additional setup after loading the view.
    }
        
  
    func calculateShockIndex()-> Double  {
        
        //Unhides the view
        resultViewSHOCK.isHidden = false
        
        //Calculates the shock index
        let hr = Double(txt_heartRate.text!)
        
        let sbp =  Double(txt_SBP.text!)
        
        guard let _ = hr, let _ = sbp else {
            print("Values of the shock index were not entered ")
            return 0 }
        
        var indexResult: Double {
            
            return hr!/sbp!
        }
        
        switch indexResult {
       
        case 0...0.5:
            interpretationLabel.text = "The patient is hyperdynamic"
            
            resultLabelTExt.text = "\(indexResult.oneDecimalPlace)"
            
        case 0.5...0.7:
            interpretationLabel.text = "Normal Shock Index. 0.5-0.7 is considered normal values."
       
            resultLabelTExt.text = "\(indexResult.oneDecimalPlace)"

            
        case 0.8...1.0:
            interpretationLabel.text = "Consider hypotension. Check to see if there's any active bleeding.\n\nNote:Higher numbers in the shock index were cited to be more sensitive than vital signs alone in diagnosing shock states."
        
            resultLabelTExt.text = "\(indexResult.oneDecimalPlace)"

            
        case 1.0...:
            interpretationLabel.text = "Likely hypotensive. Consider the need for fluid resuscitation, blood transfusions, vasoactive agents and/or surgery to correct the underlying pathology."
            
            resultLabelTExt.text = "\(indexResult.oneDecimalPlace)"

            
        default:
            break
        }
        
        return indexResult
        
        
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
        self.resultViewSHOCK.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultViewSHOCK.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultViewSHOCK.alpha = 1.0
            self.resultViewSHOCK.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animation for the label to come in a little later
        self.resultLabelTExt.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultLabelTExt.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.resultLabelTExt.alpha = 1.0
            self.resultLabelTExt.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }

    @IBAction func shockButtonPressed(_ sender: AnyObject) {
        //Calculates the shock index
        let hr = Double(txt_heartRate.text!)
        
        let sbp =  Double(txt_SBP.text!)
        
        guard let _ = hr, let _ = sbp else {
            
            print("Values of the shock index were not entered ")
            // Add iCon at the top of the Alert Icon
            
            let appearance = SCLAlertView.SCLAppearance(
                kTitleFont: UIFont(name: "HelveticaNeue", size: 20)!,
                kTextFont: UIFont(name: "HelveticaNeue", size: 14)!,
                kButtonFont: UIFont(name: "HelveticaNeue-Bold", size: 14)!,
                showCloseButton: true,
                dynamicAnimatorActive: true,
                buttonsLayout: .horizontal
            )
            
            let alert = SCLAlertView(appearance: appearance)
            
            let icon: UIImage = #imageLiteral(resourceName: "CRITICALLogo")
            // Color for the buttons and  iCon background
            let color = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            
            // Language to show the alert
            _ = alert.showCustom("Hold On...", subTitle: "Check all of the fields before calculating.", color: color, icon: icon)
            
         return  }
        
        // Run the code
        showAnimate()
        
        calculateShockIndex()
    }
    
    // USed for the button
    @objc func closeButton() {
        // execute refresh code or whateever you want
        
        print("Shock Was refreshed o")
    }

}
