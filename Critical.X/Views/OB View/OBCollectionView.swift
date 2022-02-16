//
//  OBCollectionView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/28/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

private let reuseIdentifier = "Cell"

class OBCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var OBTitleLabel: AKLabel!
    
    // Variable declaration.
    var OBMainMenu = [String]()
    var OBMenuDetail = [String]()
    var OBstoryBoardID = [String]()
    var fetalDescriptions = [String]()
    var smallDescriptionString = [String]()
    var fetalImageNames = [String]()
    
    @IBAction func dismissOB(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the navigatin title
        self.navigationItem.title = "OB"
        

        // Do any additional setup after loading the view.
        // Animate the ultrasound title.
       OBTitleLabel.animate(text: "Fetal Heart Monitoring", duration: 1, completion: nil)
        
        
        OBMainMenu = ["Normal Fetal Heart Rhythm", // 0
                      "Elevated Heart Rate", // 1
                      "Early Decelerations", // 2
                      "Late Decelerations", //3
                      "Variable Decelerations"]  // 4
       
        OBMenuDetail = ["Fetal Heart Monitoring", // 0
                        "Fetal Heart Monitoring", // 1
                        "Fetal Heart Monitoring", // 2
                        "Fetal Heart Monitoring", // 3
                        "Fetal Heart Monitoring"] // 4
        //OBstoryBoardID = ["A","B","C","D","E"]
        
        // The descriptions takes an array of enums in order and we will pick the dsrpition at the botton per indexpath.row
        fetalDescriptions = [fetalDescriptionsText.normal.rawValue, // 0
                             fetalDescriptionsText.elevated.rawValue, // 1
                             fetalDescriptionsText.early.rawValue, //2
                             fetalDescriptionsText.late.rawValue, //3
                             fetalDescriptionsText.variable.rawValue] // 4
        
        smallDescriptionString = ["Normal or Reassuring Pattern", // 0
                                  "Elevated Heart Rate",
                                    "The onset and return of the deceleration coincides with the start and end of the contraction. Decelerations are associated wtih fetal movement, stimulation and uterine contractions",
                                    "with variability",
                                    "Variable Decelerations",]
        
        fetalImageNames = ["Normal Fetal HR.new",
                           "Fetal Tachycardia.new",
                           "Early Decels.new",
                           "Late Decelerations.new",
                           "Variable Decelerations.new"]
    }
    

    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return OBMainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! OBCollectionCell
        
        // Configure the cell from the oulets in the cell Class. 
        cell.OBMain_CellLabel.text = OBMainMenu[indexPath.item]
        cell.OBDetail_CellLabel.text = OBMenuDetail [indexPath.item]
        
        
        return cell
    }
    
    
//     Navigation sets the stroyboard ID to the indexPath and presents the View controller.
//
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       // print(OBstoryBoardID [indexPath.item])


        // Set the Storyboard ID to each indexPath.
        //let SBID = OBstoryBoardID [indexPath.item]

        let storyboard = UIStoryboard(name: "Obstetrics", bundle: nil) // Has to reflect the storyBoard they are on.
        if let vc = storyboard.instantiateViewController(withIdentifier: "A") as? OBDetailView {
            
            // Set these first to the strings to pass
            vc.titleName = OBMainMenu[indexPath.item]
            vc.descriptionString = fetalDescriptions [indexPath.item]
            vc.imageDescription = smallDescriptionString [indexPath.item]
            vc.imageString = fetalImageNames[indexPath.item]
            
            // Then present the view controller
             self.present(vc, animated: true, completion: nil)
            
            
        }
        print([indexPath.item])
        
        // Push the ViewController via Navigation
        //            self.navigationController?.pushViewController(vc, animated: true)


    }
    

    
        
    
    
    
    
} // End of the class
