//
//  VentMode_CollectionView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/29/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel



//Global variable to set when passing data
var assignVentID = Int()


class VentMode_CollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // Animate the title label
    @IBOutlet weak var VentTitleLabel: AKLabel!

    @IBOutlet weak var closeButton: UIButton! {
        // Takes the button and makes it into a circle
        didSet {closeButton.layer.cornerRadius = closeButton.frame.size.width / 2 }
    }
    
    // Main Title
    var ventData = [String]()
    // Subtitles
    var ventsubData = [String]()
    // Explanation of the modes
    var ventExplanationDetail = [String]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Animate the ultrasound title.
        VentTitleLabel.animate(text: "Ventilation Modes", duration: 1, completion: nil)
        
        
        ventsubData =  ["AC", "APRV", "BiPAP",  "CPAP/PS","IMV", "IRV","PCV", "PRVC", "PSV", "SIMV"]
        
        ventData = ["Assist Control", "Airway Pressure Release Ventilation", " Bilevel Positive Airway Pressure", "Continous Positive Airway Pressure ","Intermittent Mandatory Ventilation ", "Inverse Ratio Ventilation","Pressure Control Ventilation", "Pressure Regulated Volume Control", "Pressure Support Ventilation", "Synchronized Intermittent Mandatory Ventilation"]
        
    }
    
    @IBAction func dismissVent(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}


extension VentMode_CollectionView {
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ventData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! VentModeCell
        
        // Configure the cell from the oulets in the cell Class.
        cell.ventTitle.text = ventsubData[indexPath.item]
        cell.ventdetailTitle.text = ventData [indexPath.item]
        
        
        return cell
    }
    
    // Pass the data from the cells and data to the detailView Controller.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // print(OBstoryBoardID [indexPath.item])
        // Set the Storyboard ID to each indexPath.
        //let SBID = OBstoryBoardID [indexPath.item]
        
        
        
        let storyboard = UIStoryboard(name: "VentModes", bundle: nil) // Has to reflect the storyBoard they are on.
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "A") as? VentMode_detailVC {
            
            // Set these first to the strings to pass
            vc.ventTitleString = ventData[indexPath.item]
            vc.subTitle = ventsubData [indexPath.item]
            vc.ventID = assignVentID
            // We would ususally take the array of strings and set them here.
            //vc.ventDescriptionString = ventExplanationDetail [indexPath.item]
            
            
            // Take the index path of the vent mode selected and set it to the enum explanation above.
             // Each vent id will line up with each menu item and we will reference that to swith on it in the detail VC
            
            switch indexPath.item {
            
            // AC
            case 0:
                assignVentID = 1
                vc.ventDescriptionString = VentilatorModes.AC.rawValue
                print("Assigned id to send is \(assignVentID)")
                
            // APRV
            case 1:
                assignVentID = 2
                vc.ventDescriptionString = VentilatorModes.APRV.rawValue
                print("Assigned id to send is \(assignVentID)")
                
            // BiLevel
            case 2:
                assignVentID = 3
                vc.ventDescriptionString = VentilatorModes.Bipap.rawValue
                print("Assigned id to send is \(assignVentID)")
                
            //CPAP
            case 3:
                assignVentID = 4
                vc.ventDescriptionString = VentilatorModes.CPAP.rawValue
                print("Assigned id to send is \(assignVentID)")
            
            //IMV
            case 4:
               
                assignVentID = 5
                vc.ventDescriptionString = VentilatorModes.IMV.rawValue
                print("Assigned id to send is \(assignVentID)")
                
            //IRV
            case 5:
                assignVentID = 6
                vc.ventDescriptionString = VentilatorModes.IRV.rawValue
                print("Assigned id to send is \(assignVentID)")
                
               
            //PCV
            case 6:
                assignVentID = 7
                vc.ventDescriptionString = VentilatorModes.PCV.rawValue
                print("Assigned id to send is \(assignVentID)")
               
                //PRVC
                
            case 7:
                assignVentID = 8
                vc.ventDescriptionString = VentilatorModes.PRVC.rawValue
                print("Assigned id to send is \(assignVentID)")
                
                //PSV
                
            case 8:
                assignVentID = 9
                vc.ventDescriptionString = VentilatorModes.PSV.rawValue
                print("Assigned id to send is \(assignVentID)")
                
            //SIMV
            case 9:
                assignVentID = 10
                vc.ventDescriptionString = VentilatorModes.SIMV.rawValue
                print("Assigned id to send is \(assignVentID)")
            default:
                break
            }
            
            // If there were iages
//            vc.imageDescription = smallDescriptionString [indexPath.item]
//            vc.imageString = fetalImageNames[indexPath.item]
//
            // Then present the view controller
            self.present(vc, animated: true, completion: nil)
            
            
        }
        
        print([indexPath.item])
        
        // Push the ViewController via Navigation
        //            self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    

    
}
