//
//  HomeMenu.swift
//  Neuro
//
//  Created by Admin on 27/01/2018.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class HomeMenu: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet var menuCollectionView: UICollectionView!
    
    var mainMenu = [String]()
    
    var subTitle = [String]()
    
    var cellImages = [String]()
    
    var storyBoardID = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Change the color of the navigation bar
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.150000006, green: 0.1899999976, blue: 0.2399999946, alpha: 1)

        // Set the navigatin title
        self.navigationItem.title = "Neuro"
        

        mainMenu = ["Cranial Nerves","Stroke Scores","Herniation","Increased ICP","Neuro Exam","Stroke pathology", "Normal CT brain", "GCS"]
        
        subTitle =  ["CRANIAL NERVES","ASSESSMENT & CALCULATORS","OVERVIEW OF HERNIATION PROCESS","SIGN OF INCREASED INTRACRANIAL PRESSURE","COMPLETE NEUROLOGICAL EXAM","DIFFERENT STROKE PATHOLOGIES", "CT SCAN OF THE BRAIN", "GLASCOW COMA SCALE"]
        
        
//        cellImages = ["CranialNerves1","GCS1","Herniation","Brain 44","brainMap","Brain-1", "CT1", "Brain 44" ]
        
        storyBoardID = ["A","StrokeCollection","C","D","E","F", "G", "gcsB"]
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! NeuroCollectionViewCell
        
        // Populate the cell labels
        cell.neuroCellLabel.text = mainMenu[indexPath.item]
        
        cell.neuroSubtitleLabel.text = subTitle[indexPath.item]

//        cell.neuroCellImage.image = UIImage (named:cellImages[indexPath.item])
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SBID = storyBoardID [indexPath.item]
        let storyboard = UIStoryboard(name: "Neuro", bundle: nil) // Has to reflect the storyBoard they are on. 
        if let vc = storyboard.instantiateViewController(withIdentifier: SBID) as? UIViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        print([indexPath.item])
    }
    

    


}
