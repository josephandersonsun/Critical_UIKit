//
//  LMA_Extensions.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/19/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import EasyPeasy
import UIKit
//import SwiftRichString



extension LMA {
    
    func setUpLabels()
    {
        
        // MARK: Create the titleLabel
        let titleLabel : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
            //label.bottom(10)
            label.text = "Laryngeal Mask Airway".uppercased()
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Clouds
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = Font.regular.withSize(25)
            label.adjustsFontSizeToFitWidth = true
            
            return label
        }()
        
        //Adds the label to the subview
        contentView.addSubview(titleLabel)
        
        
        
        /* Now we have to position the label to where we want it after its added to the subview. Centers the label in the middle of the UView, set the top margin, height and width */
        titleLabel.easy.layout(
            Width(340), // Sets the width of the label
            Height(50), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(3.0).to(contentView),
            Left(10).to(contentView),
            Right(10).to(contentView)) // Sets the value from the top of the selectedView.
        
        
        
        
        // MARK: Set up the subTitle and Create the UILabel
        
        let subTitleLabel : UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
            //label.bottom(10)
            label.text = "Supraglottic Airway Device"
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Sunflower
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = Font.regular.withSize(12)
            label.adjustsFontSizeToFitWidth = true
            
            return label
        }()
        
        //Adds the label to the subview
        contentView.addSubview(subTitleLabel)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        subTitleLabel.easy.layout(
            Width(310), // Sets the width of the label
            Height(30), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(5.0).to(titleLabel),
            Left(10).to(contentView),
            Right(10).to(contentView)) // Sets the value from the top of the selectedView.
        
        
        
        //MARKLMAImage thats under the title
        
        let placeholderImage : UIImageView = {
            let placeholderImage = UIImageView(image: UIImage(named: "LMA_Classic")); placeholderImage.contentMode = .scaleAspectFit
            
            /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
            placeholderImage.clipsToBounds = true
            placeholderImage.layer.cornerRadius = 5
            return placeholderImage
        }()
        
        //Adds the image to the view
        contentView.addSubview(placeholderImage)
        
        /* Now we have to position the label to where we want it after its added to the subview
         Centers the label in the middle of the UView, set the top margin, height and width */
        placeholderImage.easy.layout(
            Width(250), // Sets the width of the label
            Height(200), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(10).to(subTitleLabel),
            Left(10).to(contentView),
            Right(10).to(contentView)) // Sets the value from the top of the subTitle.
        
        // First crate the language for the paragraphs to go into the label. We are only going to use one label.
        let firstParagraphLbl : UILabel = {
            
            let label = UILabel()
            
            let firstParagraph: String = {
                return "The Laryngeal Mask Airway is an alternative airway device that is used during anesthesia to support the airway. It is an appropriate airway choice when bag valve mask ventilation is warranted but endotracheal intubation is not indicated. It is also used as a back-up airway device during failed oral tracheal intubation. Consisting of a silicone mask and a rubber connecting tube, it is inserted blindly into the oropharynx forming a low-pressure seal around the laryngeal inlet-permitting general positive pressure ventilation."
            }()
            
            
            let contraIndicationInfo = {
                return "The LMA is contraindicated in non-fasting patients, patients who exhibit morbid obesity, and those with obstructive or abnormal lesions of the oropharynx."
            }()
            
            let finalParagraph  = {
                return "A disadvantage of using the standard LMA vs. the intubating LMA (iLMA) is that the standard LMA does not allow high pressure positive pressure ventilation and does not fully protect against aspiration in non-fasting patients."
            }()
            
            //label.bottom(10)
            label.text = firstParagraph + "\n\n\n" + contraIndicationInfo + "\n\n\n" + finalParagraph
            label.lineBreakMode = .byWordWrapping
            label.textColor = Colorify.Clouds
            label.textAlignment = .center
            label.numberOfLines = 0
            label.font = UIFont(name: "HelveticaNeue", size: 15.0)
            
            return label
        }()
        
        
        
        
        //MARK: View to hold Content
        /** Create the view befire adding the label to the subView so that it can be size to fit */
        let blackBGView : UIView = {
            let view = View()
            view.backgroundColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
            return view
        }()
        
        //Adds the backgroundView to the subview
        contentView.addSubview(blackBGView)
        
        // Adds a nice corner radius to the view
        blackBGView.layer.cornerRadius = 4
        
        
        //Now we have to position the VIEW to where we want it after its added to the subview
        blackBGView.easy.layout(
            Width(330), // Sets the width of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(10).to(placeholderImage)) // Sets the value from the top of the view to the bottom of the image.
        
        //Now Adds the label to the subview just crated above
        blackBGView.addSubview(firstParagraphLbl)
        
        // MOST IMPORTANT PART FOR SIZING
        // SubView resizes to fit the content inside of it.
        blackBGView.sizeToFit()
        
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        firstParagraphLbl.easy.layout(
            //Width(310.0), // Sets the width of the label
            
            //WE Dont USE HEIGHT BECAUSE WE SET THE LINES TO ZERO AND ALLOW TO AUTO ADJUST
            CenterX(0.0),// Centers the label in the center of the view
            Left(15).to(blackBGView),Right(15).to(blackBGView),Bottom(15).to(blackBGView),Top(15.0).to(blackBGView))
        
        
        /// WE finish by adding the last image of the lma to the bottom

        /** Create the view */
        let lastImageView : UIView = {
            let view = View()
            view.backgroundColor = UIColor.clear
            return view
        }()
        
        
        //Adds the view to the subview
        contentView.addSubview(lastImageView)
        
        lastImageView.layer.cornerRadius = 4
        
        //Now we have to position the view to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        lastImageView.easy.layout(
            Width(250), // Sets the width of the label
            Height(200), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(10).to(blackBGView),
            Left(10).to(contentView),
            Right(10).to(contentView),
            Top(10).to(blackBGView)) // Sets the value from the top of the selectedView.
        
        
        
        
        
        
        
        let LMA_InsertionImage : UIImageView = {
            let lastImage = UIImageView(image: UIImage(named: "LMA_Insertion")); lastImage.contentMode = .scaleAspectFit
            
            /// Rounds the corners 15 pixels of the UIView name. 4 px for a button
            lastImage.clipsToBounds = true
            lastImage.layer.cornerRadius = 5
            return lastImage
        }()
        
        //Adds the image to the view
        contentView.addSubview(LMA_InsertionImage)
        
        /* Now we have to position the label to where we want it after its added to the subview
         Centers the label in the middle of the UView, set the top margin, height and width */
            LMA_InsertionImage.easy.layout(
            Width(250), // Sets the width of the label
            Height(200), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(10).to(blackBGView),
            Left(10).to(contentView),
            Right(10).to(contentView)) // Sets the value from the top of the subTitle.
        
        
     
    }
    
    
}


