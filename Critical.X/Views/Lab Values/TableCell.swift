//
//  TableCell.swift
//  LabValues
//
//  Created by Admin on 31/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    @IBOutlet var CellTitleLabel: UILabel!
    @IBOutlet var CellDescriptLabel: UILabel!
    @IBOutlet var CellValueLabel: UILabel!
    @IBOutlet var CellUnitsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
