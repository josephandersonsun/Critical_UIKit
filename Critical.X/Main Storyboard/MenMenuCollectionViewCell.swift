//
//  MenMenuCollectionViewCell.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/6/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class MenMenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainMenu_CellImage: UIImageView!
    
    @IBOutlet weak var mainMenu_CellLabel: UILabel!
    
    @IBOutlet weak var mainMenuDetail_CellLabel: UILabel!

    
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mainMenu_CellImage.layer.masksToBounds = true
    }
    
    
    //MARK: - Layout subviews

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.setCircularImageView()
        self.setShadows()
        self.setCornorRadiusOfCell()
    }
    
    func setCircularImageView() {
        self.mainMenu_CellImage.layer.cornerRadius = self.mainMenu_CellImage.frame.size.width / 2.0
        //self.mainMenu_CellImage.layer.cornerRadius = CGFloat(roundf(Float(self.mainMenu_CellImage.frame.size.width / 2.0)))

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


    

