//
//  ResultViewController.swift
//  OBCalculator
//
//  Created by Admin on 27/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import Foundation

class OBResultView: UIViewController {
   
    
    @IBOutlet weak var resultsView : UIView! {
        didSet {
            resultsView.clipsToBounds = true
            resultsView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var lblLMP: UILabel!
    @IBOutlet var lblEDD: UILabel!
    @IBOutlet var lblPregnant: UILabel!
    
    public var LMP : Date?
    public var EDD : Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Result"
        self.Calculate()
        // Do any additional setup after loading the view.
    }
    
    func Calculate() -> Void {
        if (self.LMP != nil) {
            var dateComponents = DateComponents.init()
            dateComponents.year = 1
            dateComponents.month = -3
            dateComponents.day = 7
            let myCal = Calendar.current
            self.EDD = myCal.date(byAdding: dateComponents, to: self.LMP!)
        }
        else if (self.EDD != nil) {
            var dateComponents = DateComponents.init()
            dateComponents.year = -1
            dateComponents.month = 3
            dateComponents.day = -7
            let myCal = Calendar.current
            self.LMP = myCal.date(byAdding: dateComponents, to: self.EDD!)
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM dd, yyyy"
        self.lblLMP.text = formatter.string(from: self.LMP!)
        self.lblEDD.text = formatter.string(from: self.EDD!)
        
        if ((self.EDD?.timeIntervalSinceNow.toInt())! < 0) {
            self.lblPregnant.text = "Your baby should be delivered"
        }
        else if ((self.LMP?.timeIntervalSinceNow.toInt())! > 0) {
            self.lblPregnant.text = "Error with LMP date"
        }
        else {
            let time = -(self.LMP?.timeIntervalSinceNow)!
            let sweek = 60 * 60 * 24 * 7
            let sday = 60 * 60 * 24
            
            let week = time.toInt()!/sweek
            let day = (time.toInt()! % sweek)/sday
            self.lblPregnant.text = "You have been pregnant for \(week) weeks & \(day) days"
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func dismissOBResultView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



extension Double {
    func toInt() -> Int? {
        if self > Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}
