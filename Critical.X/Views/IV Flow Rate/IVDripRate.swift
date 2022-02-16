//
//  ViewController.swift
//  IV Drip Rate Calculator
//
//  Created by Jadie Barringer III on 1/12/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import Stevia

class IVDripRate: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var durationTxt: UITextField!
    @IBOutlet weak var volumeTxt: UITextField!{
        didSet {
//            volumeTxt-20-|
//            volumeTxt.top(170)
        }
    }
    @IBOutlet weak var volumeTextLabel: UILabel!
    @IBOutlet weak var dripSetTxt: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var mLresultLabel: UILabel!
    
    
    @IBOutlet weak var resultView: UIView! {
        didSet {
            resultView.clipsToBounds = true
            resultView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it into a circle
            closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        }
    }
    @IBOutlet weak var timeLabel: UILabel!
    //Set and outlet option with the CustomSegmentController as the Custom file
    @IBOutlet weak var segment: CustomSegmentedController?
    
    // This adds our views to the cell's content view as needed
    // and prepares them for autolayout use.
    // This has the advantage of being very visual. Indeed, sv calls can be nested
    // and you see the view hierarchy right away.

    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // autolayout
    
        timeLabel.text = "min"
        
        //Declares the objects that are embedded into the segment.
        segment?.items = ["min", "hr"]
        
        // Hides the ResultView
        resultView.isHidden = true
        
    }
    
    
    
    //MARK: - Calcuate IV Flow Rate
    @IBAction func calculateIVFlowRate(_ sender: AnyObject) {
        //Unhides the resultView on calculation
        resultView.isHidden = false
        
        // Hides the keyboard
        self.view.endEditing(true)

        //Animates the view
        showAnimate()
        
        //Vaiables for the switch statement to place inside of the function
        guard let vol = Double(volumeTxt.text!) else {
            print("Volume is empty")
            
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter both volume and duration values, then recalculate!")
            resultView.isHidden = true
            
            return
            
        }
        
        
        
        guard let duration = Double(durationTxt.text!) else {
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter both volume and duration values, then recalculate!")
            resultView.isHidden = true
            
            return
            
        }
        
        
        guard let drip =  Double(dripSetTxt.text!) else {
            let appearance = SCLAlertView.SCLAppearance(dynamicAnimatorActive: true)
            _ = SCLAlertView(appearance: appearance).showNotice("Wait!!", subTitle: "Enter all values, then recalculate!")
            resultView.isHidden = true
            return
            
        }
        
       
        
        
        
        
        switch segment?.selectedIndex {
        case 0?:
            print("0 selected, minutes calculated")
            
            //Sets the results to resultsMinutes
            let resultMinutes = IVDripRateCalculationMin(Volume: vol, Time: duration , DripSet: drip)
            
            //Sets the calculation to the results Label
            resultLabel.text = "\(Int(resultMinutes))"
            
            
            // Calculates the mL/hour and populates the result label.
            let mLresult = (mLperHours(duration: duration, volume: vol))
            
            let modifiedMLResult = mLresult * 60
            
            mLresultLabel.text = "\(Int(modifiedMLResult))"
            
            print("mL per hour is \(mLperHours(duration: duration, volume: vol))")
            
            print(modifiedMLResult)
            
            
            
        case 1?:
            print("1 selected, Hours calculated")
            
            
            //Sets the results to resultsHours
            let resultsHours = IVDripRateCalculationHours(Volume: vol, Time: duration, DripSet: drip)
            
            //Sets the calculation to the results Label
            resultLabel.text = "\(Int(resultsHours))"
            
            
            // Calculates the mL/hour and populates the result label.
            let mLresult = (mLperHours(duration: duration, volume: vol))
            
            let shortMLResult = String(format:"%.1f",mLresult) // Rounds to the 1st decimal place
            
            mLresultLabel.text = shortMLResult
            
            print("mL per hour is \(mLperHours(duration: duration, volume: vol))")
            
            print(shortMLResult)
            
        default: //Break out
            break
        }
        
    }
    
    //When the segment is changed. The small time label is updated from min to hours
    @IBAction func segmentChangeLabel(_ sender: Any) {
        switch segment?.selectedIndex {
        case 0?:
            print("0 changed to mL's")
            
            //Change the time label to ml's when segment 1 is selected
            timeLabel.text = "min"
            
        case 1?:
            print("1 changed to Hr")
           
            //Change the time label to hr's when segment 2 is selected
            timeLabel.text = "hr"
        default:
            break
        }
        
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
        // Unhide the view
        resultView.isHidden = false
        
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView.alpha = 1.0
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }
    
    
    //MARK: - Calcualte mL per hour
    /**
     Calculate mL/hrbutton
     - parameters:
     -no parameters
     */
    
    func mLperHours(duration: Double, volume: Double) -> Double {
        
        
        let resultMl =  volume / duration
        
        return resultMl
        
    }
    
    /**
     Calculate the IV flow Rate in gtts/min
     - parameters:
     - Time: Can be in hours or min. If hours, x min by 60 to conver to min
     - Amount: The amount of fluid thats in the bag
     - Gtt/set: Either have 10, 15 or 60 drop sets.
     
     //gtts/min = volume (mL's) x (gtts) factor / time (min)
     If time is over hours. gtts/min = volume (mL's) x (gtts) factor / hours x 60 (which represents the min in one hour)
     */
    func IVDripRateCalculationMin(Volume: Double, Time: Double, DripSet: Double) -> Double {
        
        let dropsPerMinute = Volume * DripSet / Time
        
        return dropsPerMinute
        
    }
    
    func IVDripRateCalculationHours(Volume: Double, Time: Double, DripSet: Double) -> Double {
        
        let dropsPerMinute = Volume * DripSet / (Time * 60)
        return dropsPerMinute
    }
    
    
    
    // MARK: - Exiting Methods
    
    // Closes the keyboard befor ethe view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    
    
    ///Dismisses the view Controller
    @IBAction func dismissIVDripView (_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    
}

