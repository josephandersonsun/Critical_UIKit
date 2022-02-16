//
//  AirwayMenu.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/14/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

import EasyPeasy


class AirwayMenu: UIViewController {
    
    
    
    @IBOutlet weak var subTitleLabel: AKLabel!
    @IBOutlet weak var airWayView1: UIView!
    @IBOutlet weak var airWayView2: UIView!
    @IBOutlet weak var airwayScroller: UIScrollView!
    
    var kingLTButton = UIButton()
    var lmaButton = UIButton()
    var predictorsButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call extension functions
        createLMAButton() // calls the extension function
        createPredictorsButton()
        createIntubationButton()
        createKingLTButton()
        setupLabel()
        
        airwayScroller.recalculateVerticalContentSize_synchronous()
        
        //        for button in IntubationButtons {
        //            button.layer.cornerRadius = 4
        
//      subTitleLabel.top(180).left(15).right(15).width(200).height(60)
//        //subTitleLabel.easy.layout(  Top(182),Left(15),Right(15),Height(60))
//        
//        airWayView1.centerInContainer()
//        airWayView2.centerInContainer()
        
    }
    
 
  
    
    //Clears the text box before the view appears so that there can be a nice animation.
    override func viewWillAppear(_ animated: Bool) {
        subTitleLabel.text = ""
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
       // self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        subTitleLabel.animate(text: "Airway Management", duration: 1, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        subTitleLabel.text = ""
    }
    
    // MARK: - Navigation
    
    // When intubation button is presesed. Push the view controller via code
    @IBAction func pushToIntubationScreen(_ sender: UIButton) {
        
    }
    
    
    
    // Function or IBACTION for the buttons clicked. Using a switch statement to differentiate betteren the bittons via a tag. Make sure that the function name matches the action selector declared in the button, Here i made buttonActionClicked the same same all about and use a switch statement to access each tag and button.
    @objc func buttonActionClicked (sender: UIButton) {
        
        let buttonTag: UIButton = sender
        
        switch buttonTag.tag {
        case 1: // Intubation
            print("Intubation Was clicked")
            // Name has to reflect the origionting SB.
            let storyboard = UIStoryboard(name: "Airway", bundle: nil)
            
            //SB Identifier
            let vc = storyboard.instantiateViewController(withIdentifier: "Intubation")
            
            // Calls from the UIButton extension to pulsate.
            buttonTag.pulsate()
            
            // Push the ViewController via Navigation
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2: //King LT
            print("KingLT Was clicked")
            
            // Name has to reflect the origionting SB.
            let storyboard = UIStoryboard(name: "Airway", bundle: nil)
            
            //SB Identifier
            let vc = storyboard.instantiateViewController(withIdentifier: "KingLT")
            
            // Calls from the UIButton extension to pulsate.
            buttonTag.pulsate()
            
            // Push the ViewController via Navigation
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3: // LMA
            print("LMA Was clicked")
            // Name has to reflect the origionting SB.
            let storyboard = UIStoryboard(name: "Airway", bundle: nil)
            
            //SB Identifier
            let vc = storyboard.instantiateViewController(withIdentifier: "LMA")
            
            // Calls from the UIButton extension to pulsate.
            buttonTag.pulsate()
            
            // Push the ViewController via Navigation
            self.navigationController?.pushViewController(vc, animated: true)
        case 4: // Predictors of a difficult airway
            print("Predictors of Airway Was clicked")
            
            let storyboard = UIStoryboard(name: "Airway", bundle: nil)
            
            //SB Identifier
            let vc = storyboard.instantiateViewController(withIdentifier: "predictors")
            
            // Calls from the UIButton extension to pulsate.
            buttonTag.pulsate()
            
            // Push the ViewController via Navigation
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    
}



