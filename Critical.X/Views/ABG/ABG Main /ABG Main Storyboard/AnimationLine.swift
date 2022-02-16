//
//  AnimationLine.swift
//  CriticalABG
//
//  Created by Jadie Barringer III on 10/28/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import SCLAlertView
import UIKit

extension ABGViewController {
    /// ---
    /// # UIView Line Animations
    /// ## Using UIVew.animate
    ///
    /// + First point
    ///   1. We use UIView.animate with duration.
    ///   2. Set the center of the UIView to the top of the frame of
    /// Some code - indented by four spaces
    ///  self.lineView.center.y = self.bicarbSideLabel.frame.origin.y
    ///
    /// ---
    /// seealso: [Apple web site](www.apple.com)
    
    func animateBicarb() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.lineView.center.y = self.bicarbSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    //MARK: -  Animate to the pH
    func aniimatePh()  {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            self.lineView.center.y = self.phSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    //MARK: -  Animate to the Na
    func animateSodium (){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.lineView.center.y = self.NaSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    //MARK: - Animate to the Chloride
    func animateChloride (){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.lineView.center.y = self.ChlorideSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    //MARK: -  Animate to the albumin
    func animateAlbumin (){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.lineView.center.y = self.AlbuminSideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    //MARK: -  Animate to the c02
    func animateC02 (){
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear], animations: {
            
            // Implement animations
            self.lineView.center.y = self.c02SideLabel.frame.origin.y
        }, completion: nil)
    }
    
    
    
    //MARK: - Animate from Bottom to top
    func animateBottomToTop() {
        // This is where where the animations starts
        UIView.animate(withDuration: 0.8, animations: {
            
            if  self.lineView.center.y == self.AlbuminSideLabel.frame.origin.y
            {
                // If the line is already at the bottom at the position label albumin. Then we dont wanna wait 1 sec, change the color and speed up the animation transition.
                UIView.animate(withDuration: 0.5, animations: {
                    
                    // Implement animations and start the animation from current position down to the botton of the albumin label.
                    self.lineView.center.y = self.AlbuminSideLabel.frame.origin.y
                    self.lineView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
                    
                })
            }
                // If the line is not at the very bottom with the albumin label. Implement animation
            else {
                // Implement animations and start the animation from current position down to the botton of the albumin label.
                self.lineView.center.y = self.AlbuminSideLabel.frame.origin.y
                self.lineView.backgroundColor = #colorLiteral(red: 0.1919409633, green: 0.4961107969, blue: 0.745100379, alpha: 1)
            }
            
            // when the animation is complete, return back to the top to position with the pHlabel.
        }, completion: { (finished) in
            
            // When it gets to the end, we want it to animate back to the top
            UIView.animate(withDuration: 0.8, animations: {
                self.lineView.center.y = self.phSideLabel.frame.origin.y
                self.lineView.backgroundColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            })
        })
    }
    
    
    
    // Animates the line under the pH TextField
    func animatepHLineView()  {
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseOut], animations: {
            
            // Implement animations. here i want it to animate to the right side of the textField.
            self.pHSlideView.center.x = self.pHTextField.frame.maxX
            
            // Trailing closure, what happens when the initial animation above is complete
        }, completion: { (finished) in
            
            // When it gets to the end, we want it to animate back to the left and change the color and Alpha
            UIView.animate(withDuration: 1, animations: {
                // 1 Animates from on left to the right
                self.pHSlideView.center.x = self.pHTextField.frame.minX
                // 2  Changes the bg color from the origional
                self.pHSlideView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                // 3 Fades the view at the end of the animation to zero
                self.pHSlideView.alpha = 0
            })
        })
    }
    
    
    
    // Animates the line under the c02 TextField
    func animateC02LineView()  {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseOut], animations: {
            // Implement animations. here i want it to animate to the left side of the textField and i shave off 20 points.
            self.c02SlideView.center.x = self.c02TextField.frame.minX + 20
            
            // Trailing closure, what happens when the initial animation above is complete
        }, completion: { (finished) in
            
            // When it gets to the end, we want it to animate back to the right and change the color and Alpha
            UIView.animate(withDuration: 1, animations: {
                // 1 Animates from on left to the right
                self.c02SlideView.center.x = self.c02TextField.frame.maxX
                // 2  Changes the bg color from the origional
                self.c02SlideView.backgroundColor = #colorLiteral(red: 0.8349413276, green: 0.3352985978, blue: 0.3409483433, alpha: 1)
                // 3 Fades the view at the end of the animation to zero
                self.c02SlideView.alpha = 0
            })
        })
    }
    
    
    
    
    
    //MARK: - Animation
    /**
     Animates the transitions
     - Transitions:
     - UIView Animate with duration: Time it takes to animate
     - Transoform : Current Bicarb Value
     
     Change the duration to adjust the time you want the animation to happen. Also, replace the view or label to your choice.
     */
    func showAnimate()
    {
        
        // Saying if the pH and C02 arent entered and are empty, dont calculate - show this.
        guard let _ = pH_value, let _ = c02_value else {
            
            // Display Error and alert here
            main_DisorderTitle_Label.textColor = #colorLiteral(red: 0.9219999909, green: 0.4629999995, blue: 0.3529999852, alpha: 1)
            
            // Show alert when the textFields are blank
            
            _ = SCLAlertView().showError("Hold On...", subTitle:"Enter a pH and C02 to continue...", closeButtonTitle:"OK")
            // main_DisorderTitle_Label.animate(text: "ERROR- Enter pH and C02", duration: 1, completion: nil)
            
            print("Values not entered properly")
            // Hide the labels when the alert pops up.
            compensationlbl.isHidden = true
            
            PrimaryDView.isHidden = true
            
            
            return  } // When they are enteres  then do this :
        
        // Animation for the button
        self.theoryButton.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.theoryButton.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.theoryButton.alpha = 1.0
            self.theoryButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        
        self.PrimaryDView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.PrimaryDView.alpha = 1.0;
        
        PrimaryDView.isHidden = false
        UIView .transition(with: PrimaryDView, duration: 0.5, options: .transitionFlipFromTop,
                           animations: {
                            //self.primaryDLabel.textColor = Colorify.Clouds
                            
        }, completion: nil)
        
        // Animation for the label
        compensationlbl.isHidden = false
        self.compensationlbl.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.compensationlbl.alpha = 0.0;
        
        UIView.animate(withDuration: 1.5, animations: {
            self.compensationlbl.alpha = 1.0
            self.compensationlbl.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        
        // Animation for the button
        self.deltaBUTTON.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.deltaBUTTON.alpha = 0.0;
        
        UIView.animate(withDuration: 0.5, animations: {
            self.deltaBUTTON.alpha = 1.0
            self.deltaBUTTON.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
        
        
        
        // Animation for the label
        self.ExpectedC02Label.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.ExpectedC02Label.alpha = 0.0;
        
        UIView.animate(withDuration: 0.5, animations: {
            self.ExpectedC02Label.alpha = 1.0
            self.ExpectedC02Label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    
    
}// End
