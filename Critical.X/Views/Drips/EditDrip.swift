//
//  EditDrip.swift
//  Critical Drips
//
//  Created by Admin on 11/02/2018.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit


class EditDrip: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var txtTotalDose: UITextField!
    @IBOutlet var txtIvBag: UITextField!
    @IBOutlet var txtMinDose: UITextField!
    @IBOutlet var txtMaxDose: UITextField!
    @IBOutlet var txtDefaultDose: UITextField!
    @IBOutlet var txtDoseUnit: UITextField!
    
    
    @IBOutlet weak var unitLabelMainVC: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet var lblUnitMin: UILabel!
    @IBOutlet var lblUnitMax: UILabel!
    @IBOutlet var lblUnitDefault: UILabel!
    
    public var index = 0
    var Dripslist : NSMutableArray!
    var Drip : NSMutableDictionary!
    var dosingUnit: String?

    var unit : String!
    let UnitList = ["mcg/min", "mg/min", "mcg/hr","mg/hr", "g/hr", "units/hr", "units/min", "mUnits/min", "mcg/kg/min", "mcg/kg/hr", "mg/kg/hr"]
    var UnitPickerView : UIPickerView!
    
    
 
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        print(index , "This is the index")
    
        Dripslist = NSMutableArray.init(array: UserDefaults.standard.object(forKey:"drip_list") as! NSArray)
        
        Drip = NSMutableDictionary.init(dictionary: Dripslist[index] as! NSDictionary)
        
        self.navigationItem.title = Drip.object(forKey: "maintitle") as? String
        
        txtTotalDose.text = Drip.object(forKey: "totaldose") as? String
        txtIvBag.text = Drip.object(forKey: "bag") as? String
        txtMinDose.text = Drip.object(forKey: "min") as? String
        txtMaxDose.text = Drip.object(forKey: "max") as? String
        txtDefaultDose.text = Drip.object(forKey: "dose") as? String
        
        unit = Drip.object(forKey: "unit") as? String
        txtDoseUnit.text = unit
        lblUnitMin.text = unit
        lblUnitMax.text = unit
        lblUnitDefault.text = unit
        
        switch index {
        
        case 16, 30:// heparin & vasopressin
            unitLabelMainVC.text = "units"
            print("heparin & vasopressin changed label to grams")
        
        case 20:// Mag Suflate
           
            unitLabelMainVC.text = "g"
            print("mag sulfate changed label to grams")
        
        default:
            break
            
        }
        
        
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 4
        
        UnitPickerView = UIPickerView.init()
        UnitPickerView.delegate = self
        UnitPickerView.dataSource = self
        UnitPickerView.showsSelectionIndicator = true
        txtDoseUnit.inputView = UnitPickerView
    }

    @IBAction func SaveClick(_ sender: Any) {
        Drip.setValue(txtTotalDose.text, forKey: "totaldose")
        Drip.setValue(txtIvBag.text, forKey: "bag")
        Drip.setValue(txtMinDose.text, forKey: "min")
        Drip.setValue(txtMaxDose.text, forKey: "max")
        Drip.setValue(txtDefaultDose.text, forKey: "dose")
        Drip.setValue(unit, forKey: "unit")
        
        Dripslist.replaceObject(at: index, with: Drip)
        
        UserDefaults.standard.set(Dripslist, forKey: "drip_list")
        UserDefaults.standard.synchronize()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UnitList.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UnitList[row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        unit = UnitList[row]
        txtDoseUnit.text = unit
        lblUnitMin.text = unit
        lblUnitMax.text = unit
        lblUnitDefault.text = unit
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
