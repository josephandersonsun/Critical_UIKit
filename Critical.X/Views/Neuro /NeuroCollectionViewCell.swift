//
//  NeuroCollectionViewCell.swift
//  Neuro
//
//  Created by Jadie Barringer III on 1/25/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import Foundation

class NeuroCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var neuroCellImage: UIImageView!
    
    
    @IBOutlet weak var neuroSubtitleLabel: UILabel!
    
    
    @IBOutlet weak var neuroCellLabel: UILabel!

    
    
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //self.neuroCellImage.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
        
        self.setCircularImageView()
        //self.setShadows()
        
        self.setCornorRadiusOfCell()
    }
    
    func setCircularImageView() {
//        self.neuroCellImage.layer.cornerRadius = CGFloat(roundf(Float(self.neuroCellImage.frame.size.width / 2.0)))
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

