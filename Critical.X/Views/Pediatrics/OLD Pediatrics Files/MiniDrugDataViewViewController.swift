//
//  MiniDrugDataViewViewController.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 12/1/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit

class MiniDrugDataViewViewController: UIViewController {
    
    @IBOutlet weak var miniDrugView: UIView!
    @IBOutlet weak var drugInfomationLabel: UILabel!
    @IBOutlet weak var drugTitleLabel: UILabel!
    @IBOutlet weak var drugClass_Label: UILabel!
    
    
    var buttonName: String = ""
    var drugInfo: String?
    var buttonInt: Int?
    var drugClass: String = ""
    var myView = UIView()
    
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        
        upDateDrugInformation()
        
    }
        
   
    
    //MARK: Helper Function to execute the views
    func upDateDrugInformation() {
        
        /// Takes the title of the button and assigns it to the label.
        drugTitleLabel.text = buttonName
        
        //Small description label at the top displays the drug Class.
        drugClass_Label.text = drugClass
        drugClass_Label.sizeToFit()
        
        //Resizes the labels and updates them as well.
        drugInfomationLabel.text = drugInfo
        drugInfomationLabel.sizeToFit()
    }
    
    
    
    
    //MARK: BorderColor
    func borderColor(){
        // Adds a border col
        self.miniDrugView.layer.cornerRadius = 13
        self.miniDrugView.layer.borderWidth = 3
        self.miniDrugView.layer.borderColor = UIColor.red.cgColor
    }
    
    //Dismisses the drudViewController
    @IBAction func dismissInfoDrugView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
