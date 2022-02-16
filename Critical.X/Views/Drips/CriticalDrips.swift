//
//  ViewController.swift
//  Critical Drips
//
//  Created by Jadie Barringer III on 2/9/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import Lottie


// Put this piece of code anywhere you like
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissTheKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissTheKeyboard() {
        view.endEditing(true)
    }
}




class CriticalDrips: UIViewController, UITextFieldDelegate {
    
    
    //MARK: - Outlets
    @IBOutlet var mainScrollView: UIScrollView!
    @IBOutlet weak var dripView: UIView!
    @IBOutlet var lbl_Title: UILabel!
    @IBOutlet var lbl_SubTitle: UILabel!
    @IBOutlet weak var arrowAnimation: AnimationView!
    @IBOutlet weak var redDotAnimate: AnimationView!

    @IBOutlet var lblDoseRange: UILabel!
    @IBOutlet var lblYields: UILabel!
    @IBOutlet var lblUnit: UILabel!
    @IBOutlet var lblMin: UILabel!
    @IBOutlet var lblMax: UILabel!
    @IBOutlet var lblUnitTotalDose: UILabel!
    @IBOutlet var lblUnitYields: UILabel!
    
    @IBOutlet var txtWeight: UITextField!
    @IBOutlet var txtTotalDose: UITextField!
    @IBOutlet var txtIvBag: UITextField!
    @IBOutlet var txtDose: UITextField!
    @IBOutlet var txtInfusionRate: UITextField!
    
    @IBOutlet var DoseSlider: UISlider!    
    
    @IBOutlet var btnIndications: UIButton!
    @IBOutlet var btn_AdversEffects: UIButton!
    @IBOutlet var btnWhatToKnow: UIButton!
    @IBOutlet var underLine: UIView!
    @IBOutlet weak var totalDoseLabelUnit: UILabel!

    @IBOutlet var lbl_Details: UILabel!
    
    @IBOutlet var viewCard1: CardView!
    @IBOutlet var viewCard2: CardView!
    
    
    public var  index = 0
    private var step: Float = 1
    private var detail_type = 0
    private var Drip:NSDictionary!
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = "Drips"
        
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.mainScrollView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        mainScrollView.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
        
        if ((UserDefaults.standard.object(forKey:"weight")) == nil) {
            UserDefaults.standard.set("80", forKey: "weight")
            UserDefaults.standard.synchronize()
        }
        
        interfaceConfig()
        SwitchTabs()
        
        
        //MARK: Play the lottie animation for the arrow concentrationView. 
        arrowAnimation.animation = Animation.named("animateDots")
        arrowAnimation.play()
        arrowAnimation.loopMode = .loop
        
        
        //redDotAnimate in the infusion View
        redDotAnimate.animation = Animation.named("redDotAnimate")
        redDotAnimate.play()
        redDotAnimate.loopMode = .loop
    }
    
   
    
    // Hide the keyboard when the return key pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    
    //MARK:  Moving the screen when textField is engaged.
    func doneButtonAction() {
        self.view.endEditing(true)
    }
    
  
    //MARK: - TEXT FIELD DELEGATES
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        animateViewMoving(up: true, moveValue: 250)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        animateViewMoving(up: false, moveValue: 250)
        
        doneButtonAction()
        
        if textField.text != "" {
            Calculate()
        }
        
    }
    
    
    //MARK: - KEYBOARD ANIMATION FOR THE VIEW
   
    func animateViewMoving (up:Bool, moveValue :CGFloat){
        
        let movementDuration:TimeInterval = 0.3
        
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        
        UIView.beginAnimations( "animateView", context: nil)
        
        UIView.setAnimationBeginsFromCurrentState(true)
        
        UIView.setAnimationDuration(movementDuration )
        
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        
        UIView.commitAnimations()
    }
    
  
    
    
    //MARK: - NAV BAR ANIMATION
    
    func animateNavBar()  {
        
        let fadeTextAnimation = CATransition()
        
        fadeTextAnimation.duration = 0.3
        
        fadeTextAnimation.type = CATransitionType.moveIn
        
        //        kCATransitionFade
        //        kCATransitionMoveIn
        //        kCATransitionPush
        //        kCATransitionReveal
        //
        
        /*
         The different date formats
         Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
         09/12/2018                        --> MM/dd/yyyy
         09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
         Sep 12, 2:11 PM                   --> MMM d, h:mm a
         September 2018                    --> MMMM yyyy
         Sep 12, 2018                      --> MMM d, yyyy
         Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
         2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
         12.09.18                          --> dd.MM.yy
         10:41:02.112                      --> HH:mm:ss.SSS
         */
        
        let date : Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d  |  h:mm a"
        let todaysDate = dateFormatter.string(from: date)
        
        navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
        
        // Set the navigation title to the current date configuration.
        navigationController?.navigationBar.topItem?.title = todaysDate
        
        // navigationItem.title = "The Barringer Group ©"
    }
    
 
    
    //MARK: - ViewWillAppear
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
        //Function to run the RSI animation title.
        animateNavBar()
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
        //self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
        
    }
    
    
    // Once the view appears, the animation starts.
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    
        
    }
    
    

    
    
    func interfaceConfig() -> Void {
        let Dripslist = (UserDefaults.standard.object(forKey:"drip_list") as! NSArray) as! [Any]
        Drip = (Dripslist[index] as! NSDictionary)
        
        lbl_Title.text = Drip.object(forKey: "maintitle") as? String
        lbl_SubTitle.text = Drip.object(forKey: "BrandName") as? String
        lblUnitTotalDose.text = Drip.object(forKey: "doseLabelUnit") as? String

        let minValue = Drip.object(forKey: "min") as! String
        let maxValue = Drip.object(forKey: "max") as! String
        let unit = Drip.object(forKey: "unit") as! String
        
        lblDoseRange.text = minValue + " - " + maxValue + " " + unit
        lblUnit.text = unit
        lblMin.text = minValue
        lblMax.text = maxValue
        
        txtWeight.text = UserDefaults.standard.object(forKey: "weight") as? String
        txtTotalDose.text = Drip.object(forKey: "totaldose") as? String
        txtIvBag.text = Drip.object(forKey: "bag") as? String
        txtDose.text = Drip.object(forKey: "dose") as? String
        txtInfusionRate.isUserInteractionEnabled = false
        
        DoseSlider.minimumValue = Float(minValue)!
        DoseSlider.maximumValue = Float(maxValue)!
        DoseSlider.value = Float(Drip.object(forKey: "dose") as! String)!
        step = Float(Drip.object(forKey: "increment") as! String)!
        
        Calculate()
    }
    
    
    //MARK: - Switch Tabs
    
    func SwitchTabs() -> Void {
        var x_underLine:CGFloat = 0.0
        
        if detail_type == 0 {
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation."
            
            //set the text to draw from the pList.
            lbl_Details.text = Drip.object(forKey: "DrugClass") as? String
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.black, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            
            x_underLine = btnIndications.frame.origin.x
            
        }
        else if detail_type == 1 {
            
            lbl_Details.text = Drip.object(forKey: "Indications") as? String
            
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation. \n• Conscious sedation."
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.black, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            
            x_underLine = btn_AdversEffects.frame.origin.x
        }
        else if detail_type == 2 {
            lbl_Details.text = Drip.object(forKey: "WhatToKnow") as? String
            
            
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation. \n • Indications for diprivan would be continued sedation. \n• Conscious sedation. \n• Conscious sedation."
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.black, for: UIControl.State.normal)
            
            x_underLine = btnWhatToKnow.frame.origin.x
        }
        lbl_Details.sizeToFit()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.underLine.frame = CGRect(x: x_underLine, y: 34, width: 86, height: 4)
            self.lbl_Details.frame = CGRect(x: 20, y: self.lbl_Details.frame.origin.y, width: self.view.bounds.width - 36, height: self.lbl_Details.frame.size.height)
            
            self.viewCard1.frame = CGRect(x: 16, y: self.lbl_Details.frame.origin.y + self.lbl_Details.frame.size.height + 20, width: self.viewCard1.frame.size.width, height: self.viewCard1.frame.size.height)
            
            self.viewCard2.frame = CGRect(x: 16, y: self.viewCard1.frame.origin.y + self.viewCard1.frame.size.height + 25, width: self.viewCard2.frame.size.width, height: self.viewCard2.frame.size.height)
        }, completion: { (finished) in
            self.mainScrollView.contentSize = CGSize(width: 100, height: self.viewCard2.frame.origin.y + self.viewCard2.frame.size.height + 50)
        })
    }
    
    
    
    @IBAction func btnIndicationsClick(_ sender: Any) {
        detail_type = 0
        SwitchTabs()
    }
    
    @IBAction func btnAdverseEffectsClick(_ sender: Any) {
        detail_type = 1
        SwitchTabs()
    }
    
    @IBAction func btnWhatToKnowClick(_ sender: Any) {
        detail_type = 2
        SwitchTabs()
    }
    
    
    @IBAction func DoseSliderValueChanged(_ sender: Any) {
        let roundedValue = round(DoseSlider.value / step) * step
        DoseSlider.value = roundedValue
        //txtDose.text = "\(roundedValue)" // Caused long values w
        txtDose.text = String(format:"%.2f", roundedValue)
        Calculate()
    }

    
    
    //MARK: - Calculate Dosages
    
    func Calculate() -> Void {
        let unit = Drip.object(forKey: "unit") as! String
        
        let weight = Float(txtWeight.text!)!
        let totalDose = Float(txtTotalDose.text!)!
        let IvBag = Float(txtIvBag.text!)!
        let Dose = Float(txtDose.text!)!
        
        lblUnitTotalDose.text = "mg"

        
        
        if unit == "mcg/min" {
            let yields = totalDose/IvBag * 1000
            lblYields.text = String(format:"%.1f", yields)
            lblUnitYields.text = "mcg/mL"
            
            let infusion = Dose/yields * 60
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        else if unit == "mcg/hr" {
            let yields = totalDose/IvBag * 1000
            lblYields.text = String(format:"%.1f", yields)
            lblUnitYields.text = "mcg/mL"
            
            let infusion = Dose/yields
            txtInfusionRate.text = String(format:"%.2f", infusion)
        }
        else if unit == "mg/min" {
            
            let yields = totalDose/IvBag
            
            lblYields.text = String(format:"%.1f", yields)
            
            lblUnitYields.text = "mg/mL"
            
            let infusion = Dose/yields * 60
            
            txtInfusionRate.text = String(format:"%.2f", infusion)
        }
        else if unit == "mg/hr" {
            
            let yields = totalDose/IvBag
            
            lblYields.text = String(format:"%.1f", yields)
            
            lblUnitYields.text = "mg/mL"
            
            let infusion = Dose/yields
            
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        else if unit == "g/hr" {
            
            let yields = totalDose/IvBag * 1000
            
            lblYields.text = String(format:"%.1f", yields)
            
            lblUnitYields.text = "mg/mL"
            
            lblUnitTotalDose.text = "grams"

            let infusion = (Dose/yields) * 1000
            
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        else if unit == "units/min" {
            
            let yields = totalDose/IvBag
            
            lblYields.text = String(format:"%.2f", yields)
            
            lblUnitTotalDose.text = "units"
            
            lblUnitYields.text = "units/mL"
            
            let infusion = Dose/yields * 60
            
            txtInfusionRate.text = String(format:"%.2f", infusion)
        }
        else if unit == "mUnits/min" {
            
            let yields = totalDose/IvBag
            
            lblYields.text = String(format:"%.2f", yields)
            
            lblUnitTotalDose.text = "mUnits"
            
            lblUnitYields.text = "mUnits/mL"
            
            let infusion = Dose/yields * 60/1000
            
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        else if unit == "units/hr" {
            
            let yields = totalDose/IvBag
            
            lblYields.text = String(format:"%.2f", yields)
            
            lblUnitTotalDose.text = "units"
            
            lblUnitYields.text = "units/mL"
            
            let infusion = Dose/yields
            
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        else if unit == "mcg/kg/min" {
            
            var yields = totalDose/IvBag
            
            lblUnitYields.text = "mg/mL"
            
            if yields < 1 {
                
                yields = totalDose/IvBag*1000
                
                lblUnitYields.text = "mcg/mL"
            }
            
            lblYields.text = String(format:"%.1f", yields)
            
            let infusion = Dose * weight/(totalDose/IvBag*1000)*60
            
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        
        
        else if unit == "units/kg/min" {
            var yields = totalDose/IvBag
            lblUnitYields.text = "mg/mL"
            if yields < 1 {
                yields = totalDose/IvBag*1000
                lblUnitYields.text = "mcg/mL"
            }
            lblYields.text = String(format:"%.1f", yields)
            
            let infusion = Dose * weight/(totalDose/IvBag*1000)*60
            txtInfusionRate.text = String(format:"%.2f", infusion)
        }
            
        else if unit == "ng/kg/min" {
            //1 ng=0.001 mcg or 1000 ng=1 mcg
            
            var yields = totalDose/IvBag * 1000000
            lblUnitYields.text = "ng/mL"
            if yields < 1 {
                yields = totalDose/IvBag*1000
                lblUnitYields.text = "ng/mL"
            }
            lblYields.text = String(format:"%.1f", yields)
            
            //let infusion = Dose * weight/(totalDose/IvBag/1000)*60
            let infusion = Dose * weight * 60 / (totalDose/IvBag * 1000000)

            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
            
            
        else if unit == "mcg/kg/hr" {
            var yields = totalDose/IvBag
            lblUnitYields.text = "mg/mL"
            if yields < 1 {
                yields = totalDose/IvBag*1000
                lblUnitYields.text = "mcg/mL"
            }
            lblYields.text = String(format:"%.1f", yields)
            
            let infusion = Dose * weight/(totalDose/IvBag*1000)
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
            
        else if unit == "mg/kg/hr" {
            var yields = totalDose/IvBag
            lblUnitYields.text = "mg/mL"
            if yields < 1 {
                yields = totalDose/IvBag*1000
                lblUnitYields.text = "mcg/mL"
            }
            lblYields.text = String(format:"%.1f", yields)
            
            let infusion = ((Dose * weight * IvBag) / totalDose)
            txtInfusionRate.text = String(format:"%.1f", infusion)
        }
        
        UserDefaults.standard.set(txtWeight.text, forKey: "weight")
        UserDefaults.standard.synchronize()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

