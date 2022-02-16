//
//  StrokeMenu.swift
//  Neuro
//
//  Created by Jadie Barringer III on 1/30/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit


class Stroke: UIViewController {

    @IBOutlet weak var subduralHematomaDescription: UILabel!
    @IBOutlet weak var sah: UILabel!
    @IBOutlet weak var ischemicStroke_Description: UILabel!
    @IBOutlet weak var IntracerebralHemorrhage_Description: UILabel!
    @IBOutlet weak var epidural_Description: UILabel!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       scrollView.recalculateVerticalContentSize_synchronous()

   }
    
    

    @IBAction func goToStrokeDetail(_ sender: Any) {
    }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "strokeSub" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let strokeDetailInfo = segue.destination as? StrokeDetail {
                
                // This is where we reference the object on the rec VC and set it to what we
                
                //Name of the image
                strokeDetailInfo.ctImageName = "Subdural"
                // Title Header
                strokeDetailInfo.strokeHeading = "Subdural Hematoma"
                // Description Header
                // We have to access the class then t
            strokeDetailInfo.strokeDescrip = StrokeDetail.CVADescription.subduralHematomaDescription.rawValue
                strokeDetailInfo.strokefibrinylitics = "Fibrinolytics contraindicated"
                
                print("Subdural Hematoma Selected")

            }
        }
        if segue.identifier == "sah" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let strokeDetailInfo = segue.destination as? StrokeDetail {
                
                // This is where we reference the object on the rec VC and set it to what we
                
                //Name of the image
                strokeDetailInfo.ctImageName = "SAH1"
                // Title Header
                strokeDetailInfo.strokeHeading = "Subarachnoid Hemorrhage"
                // Description Header
                // We have to access the class then t
                strokeDetailInfo.strokeDescrip = StrokeDetail.CVADescription.sah.rawValue
                strokeDetailInfo.strokefibrinylitics = "Fibrinolytics contraindicated"
                
                print("SAH Selected")

            }
        }
        
        if segue.identifier == "ischemicStroke" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let strokeDetailInfo = segue.destination as? StrokeDetail {
                
                // This is where we reference the object on the rec VC and set it to what we
                
                //Name of the image
                strokeDetailInfo.ctImageName = "Ischemic CVA1"
                // Title Header
                strokeDetailInfo.strokeHeading = "Ischemic Stroke"
                // Description Header
                // We have to access the class then t
                strokeDetailInfo.strokeDescrip = StrokeDetail.CVADescription.ischemicStroke_Description.rawValue
                strokeDetailInfo.strokefibrinylitics = "Consider Fibrinolytics"
                
                print("Ischemic Stroke Selected")

            }
        }
        
        if segue.identifier == "ich" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let strokeDetailInfo = segue.destination as? StrokeDetail {
                
                // This is where we reference the object on the rec VC and set it to what we
                
                //Name of the image
                strokeDetailInfo.ctImageName = "ICH"
                // Title Header
                strokeDetailInfo.strokeHeading = "Intracerebral Hemorrhage"
                // Description Header
                // We have to access the class then t
                strokeDetailInfo.strokeDescrip = StrokeDetail.CVADescription.IntracerebralHemorrhage_Description.rawValue
                strokeDetailInfo.strokefibrinylitics = "Fibrinolytics contraindicated"
                print("ICH Selected")

            }
        }
        if segue.identifier == "epi" {
            // We segue to ACLSVC and pass the infomation from which row is pressed
            if let strokeDetailInfo = segue.destination as? StrokeDetail {
                
                // This is where we reference the object on the rec VC and set it to what we
                
                //Name of the image
                strokeDetailInfo.ctImageName = "Epidural"
                // Title Header
                strokeDetailInfo.strokeHeading = "Epidural Hematoma"
                // Description Header
                // We have to access the class then t
                strokeDetailInfo.strokeDescrip = StrokeDetail.CVADescription.epidural_Description.rawValue
                strokeDetailInfo.strokefibrinylitics = "Fibrinolytics contraindicated"
                
                print("Epidual Hematoma Selected")
            }
        }
        
    }
    
    
    
    
    
    
    
}
