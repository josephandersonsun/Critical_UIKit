//
//  KingLT_Extension.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/17/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import EasyPeasy

extension KingLT {
    
  
    
    func displayKingLTImage()  {
       
        let placeholderImage : UIImageView = {
            let placeholderImage = UIImageView(image: UIImage(named: "KingLT_labels"))
            placeholderImage.contentMode = .scaleAspectFit
            
            /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
            placeholderImage.clipsToBounds = true
            placeholderImage.layer.cornerRadius = 5
            
            return placeholderImage
        }()
        
        //Adds the image to the view
        KingScrollView.addSubview(placeholderImage)
        
        /* Now we have to position the label to where we want it after its added to the subview
         Centers the label in the middle of the UView, set the top margin, height and width */
        placeholderImage.easy.layout(
            Width(340), // Sets the width of the label
            Height(200), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(90).to(KingScrollView)) // Sets the value from the top of the view.
        
    }

}



// Add the labels
extension KingLT {
    
    
    func setupLabels()  {
        
        /** Create the UILabel */
        let kingTitle : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
            //label.bottom(10)
            label.text = "KING LT AIRWAY"
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Clouds
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = Font.regular.withSize(30.0) // takes the header struct and changes the size
            
            return label
        }()
        
        //Adds the label to the subview
        KingScrollView.addSubview(kingTitle)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        kingTitle.easy.layout(
            Width(310.0), // Sets the width of the label
            Height(40.0), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(15).to(KingScrollView)) // Sets the value from the top of the view.
        
        //MARK: Supraglottic Sublabel
        /** Create the UILabel */
        
        let kingSubTitle : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
           // label.bottom(10)
            label.text = "Supraglottic Airway Device"
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Sunflower
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        
        //Adds the label to the subview
        KingScrollView.addSubview(kingSubTitle)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        kingSubTitle.easy.layout(
            Width(310.0), // Sets the width of the label
            Height(40.0), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(40.0).to(KingScrollView)) // Sets the value from the top of the selectedView.
        
    } //end of func
    
    
    
    
} // End of extension
