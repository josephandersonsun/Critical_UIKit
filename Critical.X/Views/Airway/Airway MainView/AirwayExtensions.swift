//
//  AirwayExtensions.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/17/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

extension AirwayMenu {
    
    
    
    func setupLabel() {
        //Create the SubLabel
        
        //Create the labels
        
        /** Create the UILabel */
        let supraglotticSubLabel: UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 24, y: 140, width: 310, height: 40)
            //label.bottom(10)
            label.text = "Supraglottic Airway Device"
            label.lineBreakMode = .byWordWrapping
            label.textColor =  #colorLiteral(red: 0.9449999928, green: 0.7689999938, blue: 0.05900000036, alpha: 1)
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        
        //Adds the label to the subview
        airWayView1.addSubview(supraglotticSubLabel)
        
        //Now we have to position the label to where we want it after its added to the subview
        //Centers the label in the middle of the UView, set the top margin, height and width
        supraglotticSubLabel.easy.layout(
            Width(310.0), // Sets the width of the label
            Height(40.0), //Sets the height of the label
            CenterX(0.0), // Centers the label in the center of the view
            Top(140.0).to(airWayView1)) // Sets the value from the top of the selectedView.
        
        
        
        //MARK: INTUBATION SUBLABEL
        
        /** Create the UILabel */
        let theLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 24, y: 51, width: 310, height: 40)
            //label.bottom(10)
            label.text = "One pass laryngoscopy"
            label.lineBreakMode = .byWordWrapping
            label.textColor =  #colorLiteral(red: 0.9449999928, green: 0.7689999938, blue: 0.05900000036, alpha: 1)
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        //Adds the label to the subView
        airWayView1.addSubview(theLabel)
        
        //Centers the label in the middle of the UView, set the top margin, height and width
        theLabel.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(50.0).to(airWayView1))
        
        
        //MARK: Create the LMA SubLabel
        /** Create the UILabel */
        let lmaLabel: UILabel = {
            let label = UILabel()
            //label.frame = CGRect(x: 17, y: 50, width: 310, height: 40)
            //label.bottom(10)
            label.text = "LMA"
            label.lineBreakMode = .byWordWrapping
            label.textColor =  #colorLiteral(red: 0.9449999928, green: 0.7689999938, blue: 0.05900000036, alpha: 1)
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        airWayView2.addSubview(lmaLabel)
        
        //Centers the label in the middle of the UView, set the top margin, height and width
        lmaLabel.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(50.0).to(airWayView2))
        
        //MARK: Create the SubLabel
        /** Create the UILabel */
       
        let lemonMoansLabel: UILabel = {
            let label = UILabel()
            //Uncomment if not using Easy Peasy or Stevia
            //label.frame = CGRect(x: 17, y: 132, width: 310, height: 40)
            //label.bottom(10)
            label.text = "Lemon, Moans, Rods, Short"
            label.lineBreakMode = .byWordWrapping
            label.textColor =  #colorLiteral(red: 0.9449999928, green: 0.7689999938, blue: 0.05900000036, alpha: 1)
            label.textAlignment = .center
            label.numberOfLines = 1
            label.font = UIFont(name: "HelveticaNeue", size: 12.0)
            
            return label
        }()
        airWayView2.addSubview(lemonMoansLabel)
        
        //Centers the label in the middle of the UView, set the top margin, height and width
        lemonMoansLabel.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(134.0).to(airWayView2))
        
    }
    
} // End of extension




// CREATE THE BUTTONS AND SUBTITLES
extension AirwayMenu {
    
    
    //MARK: INTUBATION BUTTON
    func createIntubationButton() {
        let intubationBtn = UIButton ()
        // intubationBtn.frame = CGRect(x: 24, y: 13, width: 310, height: 40)
        
        //SEt color of the button
        intubationBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        // Set title name
        intubationBtn.setTitle("INTUBATION", for: UIControl.State.normal)
        
        //Set the title font
        intubationBtn.titleLabel!.font = Font.medium.withSize(15)
        
        //Set the color of the button title
        intubationBtn.setTitleColor(UIColor.gray, for: .normal)
        
        // Creates the selector that used to create the IBAction function.
        intubationBtn.addTarget(self, action: #selector(self.buttonActionClicked), for: .touchUpInside)
        
        intubationBtn.tag = 1 // Creates the tagnumber
        
        intubationBtn.layer.cornerRadius = 4 // Rounds the corner of the button
        
        
        //adds the button to the subView
       airWayView1.addSubview(intubationBtn)
        //Centers the button in the middle of the UView, set the top margin, height and width
    
        
        intubationBtn.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(13.0).to(airWayView1),
            Left(10).to(airWayView1),
            Right(10).to(airWayView1))

    }
}

extension AirwayMenu {
    
    func createKingLTButton() {
        let kingLTBtn = UIButton ()
        // kingLTBtn.frame = CGRect(x: 18, y: 98, width: 310, height: 40)
        
        kingLTBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        kingLTBtn.setTitle("KING LT AIRWAY", for: UIControl.State.normal)
        

        kingLTBtn.titleLabel!.font = Font.medium.withSize(15)
        
        kingLTBtn.setTitleColor(UIColor.gray, for: .normal)
        
        // Creates the selector that used to create the IBAction function.
        kingLTBtn.addTarget(self, action: #selector(self.buttonActionClicked), for: .touchUpInside)
        
        kingLTBtn.tag = 2 // Creates the tagnumber
        
        kingLTBtn.layer.cornerRadius = 4 // Rounds the corner of the button
        
        // Adds the label to the subview
        airWayView1.addSubview(kingLTBtn)
        
        //Centers the button in the middle of the UView, set the top margin, height and width
        kingLTBtn.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(98.0).to(airWayView1),
            Left(10).to(airWayView1),
            Right(10).to(airWayView1))
        
        
    }
    
}


extension AirwayMenu {
    
    func createLMAButton() {
        let LMABtn = UIButton ()
        //LMABtn.frame = CGRect(x: 17, y: 18, width: 310, height: 40)
        
        LMABtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        LMABtn.setTitle("LARYNGEAL MASK AIRWAY", for: UIControl.State.normal)
        
        LMABtn.titleLabel!.font = Font.medium.withSize(15)
        
        //Set the color of the button title
        LMABtn.setTitleColor(UIColor.gray, for: .normal)

        // Creates the selector that used to create the IBAction function.
        
        LMABtn.addTarget(self, action: #selector(self.buttonActionClicked), for: .touchUpInside)
        
        LMABtn.tag = 3 // Creates the tagnumber
        
        LMABtn.layer.cornerRadius = 4 // Rounds the corner of the button
        //LMABtn.top(50).left(15).size(50)
        
        //adds the button to the subView
        airWayView2.addSubview(LMABtn)
        
        //Centers the button in the middle of the UView, set the top margin, height and width
        LMABtn.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(18.0).to(airWayView2),
            Left(10).to(airWayView2),
            Right(10).to(airWayView2))
        
    }
    
}



extension AirwayMenu {
    
    //MARK: Predictor button
    func createPredictorsButton() {
        let predictorButton = UIButton ()
        //predictorButton.frame = CGRect(x: 17, y: 100, width: 310, height: 40)
        
        predictorButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //predictorButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        
        predictorButton.setTitle("PREDICTORS OF A DIFFICULT AIRWAY", for: UIControl.State.normal)
        
        predictorButton.titleLabel!.font = Font.medium.withSize(15)
        
        predictorButton.setTitleColor(UIColor.gray, for: .normal)
        
        // Creates the selector that used to create the IBAction function.
        predictorButton.addTarget(self, action: #selector(self.buttonActionClicked), for: .touchUpInside)
        predictorButton.tag = 4 // Creates the tagnumber
        predictorButton.layer.cornerRadius = 4 // Rounds the corner of the button
        //predictorButton(50).left(15).size(50)
        
        //adds the button to the subView
        airWayView2.addSubview(predictorButton)
        
        //Centers the button in the middle of the UView, set the top margin, height and width
        predictorButton.easy.layout(
            Width(310.0),
            Height(40.0),
            CenterX(0.0),
            Top(100.0).to(airWayView2),
            Left(10).to(airWayView2),
            Right(10).to(airWayView2))
        
    }
}


