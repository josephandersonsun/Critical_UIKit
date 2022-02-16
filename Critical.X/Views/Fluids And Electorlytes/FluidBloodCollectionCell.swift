//
//  FluidBloodCollectionCell.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 4/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//
//
//  FluidBloodCollectionCell.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 4/17/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class FluidBloodCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setShadows()
        self.setCornorRadiusOfCell()
    }
    
    
    // Takes the collectionView cell and makes a shadow behind the cell. Make sure set the BG color of the cell to white.
    func setShadows() -> Void {
        self.contentView.layer.cornerRadius = 2.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func setCornorRadiusOfCell() -> Void {
        self.layer.cornerRadius = 5.0
        //        self.layer.borderWidth = 1.0
        //        self.layer.borderColor = UIColor.gray.cgColor
        //        self.backgroundColor = UIColor.white
        //        self.layer.masksToBounds = true
    }
}

    

