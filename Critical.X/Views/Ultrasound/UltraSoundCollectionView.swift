//
//  UltraSoundCollectionView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/12/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel
import SCLAlertView

private let reuseIdentifier = "Cell"

class UltraSoundCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var USTitleLabel: AKLabel!
    
    // Variable declaration.
    var ultrasoundMainMenu = [String]()
    var ultrasoundMenuDetail = [String]()
    var storyBoardID = [String]()

    
    @IBAction func dismissUSVC(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Animate the ultrasound title.
        USTitleLabel.animate(text: "Ultrasound", duration: 1, completion: nil)
      
       
        ultrasoundMainMenu = ["E-FAST Examination", "RUSH Protocol- COMING SOON", "Lung Protocol- COMING SOON"] // 2
        ultrasoundMenuDetail = ["Extended-Focused Assessment with Sonography in Trauma", "Rapid Ultrasound for Shock & Hypotension", "Diagnose cardiopulmonary emergencies"] // 2
        storyBoardID = ["Fast","Rush","Resp"]
        
    }



    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return ultrasoundMainMenu.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Delcare the place where we are getting the cell info
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UltraSound_CollectionViewCell
        
        // Configure the cell
        cell.USMain_CellLabel.text = ultrasoundMainMenu[indexPath.item]
        cell.USDetail_CellLabel.text = ultrasoundMenuDetail [indexPath.item]
        
        // Change the color of the other 2 Cells that are in construction.
        switch indexPath.item {
        // Color changes for the 2nd and 3rd collection cell.
        case 1,2:
        
            cell.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
                
            cell.USDetail_CellLabel.textColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        
        default:
        
            cell.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        
            cell.USDetail_CellLabel.textColor = #colorLiteral(red: 0.6269999743, green: 0.9330000281, blue: 0.753000021, alpha: 1)
        }
        
        return cell
    }

    
    // Navigation sets the stroyboard ID to the indexPath and presents the View controller. 
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(storyBoardID [indexPath.item] + " was pressed and accessed")

        // Only secue for FAST
        switch indexPath.item {
        case 0:
            // Here we segue - The Name has to reflect the origionting SB.
            let storyboard = UIStoryboard(name: "Ultrasound", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Fast")
            self.present(vc, animated: true, completion: nil)

            // Show alert for the other RUSH and Resp views
        default:
            // Language to show the alert
          _ = SCLAlertView().showError("Not quite yet...", subTitle:"We are currently working on the content for this section. The content should be available in the next major update.", closeButtonTitle:"Thanks")
            
        }
            // Set the Storyboard ID to each indexPath.
            //let SBID = storyBoardID [indexPath.item]
        
            // Push the ViewController via Navigation
//            self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    
   


} // Close the class 
