//
//  EkgMenuTableViewController.swift
//  ACLS
//
//  Created by Jadie Barringer III on 12/21/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class EkgMenuTableViewController: UITableViewController {
    
    
    @IBOutlet weak var crtiticalEkgSubTitle: AKLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the navigatin title
        self.navigationItem.title = "EKG's"
        

    }
    
    //Animates the label once the view appears
    override func viewDidAppear(_ animated: Bool) {
        
        crtiticalEkgSubTitle.animate(text: "ACLS and EKG Interpretations" , duration: 1, completion: nil)

    }
    
    //Clears the subTitle once the view dissappears to reset
    override func viewDidDisappear(_ animated: Bool) {
    
        crtiticalEkgSubTitle.text = ""
    }

    @IBAction func dismissEkgTableView(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func dismissEkgTableViewBottom(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
   //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        ///SVT
        if segue.identifier == "SVT" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and Titles
                New_EKG_DataViewController.ekgTitle = "Supraventricular Tachycardia"
                New_EKG_DataViewController.subTitle = "Narrow Complex Tachycardia"
                New_EKG_DataViewController.header = "SVT"
                
                //Descriptions
                New_EKG_DataViewController.medsToConsider = Medications.SVT.rawValue
                New_EKG_DataViewController.ekgDescription = SVT_setAttributedString_ChangeColorsForText(text:RhythmDescription.SVT.rawValue)
                New_EKG_DataViewController.rhythmName =  EKGRhythm.SVT.rawValue
                
                print("SVT was selected")
            }
    }
        ///VFib
        if segue.identifier == "V-fib" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and Titles
                New_EKG_DataViewController.ekgTitle = "Ventricular Fibrillation"
                New_EKG_DataViewController.subTitle = "Shockable Rhythm ⚡️"
                New_EKG_DataViewController.header = "V-Fib"
                
                //Descriptions
                New_EKG_DataViewController.medsToConsider = Medications.Vfib.rawValue
                New_EKG_DataViewController.ekgDescription = VFib_setAttributedString_ChangeColorsForText(text:RhythmDescription.Vfib.rawValue)
                New_EKG_DataViewController.rhythmName = EKGRhythm.Vfib.rawValue
                
                New_EKG_DataViewController.aclsView.backgroundColor = UIColor.blue
                print("VFib was selected")
            }
        }
        ///VTach
        if segue.identifier == "VTach" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and Titles
                New_EKG_DataViewController.header = "V-Tach"
                New_EKG_DataViewController.ekgTitle = "Ventricular Tachycardia"
                New_EKG_DataViewController.subTitle = "Wide Complex Tachycardia"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = Vtach_setAttributedString_ChangeColorsForText(text:RhythmDescription.Vtach.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.Vtach.rawValue
                New_EKG_DataViewController.rhythmName = EKGRhythm.Vtach.rawValue

                print("VTach was selected")
            }
        }
        ///Sinus Tach
        if segue.identifier == "SinusTach" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Sinus Tachycardia"
                New_EKG_DataViewController.subTitle = "Narrow Complex Tachycardia"
                New_EKG_DataViewController.header = "Sinus Tach"
                
                //Descriptions
                New_EKG_DataViewController.medsToConsider = Medications.SinusTach.rawValue
                New_EKG_DataViewController.ekgDescription = sinusTach_setAttributedString_ChangeColorsForText(text:RhythmDescription.SinusTach.rawValue)
                New_EKG_DataViewController.rhythmName =  EKGRhythm.SinusTach.rawValue
                
                print("Sinus Tach was selected")
            }
        }
        ///Sinus Brady
        if segue.identifier == "SinusBrady" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Sinus Bradycardia"
                New_EKG_DataViewController.subTitle = "Bradycardia"
                New_EKG_DataViewController.header = "Bradycardia"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = sinusBrady_setAttributedString_ChangeColorsForText(text:RhythmDescription.SinusBrady.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.SinusBrady.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.SinusBrady.rawValue
                
                print("Sinus Brady was selected")
            }
        }
        ///Torsades
        if segue.identifier == "Torsades" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Torsades de pointes"
                New_EKG_DataViewController.header = "Torsades"
                New_EKG_DataViewController.subTitle = "Polymorphic V-Tach / Shockable ⚡️"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = torsades_setAttributedString_ChangeColorsForText(text:RhythmDescription.Torsades.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.Torsades.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.Torsades.rawValue
                
                print("torsades was selected")
            }
        }
        ///NSR
        if segue.identifier == "NSR" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Normal Sinus Rhythm"
                New_EKG_DataViewController.header = "NSR"
                New_EKG_DataViewController.subTitle = "Sinus Rhythm"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = NSR_setAttributedString_ChangeColorsForText(text:RhythmDescription.NormalSinus.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.NormalSinus.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.NormalSinus.rawValue
                
                print("NSR was selected")
            }
        }
        
        ///Afib
        if segue.identifier == "Afib" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles=
                New_EKG_DataViewController.ekgTitle = "Atrial Fibrillation"
                New_EKG_DataViewController.header = "A-Fib"
                New_EKG_DataViewController.subTitle = "Atrial Dysrhythmia"
                
                //Descriptions
                //New_EKG_DataViewController.ekgDescription = RhythmDescription.Afib.rawValue
                New_EKG_DataViewController.ekgDescription = setAttributedString_ChangeColorsForText_AFIB(text: RhythmDescription.Afib.rawValue)

                New_EKG_DataViewController.medsToConsider = Medications.Afib.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.Afib.rawValue
                
                print("Afib was selected")
            }
        }
        
        ///Asystole
        if segue.identifier == "Asystole" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Asystole"
                New_EKG_DataViewController.header = "Cardiac Arrest"
                New_EKG_DataViewController.subTitle = "Cardiac Arrest"
                
                //Descriptions
                New_EKG_DataViewController.medsToConsider = Medications.Asystole.rawValue
                New_EKG_DataViewController.ekgDescription = asystole_setAttributedString_ChangeColorsForText(text:RhythmDescription.Asystole.rawValue)
                New_EKG_DataViewController.rhythmName =  EKGRhythm.Asystole.rawValue
                
                print("Asystole was selected")
            }
        }
        ///Aflutter
        if segue.identifier == "Aflutter" {
            
            // We segue to New_EKG_DataViewController and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Atrial Flutter"
                New_EKG_DataViewController.header = "A-flutter"
                New_EKG_DataViewController.subTitle = "Atrial Dysrhythmia"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = aflutter_setAttributedString_ChangeColorsForText(text:RhythmDescription.Aflutter.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.Aflutter.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.Aflutter.rawValue
                
                print("Aflutter was selected")
            }
        }
        
        ///3rd Degree
        if segue.identifier == "ThirdDegree" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "3rd Degree AV Block"
                New_EKG_DataViewController.header = "Heart Block"
                New_EKG_DataViewController.subTitle = "Complete AV Dissasociation"
               
                //Descriptions
                New_EKG_DataViewController.ekgDescription = ThirdDegree_setAttributedString_ChangeColorsForText(text:RhythmDescription.ThirdDegreeHeartBlock.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.ThirdDegreeHeartBlock.rawValue
                New_EKG_DataViewController.rhythmName =  EKGRhythm.ThirdDegreeHeartBlock.rawValue
                
                print("3rd Degree was selected")
            }
        }
        
        ///2ndDegreeTypeII
        if segue.identifier == "2ndDegreeTypeII" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Second Degree Type II"
                New_EKG_DataViewController.header = "Heart Block"
                New_EKG_DataViewController.subTitle = "2˚ Type II AV Block"
               
                //Descriptions
                New_EKG_DataViewController.medsToConsider = Medications.SecondDegreeTypeII.rawValue
                New_EKG_DataViewController.ekgDescription = secDegreeTypeII_setAttributedString_ChangeColorsForText(text:RhythmDescription.SecondDegreeTypeII.rawValue)
                New_EKG_DataViewController.rhythmName =  EKGRhythm.SecondDegreeTypeII.rawValue
                
                print("2ndDegreeTypeII was selected")
            }
        }
        
        ///Wenkebach
        if segue.identifier == "Wenkeback" {
            // We segue to MiniDrugVC and pass the infomation from which button is pressed
            if let New_EKG_DataViewController = segue.destination as? ACLSViewController {
                
                //Headings and titles
                New_EKG_DataViewController.ekgTitle = "Second Degree Type I"
                New_EKG_DataViewController.header = "Wenckeback"
                New_EKG_DataViewController.subTitle = "Wenckeback"
                
                //Descriptions
                New_EKG_DataViewController.ekgDescription = wenkebach_setAttributedString_ChangeColorsForText(text:RhythmDescription.Wenkebach.rawValue)
                New_EKG_DataViewController.medsToConsider = Medications.Wenkebach.rawValue
                New_EKG_DataViewController.rhythmName = EKGRhythm.Wenkebach.rawValue
                
                print("Wenkeback was selected")
            }
        }
        
        
        
}
}
