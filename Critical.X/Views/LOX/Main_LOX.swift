//
//  Main_LOX.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/18/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import SCLAlertView
import AKLabel


class Main_LOX: UIViewController {

    
    @IBOutlet weak var timeResultLabel: UILabel!
    
    @IBOutlet weak var titleLabelLOX: AKLabel!
    
    @IBOutlet weak var txt_tankWeight: UITextField!
    
    @IBOutlet weak var txt_lpm: UITextField!
    
    @IBOutlet weak var thereAReLabel: UILabel!
    
    @IBOutlet weak var resultView: UIView!

    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        /// Code allows you to tap anywhere on the screen to dismiss the decimal keyboard.
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        
        tap.cancelsTouchesInView = false
        
        self.view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
        

        
        // Hide the resultView initiall
        resultView.isHidden = true
        
        // ANimate the title coming in
        titleLabelLOX.animate(text: "LOX Calculator", duration: 1, completion: nil)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func loxCalculation(tankWeight weight02: Double, literPerMin liters:Double) -> String {
     
        // First we have to calculate the gas remaining in the tank. Thats weight x 860 / 2.5
        let gasRemaining = (weight02 * 860) / 2.5
        
        // Next we have to calculate the duration by gas remaining / lpm : Will be in minutes
        var timeRemaining = gasRemaining / liters
        
        if (timeRemaining.isNaN) {
        
            print("Time reamining is Not a number")
        }
        
//        var hoursRemaining: Int {
//            return (Int(timeRemaining / 60) )
//        }
//
//        var minutesReamining: Int {
//
//            return (Int(timeRemaining) % 60)
//        }
        
    
        // Here we set a vatiable to the conversiom function below.
        let timeLeftOver = minutesToHours(minutes: Int(timeRemaining))

     
        // Vatiable to set the final string to.
        var finalTime = String()
        
        // Convert the minutes if necessary and set to finalTime
        if timeRemaining > 60 {
      
            thereAReLabel.text = "With \(weight02) lbs in the LOX at \(liters) L/min, there's"
            
            finalTime = "\(timeLeftOver.hours) hrs and \(timeLeftOver.leftMinites) minutes remaining"
            
            thereAReLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            resultView.backgroundColor = #colorLiteral(red: 0.3289999962, green: 0.5289999843, blue: 0.6430000067, alpha: 1)
        }
            
            
        // If the time left is under 10 minutes
        else if timeRemaining <= 10 {
            
            thereAReLabel.text = "With \(weight02) lbs in the LOX at \(liters) L/min, there is"

            finalTime = "\(timeLeftOver.leftMinites) minutes remaining"
            
            thereAReLabel.textColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            
            resultView.backgroundColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
        }
        
            // If the time left is 1 minute
        else if timeRemaining == 1 {
            
            thereAReLabel.text = "With \(weight02) lbs in the LOX at \(liters) L/min, there is"
            
            finalTime = "\(timeLeftOver.leftMinites) minute remaining"
            
            thereAReLabel.textColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            
            resultView.backgroundColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
        }
            
            // If the time left 0
        else if timeRemaining == 0 {
            
            txt_tankWeight.text = "0"
            txt_lpm.text = "0"
            thereAReLabel.text = "With \(weight02) lbs in the LOX at \(liters) L/min, you have an"
            
            finalTime = "Empty LOX Tank"
            
            thereAReLabel.textColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            
            resultView.backgroundColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
        }
            
            
        else  {
        
            thereAReLabel.text = "With \(weight02) lbs in the LOX at \(liters) L/min, there are"
            
            finalTime = "\(timeLeftOver.leftMinites) minutes remaining"
            
            thereAReLabel.textColor = #colorLiteral(red: 0.7411764706, green: 0.2784313725, blue: 0.2352941176, alpha: 1)
            
            resultView.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)

        }
        
        print(finalTime)
        
        return finalTime
        
    }
    
    //MARK: Make a converstion from if the minutes are over 60 to convert  to hours and min.
    func minutesToHours(minutes: Int) -> (hours: Int, leftMinites: Int) {
        return (minutes / 60 , (minutes % 60))
    }
    
    
    
    //MARK: Pressing the calculate button
    @IBAction func Calculate_LOX_TimeRemaining(_ sender: Any) {
        
        let tankWeightEntered = Double(txt_tankWeight.text!)
        
        let lpmEntered = Double(txt_lpm.text!)
        
        
        // Alert if the textFields are empty
        guard let _ = tankWeightEntered, let _ = lpmEntered else {
            // We set the textField parameters to double so the func can accept the parameteres.
            
            // Displays alert with Critical Logo
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
            
            
            
            print("texfields are EMPTY")
    
            
            return  }
        
        if tankWeightEntered == 0 || lpmEntered == 0 {
            
            // Yellow Warning Alert // Takes the button and makes it into a circle
            _ = SCLAlertView().showWarning("Hold On...", subTitle: "Check all of the fields before calculating.")
            
            print("texfields are EMPTY")
            
            
        }
       
        timeResultLabel.text = loxCalculation(tankWeight: tankWeightEntered ?? 0 , literPerMin: lpmEntered ?? 0)
        
        //unhide the view
        resultView.isHidden = false
        
        // ANimate the view in
        showAnimate()
        
        print("LOX was NOT empty")

        
   }
    

/// Keyboard Dismissed after you touch the screen
func doneButtonAction() {
    self.view.endEditing(true)
}
    
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Time remianing Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimate()
    {
        
        resultView.isHidden = false
        // Animation for the Results UIView
        self.resultView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        self.resultView.alpha = 0.0;
        
        UIView.animate(withDuration: 0.25, animations: {
            self.resultView.alpha = 1.0
           
            self.resultView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        // Animation for the label to come in a little later
        self.timeResultLabel.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        
        self.timeResultLabel.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.timeResultLabel.alpha = 1.0
            
            self.timeResultLabel.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
    }
 
    
    //MARK: - Dismiss the view
    @IBAction func dismissLOX(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        
        print("Lox was dismissed")
    }

 

}
