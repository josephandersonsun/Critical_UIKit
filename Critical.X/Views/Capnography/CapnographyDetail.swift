//
//  capnographyDetail.swift
//  Capnography
//
//  Created by Jadie Barringer III on 1/21/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import UIKit



class CapnographyDetail: UIViewController {
    //MARK: - Global variables to pass data to
    var captitle = String ()
    var subtitle = String ()
    var causes = String ()
    var image = UIImage ()
    var causesTitle = String()
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var causesLabel: UILabel!
    
    @IBOutlet weak var capImageView: UIImageView!

    @IBOutlet weak var causesTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the labels to the varibale in which data is being passed to.
        titleLabel.text = captitle
        subtitleLabel.text = subtitle
        causesLabel.text = causes
        capImageView.image = image
        causesTitleLabel.text = causesTitle
        
        
    }

   

}
