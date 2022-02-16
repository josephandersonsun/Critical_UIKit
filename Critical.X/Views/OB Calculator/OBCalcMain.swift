//
//  ViewController.swift
//  OBCalcMain
//
//  Created by Admin on 27/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import DatePickerDialog

class OBCalcMain: UIViewController {

    
    @IBOutlet var btnLMP: UIButton!
    @IBOutlet var btnEDD: UIButton!
    
    var LMP : Date?
    var EDD : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "OB Calculator"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func btnLMPClick(_ sender: Any) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                self.LMP = date
                self.EDD = nil
                
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM dd, yyyy"
                self.btnLMP.setTitle(formatter.string(from: dt), for: .normal)
                self.btnEDD.setTitle("Tap to select due date", for: .normal)
            }
        }
    }
    
    
    @IBAction func btnEDDClick(_ sender: Any) {
        DatePickerDialog().show("DatePicker", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .date) {
            (date) -> Void in
            if let dt = date {
                self.LMP = nil
                self.EDD = date
                
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM dd, yyyy"
                self.btnEDD.setTitle(formatter.string(from: dt), for: .normal)
                self.btnLMP.setTitle("Tap to select date", for: .normal)
            }
        }
    }
    
    @IBAction func Calculate(_ sender: Any) {
        if (self.LMP != nil) || (self.EDD != nil) {
            let ResultVC = self.storyboard?.instantiateViewController(withIdentifier: "Result") as! OBResultView
            ResultVC.LMP = self.LMP
            ResultVC.EDD = self.EDD
            //Present Modally
            present(ResultVC, animated: true, completion: nil)
            //self.navigationController?.pushViewController(ResultVC, animated: true)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

