//
//  OBDetailView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/28/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit


class OBDetailView: UIViewController {

    // Global varibales to be send info from the main
    // Titile of disorder
    var titleName = String()
    
    //describing the rhythm
    var descriptionString = String()
    
    // the name if the image passed
    var imageString = String ()

    // Decscribes the image
    var imageDescription = String()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fetalHeartImage: UIImageView!
    @IBOutlet weak var imageSmallDescription: UILabel!
    
    ///////////////SET THIS TO THE CONTENTVIEW HEIGHT NOT SCROLLVIEW
    // SEt the constrain to the CONTENT VIEWS HEIGHT NOT THE SCROLLER>
    @IBOutlet weak var scrollHeight: NSLayoutConstraint!
    // This is the constrain height of the scrollView.
    
    
    //VIEWDID APPEAR!!!!!!!!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        /// Takes the scroll height outlet for the view, and adds it the the labels that are in the view. Pads it about  100 pixels at the end.REFERENCE THE ORIGIN ADD UP ALL OF THE VIEWS OR LABELS AND ADD A BUFFER
        scrollHeight.constant = descriptionLabel.frame.origin.y + descriptionLabel.frame.size.height + 50
        
        print("\(descriptionLabel.frame.size.height) Height constraint Value")
        
    }
    
    
    
    override func viewDidLoad() {
        
        // Set the label to the passed string
        titleLabel.text = titleName
        
        // Sets the description label to the string which is connect oto an emum
        descriptionLabel.text = descriptionString
        
        imageSmallDescription.text = imageDescription
        
        // Populate the image with the string passed.
        fetalHeartImage.image = UIImage(named: imageString)
    }
    
 
    
    @IBAction func dismissOB(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        print("OBDetail View Controller was dismissed")
        
    }
}
