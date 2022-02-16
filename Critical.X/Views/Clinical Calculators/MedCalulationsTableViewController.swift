//
//  BasicTableViewController.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/9/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit
import AKLabel

class MedCalulationsTableViewController: UITableViewController {


    @IBOutlet weak var subTitleLabel: AKLabel!
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
        subTitleLabel.animate(text: "Medical References and Calculators" , duration: 1, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    

}
