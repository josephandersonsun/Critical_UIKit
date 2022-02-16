//
//  PredictorsViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/19/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import EasyPeasy

class PredictorsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
  // Variable declaration.
    var predictorsMainMenu = [String]()
    var predictorsMainMenuDetail = [String]()

    override func viewWillAppear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1803921569, green: 0.1803921569, blue: 0.1803921569, alpha: 1)
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
//        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
//        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        predictorsMainMenu = ["Lemon".uppercased(),
                              "Rods".uppercased(),
                              "Moans".uppercased(),
                              "Short".uppercased()]
        
        predictorsMainMenuDetail = ["Difficult Direct Laryngoscopy",
                       "Difficulty with Bag-Valve Mask Ventilations",
                       "Difficulty with a Supraglottic Airway Device",
                       "Difficult Cricothyrotomy"]
        
        
    /** Create the titleLabel */
        
        let titleLabel : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
           // label.bottom(10)
            label.text = "Predictors".uppercased()
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Clouds
            label.textAlignment = .center
            label.numberOfLines = 0
            label.adjustsFontSizeToFitWidth = true
            label.font = Font.regular.withSize(45)
            
            return label
        }()
        
        //Adds the label to the subview
        view .addSubview(titleLabel)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        titleLabel.easy.layout(
            Width(310.0), // Sets the width of the label
            Height(50.0), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(100).to(view),
            Left().to(view),
            Right().to(view)) // Sets the value from the top of the selectedView.
        
        
        /** Create the UILabel */
        
        let subTitleLabel : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
            //label.bottom(10)
            label.text = "OF Difficult Airways".uppercased()
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Sunflower
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        
        //Adds the label to the subview
        view .addSubview(subTitleLabel)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        subTitleLabel.easy.layout(
            Width(310.0), // Sets the width of the label
            Height(20.0), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(10.0).to(titleLabel),
            Left().to(view),
            Right().to(view)) // Sets the value from the top of the selectedView.
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return predictorsMainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Make sure to change the name of the CollectionView Cell VC. 
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PredictorsOfADifficultAirway_Cell
        //populate the labels inside the collectionView
        cell.predictorsMain_Menu_CellLabel.text = predictorsMainMenu[indexPath.item]
        cell.predictors_Detail_CellLabel.text = predictorsMainMenuDetail [indexPath.item]
        
        return cell
    }
    

    
     //MARK: - Navigation

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Lemons --> MODAL
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "DifficultAirway", bundle: nil) // Name has to reflect the origionting SB
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "Lemons") // Making sure the identifier matches the SBID
            self.present(aboutVC, animated: true, completion: nil)
            
        }
        
        // Rods PAGE --> MODAL
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "DifficultAirway", bundle: nil) // Name has to reflect the origionting SB
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "Rods") // Making sure the identifier matches the SBID
            self.present(aboutVC, animated: true, completion: nil)
            
        }
        
        // Moans  --> MODAL
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "DifficultAirway", bundle: nil) // Name has to reflect the origionting SB
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "Moans") // Making sure the identifier matches the SBID
            self.present(aboutVC, animated: true, completion: nil)
            
        }
        
        
        // Short  --> MODAL
        if indexPath.row == 3 {
            let storyboard = UIStoryboard(name: "DifficultAirway", bundle: nil) // Name has to reflect the origionting SB
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "Short") // Making sure the identifier matches the SBID
            self.present(aboutVC, animated: true, completion: nil)
            
        }
    }
    

}

 


