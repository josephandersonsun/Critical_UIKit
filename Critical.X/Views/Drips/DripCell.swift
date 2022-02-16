//
//  DripCell.swift
//  Critical Drips
//
//  Created by Admin on 10/02/2018.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit

class DripCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblPropofol: UILabel!
    @IBOutlet var lbl_DoseAmount: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
