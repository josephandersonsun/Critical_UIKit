//
//  UrineOutputData.swift
//  UrineOutputCalculator
//
//  Created by Jadie Barringer III on 1/1/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class UrineOutputData: UIViewController {
    
    @IBOutlet weak var urineOutputResultLabel: UILabel!
    @IBOutlet weak var oliguriaLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultButton: UIButton!

    @IBOutlet weak var averageUO: UILabel!
    
    @IBAction func dismissDetailSmallView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
    
    
    var result: Double?
    var idBlock = Int()
    var resultLiters: Double?
    var oliguriaResult:String = ""
    var avgUrineOutput: Double?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatedResult()
        
        // Round Top of the View only
        resultView.clipsToBounds = true
        resultView.layer.cornerRadius = 10
        resultView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        // Takes the button and makes it into a circle
        //resultButton.layer.cornerRadius = resultButton.frame.size.width / 2
        // Do any additional setup after loading the view.
    }
    
    
    func calculatedResult(){

        let finalResult = String(format:"%.1f",result!) // Rounds to the 1st decimal place
        
        urineOutputResultLabel.text = String(finalResult)
        
        //Sets the average U/O label to display the hourly output. If its less than 0 or zero, pt is anuric
        let avgUO = String(format:"%.1f",avgUrineOutput!) // Rounds to the 1st decimal place
        
        if avgUrineOutput! <= 1 {
             averageUO.text = "Anuric"
            averageUO.textColor = Colorify.Alizarin
        } else {
            averageUO.text = "Average urine output: \(avgUO) mL/hr"
            averageUO.textColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
        }
        
        //MARK: -  Switch on the Segments
        
        switch idBlock {
        
        case 0: // Adult mLs
            urineOutputResultLabel.text = String(finalResult)

            if (result! < 0.49) {
                oliguriaLabel.text = "Patient is oliguric"
                oliguriaLabel.textColor = UIColor.yellow
                print("Patient is oliguric at \(finalResult)")

            }
            if (result! > 0.49)  {
                oliguriaLabel.text = "Pt. is not oliguric at \(finalResult) cc/kg/hr"

            }
            
            print("Adult mLs- The result calculated is \(finalResult) idBlock 0")
            
        case 1: // Adult Liters
            
            urineOutputResultLabel.text = String(finalResult)

            if (result! < 0.49) {
                oliguriaLabel.text = "Patient is oliguric"
                oliguriaLabel.textColor = UIColor.yellow
                print("Patient is oliguric at \(finalResult)")

            }
            if (result! > 0.49) {
                oliguriaLabel.text = "Pt. is not oliguric at \(finalResult) cc/kg/hr"
            }
            
            print("Adult Liters- The result calculated is \(finalResult) idBlock 1")

        case 2: // Peds mL's
                urineOutputResultLabel.text = String(finalResult)
                
                if (result! < 1.0) {
                        oliguriaLabel.text = "Patient is oliguric"
                    oliguriaLabel.textColor = UIColor.yellow
                    print("Patient is oliguric at \(finalResult)")

                }
                if (result! > 1.0) {
                    oliguriaLabel.text = "Pt. is not oliguric at \(finalResult) cc/kg/hr"
                }
            
                print("// Peds mL's- The result calculated is \(finalResult) idBlock 2")

        case 3: // Peds liters
                urineOutputResultLabel.text = String(finalResult)
                
                if (result! < 1.0) {
                    
                        oliguriaLabel.text = "Patient is oliguric"
                    oliguriaLabel.textColor = UIColor.yellow
                    print("Patient is oliguric at \(finalResult)")

                }
                if (result! > 1.0){
                    oliguriaLabel.text = "Pt. is not oliguric at \(finalResult) cc/kg/hr"
              }
            
                print("Peds liters- The result calculated is \(finalResult) idBlock 3")

        default:
            break
        }
        
                }
    
    
    //MARK: Popover Function
    @IBAction func popOverButtonFunction(_ sender: Any) {
        
        let popTip = PopTip()
        popTip.bubbleColor = UIColor.darkGray
        popTip.textColor = UIColor.white
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: 140, y: 720, width: 100, height: 100)
        
        
        popTip.show(text: "Adult oliguria is U/O < 500 mL in 24 hrs (0.5 mL/kg/hr) Peds: < 1L in 24 hrs (1 mL/kg/hr) ", direction: .up, maxWidth: 200, in: view, from: here)
        
        
        //Background color changes. Not sure how to dismiss.
        //        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
//        popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
    }
    
    @IBAction func closeUrineData(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
            
  
    @IBAction func dismissMainUrineOutputHiddenButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("View Controller was dismissed")
        
    }
}
