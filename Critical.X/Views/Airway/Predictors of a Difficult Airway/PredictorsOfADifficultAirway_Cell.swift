//
//  PredictorsOfADifficultAirway_Cell.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/19/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class PredictorsOfADifficultAirway_Cell: UICollectionViewCell

{
    // Set the outlets
    @IBOutlet weak var predictorsMain_Menu_CellLabel: UILabel!
    
    @IBOutlet weak var predictors_Detail_CellLabel: UILabel!
    
    
    //ROUNDS THE CORNERS OF THE COLLECTIONVIEW CELL
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCornorRadiusOfCell()
    }
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    func setCornorRadiusOfCell() -> Void {
        self.layer.cornerRadius = 5.0
        
    }
}
