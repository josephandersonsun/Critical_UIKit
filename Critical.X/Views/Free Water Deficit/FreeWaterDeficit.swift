//
//  FreeWaterDeficit.swift
//  FreeWaterDeficit
//
//  Created by Jadie Barringer III on 12/31/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

class FreeWaterDeficit: UIViewController {
    
    ///Outlets
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var segmentMaleFemale: CustomSegmentedController?
    @IBOutlet weak var segmentAdultChildElderly: CustomSegmentedController!
    
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var desiredNaTxt: UITextField!
    @IBOutlet weak var currentNaTxt: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the button and makes it into a circle
        closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        
        /// Rounds the corners 15 pixels of the UIView name
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 4
        
        // Setting up the segments
        segmentMaleFemale?.items = ["Male", "Female"]
        segmentAdultChildElderly?.items = ["Child", "Adult", "Elderly"]
    }
    
    // Closes the keyboard befor ethe view is dismissed
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    
    //MARK: Prepare for the SEGUE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        ///// Checks the segue destination, grabs the number value from the textfield and passes the data.
        if let destination = segue.destination as? FreeWaterDeficitDetail {
            
            
            
            //Takes the Double (weightEntered) variable from the detail page, and parses it as the textFireld (Double) becuase the textField is origionally casted as a string.
            destination.weight = Double (weightTxt.text!)
            destination.currentNa = Double(currentNaTxt.text!)
            destination.desiredNa = Double(desiredNaTxt.text!)
            
            //MARK: Guard function during the calculations.
            guard let _ = weightTxt, let _ = currentNaTxt, let _ = desiredNaTxt  else {
                
                _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
                print("Error! out of normal parameters")
                
                return }
            
        }
        
        if segue.identifier == "freeWaterShow" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let freeWaterVC = segue.destination as? FreeWaterDeficitDetail {
                
                switch (segmentMaleFemale?.selectedIndex, segmentAdultChildElderly?.selectedIndex) {
                case (0?,0?): //Mark:Male Child
                    
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 1
                    
                    
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    
                    // resultAdultMale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultChildMale = (0.6 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    print("Male Child Segment Selected")
                    print("")//create space on the console
                    
                    
                case (0?,1?): //Mark:Male Adult
                    
                    //MARK: Guard function during the calculations.
                 
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 2
                    
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    // resultAdultMale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultAdultMale = (0.6 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    
                    
                    
                case (0?,2?): //Mark: Male Elderly
                    
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 3
                    
                    
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    
                    
                    // resultElderlyMale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultElderlyMale = (0.5 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    
                    //Mark: FEMALE CALCULATIONS
                    
                case (1?,0?): //Mark:Female Child
                    
                    
                    
                    
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 4
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    
                    // resultChildFemale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultChildFemale = (0.6 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    
                    
                    
                case (1?,1?): //Mark:Female Adult
                    
                 
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 5
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    
                    // resultAdultFemale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultAdultFemale = (0.5 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    
                    
                case (1?,2?): //Mark: Female Elderly
                    
                    //MARK: Guard function during the calculations.
                    guard let _ = weightTxt, let _ = currentNaTxt, let _ = desiredNaTxt  else {
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Check all of the text fields before calculating. Enter an appropriate value to calculate", closeButtonTitle:"OK")
                        print("Error! out of normal parameters")
                        
                        return }
                    // Declare a number variable that I can pass to the receiving view controller so that it knows which block of code is being initialized.
                    let id = 6
                    // I set the ID block,  that is an INT  on the receiving view controller so I can access this in a switch statement.
                    freeWaterVC.idBlock = id
                    
                    
                    // resultElderlyFemale is set to zero on the receiving view controller, here I tell it if the segment is equal to zero from these calculations.
                    let sodium = Double(currentNaTxt.text!)
                    let weight = Double (weightTxt.text!)
                    let desiredSodium = Double(desiredNaTxt.text!)
                    
                    
                    guard let _ = weight , let _ = sodium, let _ = desiredSodium  else {
                        print("Error! out of normal parameters")
                        
                        _ = SCLAlertView().showError("Hold On...", subTitle:"Make sure all of the text fields have values before calculating.", closeButtonTitle:"OK")
                        //        SCLAlertView().showError(self, title: kErrorTitle, subTitle: kSubtitle)
                        
                        return }
                    
                    /// Settng the Child Male calculation to the resultMale double on the receiving VC.
                    freeWaterVC.resultElderlyFemale = (0.45 * weight! * ((sodium! / desiredSodium!)-1))
                    
                    
                    
                default:
                    break
                }
                
                
                
            }
            
        }
    }
    
    @IBAction func popBtnReference(_ sender: Any) {
        
        let popTip = PopTip()
        popTip.bubbleColor = UIColor.darkGray
        popTip.textColor = UIColor.white
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: view.frame.width/3, y: 120, width: 100, height: 100)
        
        
        popTip.show(text: "Calculation is based on the formula:Male- 0.6 x weight(kg) x (currentNa / 140)-1)", direction: .down, maxWidth: 200, in: view, from: here)
        
        //popTip.show(text: "Devine BJ. Gentamicin therapy. Drug Intell Clin Pharm. 1974;8:650–655.", direction: .down, maxWidth: 200, in: view, from: here)
        
        //Background color changes. Not sure how to dismiss.
        //view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
        //popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
        
    }
    
    @IBAction func SodiumReference(_ sender: Any) {
        
        let popTip = PopTip()
        popTip.bubbleColor = UIColor.darkGray
        popTip.textColor = UIColor.white
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        let here = CGRect (x: 100, y: 120, width: 100, height: 100)
        
        
        popTip.show(text: "Bssed on a median Na of 140 mEq/L", direction: .up, maxWidth: 200, in: view, from: here)
        
        //        popTip.show(text: "Devine BJ. Gentamicin therapy. Drug Intell Clin Pharm. 1974;8:650–655.", direction: .down, maxWidth: 200, in: view, from: here)
        
        //Background color changes. Not sure how to dismiss.
        //        view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
        
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        
        //Changes the font of the pop-up and size
        //        popTip.font = UIFont(name: "AvenirNextCondensed-Heavy", size: 10.0)!
        
        
    }
    
    
    // Dismisses the keyboard when the user taps on the outside of any textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    @IBAction func freeh20MainVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func calculateIfempty(_ sender: Any) {
        
        let sodium = Double(currentNaTxt.text!)
        let weight = Double (weightTxt.text!)
        let desiredSodium = Double(desiredNaTxt.text!)
        let curentSodium = Double(currentNaTxt.text!)

        guard sodium == nil, weight == nil, desiredSodium == nil, curentSodium == nil else {
             print("Something is empty")
            return
        }
    }


}
