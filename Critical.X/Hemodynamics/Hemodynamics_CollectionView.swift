//
//  Hemodynamics_CollectionView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 2/2/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

var hemodynamicCallID = Int() // Global Variabel to be passed an acccessed


class Hemodynamics_CollectionView:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var hemodynamicsTitleLabel: AKLabel!
    @IBOutlet weak var hemodynamicsImage: UIImageView!

    // Main Title
    var hemodynamicTitles = [String]()
    // Subtitles
    var hemodynamicValues = [String]()
    // Explanation of the modes
    var ventExplanationDetail = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Animate the ultrasound title.
        hemodynamicsTitleLabel.animate(text: "Hemodynamics", duration: 1, completion: nil)
        // Takes the button and makes it into a circle
        hemodynamicsImage.layer.cornerRadius = hemodynamicsImage.frame.size.width / 2
        
        hemodynamicTitles =  ["Arterial Oxygen Saturation (SaO2)", //0
            "Mixed Venous Saturation (SvO2)", //1
            "Central Venous Pressure (CVP)", //2
            "Right Ventricular Pressure (RVP)", //3
            "Pulmonary Artery Pressure (PAP)", //4
            "Pulmonary Artery Wedge Pressure (PAOP)", //5
            
            "Cardiac Output (CO)",//6
            "Cardiac Index (CI)",//7
            "Stroke Volume (SV)", //8
            "Stroke Volume Variation (SVV)",  //9
            "Systemic Vascular Resistance (SVR)",  //10
            "Systemic Vascular Resistance Index (SVRI)",  //11
            
            "Cardiogenic Shock",
            "Hypovolemic Shock",
            "Septic Shock- Hyperdynamic",
            "Septic Shock- Hypodynamic"]
        
        hemodynamicValues = ["95 - 100%", // 0
            "60 - 80%", // 1
            "2-6 mmHg", // 2
            "Systolic: 15-30 mmHg, Diastolic: 2-8 mmHg", // 3
            "Systolic: 15-30 mmHg, Diastolic: 8-15 mmHg",// 4
            "8-12 mmHg", //5
            
            "CO = HR * SV/1000: 4.0-8.0 L/min",//6
            "2.5-4.0 L/min/m2",//7
            "CO/HR x 1000: 60-100 mL's/beat",//8
            "10-15%", //9
            "800-1200 dynes-sec/cm –5" , //10
            "1700-2400 dynes-sec/cm –5/m", //11
        
            "CVP:⬆︎  PAOP:⬆︎ CO/CI:⬇︎ SVR:⬇︎",
            "CVP:⬇︎  PAOP:⬇︎ CO/CI:⬇︎ SVR:⬇︎",
            "CVP:⬆︎⬇︎ PAOP:⬆︎ CO/CI:⬆︎ SVR:⬇︎",
            "CVP:⬆︎⬇︎ PAOP:⬇︎ CO/CI:⬇︎ SVR:⬇︎"]
        
        
    }
    
    
    
    @IBAction func dismissHemodynamics(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("Hemodynamics Controller was dismissed")
        
    }
}



extension Hemodynamics_CollectionView {
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return hemodynamicTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Hemodynamics_Cell
        
        // Configure the cell from the oulets in the cell Class.
        cell.hemoTitle.text = hemodynamicTitles[indexPath.item]
        cell.hemoSubTitle.text = hemodynamicValues [indexPath.item]
        
        // We are changing the color of the Detail Subtitle only here.
        switch indexPath.row {
       
        case 14:
            cell.hemoSubTitle.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case 15:
            cell.hemoSubTitle.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
        case 16:
            cell.hemoSubTitle.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        case 17:
            cell.hemoSubTitle.textColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        default:
            cell.hemoSubTitle.textColor = #colorLiteral(red: 0.920953393, green: 0.447560966, blue: 0.4741248488, alpha: 1)
        }
        return cell
    }
    
    // Pass the data from the cells and data to the detailView Controller.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // print(OBstoryBoardID [indexPath.item])
        // Set the Storyboard ID to each indexPath.
        //let SBID = OBstoryBoardID [indexPath.item]
        
        
        
        let storyboard = UIStoryboard(name: "Hemodynamics", bundle: nil) // Has to reflect the storyBoard they are on.
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "A") as? Hemodynamics_DetailView {
            
            // Set these first to the strings to pass
            
            //Set the title label with index path
            vc.titleString_hemodynamics = hemodynamicTitles [indexPath.item]
            
            //Set detail according to index path array
            vc.subTitle_hemodynamics = hemodynamicValues [indexPath.item]
            
            
            switch indexPath.item {
                
            // Arterial Oxygentaion
            case 0:
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 1
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.ArterialOxygenSaturation.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                print("Assigned id to send is \(assignVentID)")
                
            // Mixed Venous
            case 1:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 2
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.MixedVenousSaturation.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            // CVP
            case 2:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 3
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.CentralVenousPressure.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Name od the image to be passed
                vc.imageString = "SwanWaveform"

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            //RVP
            case 3:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 4
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.RightVentricularPressure.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            //PA Pressure
            case 4:
                
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 5
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.PulmonaryArteryPressure.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Name od the image to be passed
                vc.imageString = "SwanWaveform"
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            //WEdge Pressure
            case 5:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 6
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.PulmonaryArteryWedgePressure.rawValue
                
                // Name od the image to be passed
                vc.imageString = "SwanWaveform"
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
                
            
            case 6:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 7
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.CardiacOutput.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
           
            case 7:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 8
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.CardiacIndex.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
          
            case 8:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 9
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.StrokeVolume.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
           
            case 9:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 10
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.StrokeVolumeVariation.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)

                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
           
            case 10:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 11
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.SystemicVascularResistance.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
              
            
            case 11:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 12
                
                // What text to send to the global string to set to the label
                vc.descriptionString_hemodynamics = ParameterDetails.SystemicVascularResistanceIndex.rawValue
                
                // Present the View Controller
                self.present(vc, animated: true, completion: nil)
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            
            case 12:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 13
                
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
                
            
            case 13:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 14
                
             
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
             
            
            case 14:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 10
                
              
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            
            case 15:
                
                // Int to pass to reference and switch on in the detail
                hemodynamicCallID = 10
                
               
                
                // Print Statement
                print("Assigned id to send is \(assignVentID)")
                
            default:
                break
            }
            
            // If there were iages
            //            vc.imageDescription = smallDescriptionString [indexPath.item]
            //            vc.imageString = fetalImageNames[indexPath.item]
            //
            // Then present the view controller
            
            
        }
        
        print([indexPath.item])
        
        // Push the ViewController via Navigation
        //            self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

