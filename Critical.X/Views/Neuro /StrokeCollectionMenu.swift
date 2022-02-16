//
//  StrokeCollectionMenu.swift
//  Neuro
//
//  Created by Jadie Barringer III on 2/3/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class StrokeCollectionMenu: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var strokeCollectionView: UICollectionView!

    var strokeMenu = [String]()
    
    var strokeSubtitleMenu = [String]()

    var storyBoardID = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        strokeMenu = ["GCS","RACE Stroke Scale","Cincinnati Stroke","NIH", "Ischemic Stroke"]
        
        strokeSubtitleMenu = ["Glascow Coma Score","RACE Stroke Calculator","Cincinnati Stroke Calculator","National Institutes of Health Stroke Scale", "Ischemic Stroke Pathology & S/S"]
        
        
        storyBoardID = ["gcsB","Race","Cinci", "NIH", "Ischemic"]    }

   
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strokeMenu.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StrokeCollectionCell
        
        // Populate the labels
        cell.strokeCellLabel.text = strokeMenu[indexPath.item]
        
        cell.strokSubTitle.text = strokeSubtitleMenu[indexPath.item]
        
        return cell
    }
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let SBID = storyBoardID [indexPath.item]
        let storyboard = UIStoryboard(name: "Neuro", bundle: nil) // Make sure the SB name is the name of the sending SB.
        if let vc = storyboard.instantiateViewController(withIdentifier: SBID) as? UIViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        print([indexPath.item])
    }

}
