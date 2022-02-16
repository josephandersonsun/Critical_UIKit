//
//  FluidBloodCollection.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 4/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//
//
//  FluidBloodCollection.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 4/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class FluidBloodCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            // Takes the button and makes it into a circle
            closeButton.layer.cornerRadius = closeButton.frame.size.width / 2
        }
    }
    
    fileprivate let cellId = "cellId"
    
    
    // Main Title
    var titleArray = [String]()
    // Subtitles
    var detailArray = [String]()
    
    var storyBoardID = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Animate the ultrasound title. if so import AKLabel
        //VentTitleLabel.animate(text: "Titlename", duration: 1, completion: nil)
        
        
        
        titleArray =  ["ABO Compatibility", "Fluids / Blood Products"]
        
        detailArray = ["DONOR AND RECIPIENT BLOOD COMPATIBILITY",
                       "OVERVIEW OF BLOOD AND FLUID"]
        
        storyBoardID = ["ABO", "FB"]
        
        // let images = ["normal","LAP","apnea","hypo","elevated","hyper"]
        
        
    }
    
    //Dismiss the view
    @IBAction func dismissViewController(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FluidBloodCollectionCell
        
        //Configure the cell
        cell.titleLabel.text =  titleArray [indexPath.item]
        cell.detailLabel.text =  detailArray [indexPath.item]
        
        return cell
    }
    
    
    // Pass the data from the cells and data to the detailView Controller.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // print(OBstoryBoardID [indexPath.item])
        // Set the Storyboard ID to each indexPath.
        //let SBID = OBstoryBoardID [indexPath.item]
        
        // ABO PAGE --> MODAL
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "FluidAndBloodStoryboard", bundle: nil) // Name has to reflect the origionting SB
            let aboutVC = storyboard.instantiateViewController(withIdentifier: "ABO") // Making sure the identifier matches the SBID
            self.present(aboutVC, animated: true, completion: nil)

        }
            
            // Fluids PAGE --> MODAL
        else if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "FluidAndBloodStoryboard", bundle: nil) // Name has to reflect the origionting SB
            let fluid = storyboard.instantiateViewController(withIdentifier: "FB") // Making sure the identifier matches the SBID
            self.present(fluid, animated: true, completion: nil)
        }
    
    // Push the ViewController via Navigation
        // self.navigationController?.pushViewController(<# Name #>, animated: true)
    
    // Modal
        //self.present(<# Name #>, animated: true, completion: nil)

        
    }
    
}
    
    
    

