//
//  FlatColors.swift
//  PassingCalculationData
//
//  Created by Jadie Barringer III on 12/12/17.
//  Copyright © 2017 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

    

public class FlatColor:NSObject {
    
    //    to call this method use FlatColor.FlatColor.BackgroundColor.Black.toUIColor()
    
    
 enum BackgroundColor {
    
    // Declaring the different color variations.
    
    case Red
    case Gray
    case Pink
    case Green
    case Blue
    case Purple
    case Orange
    case Yellow
    case White
    case Black
    case Salmon
    case Midnight
    
    // Func to define a color and return a UIColor value
    func toUIColor() -> UIColor {
        
        /// Switch on itself to the cases above in the emum declaring the color RGB values to return a UIColor.
        switch self {
            
        case .Red:
            return #colorLiteral(red: 0.8881979585, green: 0.3072378635, blue: 0.2069461644, alpha: 1)
            // UIColor(red:0.90, green:0.30, blue:0.26, alpha:1.00)
            
        case .Orange:
            return UIColor(red:1.00, green:0.60, blue:0.00, alpha:1.0)
            
        case .Yellow:
            return UIColor(red:0.94, green:0.76, blue:0.19, alpha:1.00)
            
        case .Green:
            return UIColor(red:0.22, green:0.80, blue:0.45, alpha:1.00)
            
        case .Blue:
            return UIColor(red:0.23, green:0.60, blue:0.85, alpha:1.00)
            
        case .Purple:
            return UIColor(red:0.60, green:0.36, blue:0.71, alpha:1.00)
            
        case .Pink:
            return UIColor(red:0.93, green:0.50, blue:0.78, alpha:1.00)
            
        case .Gray:
            return UIColor(red:0.50, green:0.55, blue:0.55, alpha:1.00)
            
        case .White:
            return UIColor(red:0.93, green:0.94, blue:0.95, alpha:1.00)
            
        case .Black:
            return UIColor(red:0.15, green:0.19, blue:0.24, alpha:1.00)
        
        case .Salmon:
            return UIColor(red:0.91, green:0.55, blue:0.57, alpha:1.00)
            
        case.Midnight:
            return UIColor(red:0.15, green:0.19, blue:0.24, alpha:1.00)
        }
    }
}
    /// Finally, call the emum as FlatColor.BackgroundColor.Green.toUIColor()

}
