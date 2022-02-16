//
//  ViewController.swift
//  Critical Drips
//
//  Created by Jadie Barringer III on 2/9/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class CriticalPharmacology: UIViewController {
    
    public var info = [AnyHashable: Any]()
    
    let pregnancyClassBackgroundColorOptions = [
        "A" : UIColor.init(red:0.627, green:0.933, blue:0.753, alpha:1.000),
        "B" : UIColor.init(red:0.239, green:0.588, blue:0.882, alpha:1.000),
        "C" : UIColor.init(red:1.000, green:0.624, blue:0.263, alpha:1.000),
        "D" : UIColor.init(red:0.835, green:0.337, blue:0.341, alpha:1.000),
        "X" : UIColor.init(red:0.251, green:0.251, blue:0.251, alpha:1.000)]
    
    @IBOutlet var mainScrollView: UIScrollView!
    
    @IBOutlet var lbl_Title: UILabel!
    @IBOutlet var lbl_SubTitle: UILabel!
    @IBOutlet var lbl_dose: UILabel!
    @IBOutlet var btnIndications: UIButton!
    @IBOutlet var btn_AdversEffects: UIButton!
    @IBOutlet var btnWhatToKnow: UIButton!
    @IBOutlet var underLine: UIView!
    @IBOutlet var lbl_Details: UILabel!
    @IBOutlet weak var pregnancyClass: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet var viewCard1: CardView!
    @IBOutlet var viewCard2: CardView!
    @IBOutlet weak var viewCard3: CardView!
    @IBOutlet weak var mainBgView: UIView!
    
    @IBOutlet weak var adverse: UILabel!
    @IBOutlet weak var mechanism: UILabel!
    
    @IBOutlet weak var onSet: UILabel!
    @IBOutlet weak var halfLife: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var distribution: UILabel!
    @IBOutlet weak var absorbtion: UILabel!
    @IBOutlet weak var excretion: UILabel!
    @IBOutlet weak var metabolism: UILabel!
    

    public var index = 0
    private var step: Float = 1
    private var detail_type = 0
    private var Drip:NSDictionary!
    
    
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "Critical Meds"
        
        self.navigationItem.title = info["MainTitle"] as? String

        mainScrollView.keyboardDismissMode = UIScrollView.KeyboardDismissMode.onDrag
        
        lbl_Title.text = info["MainTitle"] as? String
        lbl_SubTitle.text = info["BrandName"] as? String
        lbl_dose.text = info["Dose"] as? String
        mechanism.text = info["Mechanism"] as? String
        adverse.text = info["AdverseEffects"] as? String
        lbl_Title.text = info["MainTitle"] as? String
        lbl_SubTitle.text = info["BrandName"] as? String
        onSet.text = info["Onset"] as? String
        halfLife.text = info["HalfLife"] as? String
        duration.text = info["Duration"] as? String
        absorbtion.text = info["Absorbtion"] as? String
        distribution.text = info["Distribution"] as? String
        metabolism.text = info["Metabolism"] as? String
        excretion.text = info["Excretion"] as? String
        pregnancyClass.text = info["PregnancyClass"] as? String
        pregnancyClass.backgroundColor = pregnancyClassBackgroundColorOptions[pregnancyClass.text!]
        
    
        /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
        pregnancyClass.clipsToBounds = true
        pregnancyClass.layer.cornerRadius = 12
        
        SwitchTabs()

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    func interfaceConfig() -> Void {
        mechanism.sizeToFit()
        self.viewCard1.frame = CGRect(x: 16, y: self.lbl_Details.frame.origin.y + self.lbl_Details.frame.size.height + 20, width: self.view.frame.size.width - 32, height: 82 + mechanism.frame.size.height)
        viewCard1.isHidden = false
        
        adverse.sizeToFit()
        viewCard2.frame = CGRect(x: 16, y: viewCard1.frame.origin.y + viewCard1.frame.size.height + 24, width: self.view.frame.size.width - 32, height: 82 + adverse.frame.size.height)
        viewCard2.isHidden = false
        
        viewCard3.frame = CGRect(x: 16, y: viewCard2.frame.origin.y + viewCard2.frame.size.height + 24, width: self.view.frame.size.width - 32, height: viewCard3.frame.size.height)
        viewCard3.isHidden = false
        
        mainBgView.frame.size.height = viewCard3.frame.origin.y + viewCard3.frame.size.height + 24
        
        mainScrollView.contentSize = CGSize(width: 0, height: mainBgView.frame.size.height)
    }
    
    func SwitchTabs() -> Void {
        var x_underLine:CGFloat = 0.0
        var detailString = ""
        if detail_type == 0 {
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation."
            
            //set the text to draw from the pList.
            detailString = (info["DrugClass"] as? String)!
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.black, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            
            x_underLine = btnIndications.frame.origin.x
            
        }
        else if detail_type == 1 {
            
            detailString = (info["Indications"] as? String)!
            
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation. \n• Conscious sedation."
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.black, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            
            x_underLine = btn_AdversEffects.frame.origin.x
        }
        else if detail_type == 2 {
            detailString = (info["Contraindications"] as? String)!
            
            //lblDetails.text = "• Indications for diprivan would be continued sedation. \n• Conscious sedation. \n • Indications for diprivan would be continued sedation. \n• Conscious sedation. \n• Conscious sedation."
            
            //Colors of the button title changes when each button is selected.
            btnIndications.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btn_AdversEffects.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            btnWhatToKnow.setTitleColor(UIColor.black, for: UIControl.State.normal)
            
            x_underLine = btnWhatToKnow.frame.origin.x
        }
        
        lbl_Details.text = detailString
        lbl_Details.sizeToFit()
        
        UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveLinear, animations: {
            self.underLine.frame = CGRect(x: x_underLine, y: 34, width: 86, height: 4)
            self.lbl_Details.frame = CGRect(x: 20, y: self.lbl_Details.frame.origin.y, width: self.view.bounds.width - 36, height: self.lbl_Details.frame.size.height)
            
            self.interfaceConfig()
        }, completion: { (finished) in
//            self.mainScrollView.contentSize = CGSize(width: 0, height: self.viewCard2.frame.origin.y + self.viewCard2.frame.size.height + 50)
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
    
    
    @IBAction func popOVerPregnancyClass(_ sender: Any) {
        
        let popTip = PopTip()
        
        popTip.bubbleColor = UIColor.darkGray
        
        popTip.textColor = UIColor.white
        
        popTip.actionAnimation = .float(0.5) // This will float for 0.5 instead of the default value
        
        // Identified where in the view to make the popUp show
        
        let here = CGRect (x: 160, y: 100, width: 100, height: 100)
        let there = CGRect(x: 400,y: 400,width: 10,height: 10)
        
        //Changes the font of the pop-up and size
        popTip.font = UIFont(name: "HelveticaNeue", size: 14.0)!
        
        //The display popover is in the center, with no arrow, in this case the from can be the whole view:

        popTip.show(text: "Class-A: Adequate and well-controlled studies have failed to demonstrate a risk to the fetus in the first trimester of pregnancy (and there is no evidence of risk in later trimesters).\n\nClass-B: Animal reproduction studies have failed to demonstrate a risk to the fetus, and there are no adequate and well-controlled studies in pregnant women.\n\nClass-C: Animal reproduction studies have shown an adverse effect on the fetus, and there are no adequate and well-controlled studies in humans, but potential benefits may warrant use of the drug in pregnant women despite potential risks.\n\nClass-D: There is positive evidence of human fetal risk based on adverse reaction data from investigational or marketing experience or studies in humans, but potential benefits may warrant use of the drug in pregnant women despite potential risks.\n\nClass-X: Studies in animals or humans have demonstrated fetal abnormalities, and there is positive evidence of human fetal risk based on adverse reaction data from investigational or marketing experience, and the risks involved in the use of the drug in pregnant women clearly outweigh potential benefits.", direction: .none, maxWidth: 300, in: view, from: view.frame)
        
        
      
        //let the user dismiss the popover by tapping on it
        popTip.shouldDismissOnTap = true
        popTip.hide()
        
        }
    

        
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

