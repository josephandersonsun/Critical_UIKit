//
//  ColorFromHex.swift
//  CriticalPediatrics
//
//  Created by Jadie Barringer III on 7/2/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // The is where i can make custom colors. From coolors.co
    static let color_Custom_MintGreen = UIColor().colorFromHex("#9DD19D")
    static let color_Custom_LightGray = UIColor().colorFromHex("#C2B8B2")
    static let color_Custom_NavyBlue = UIColor().colorFromHex("#2E415B")
    static let color_Custom_QueenBlue = UIColor().colorFromHex("#457B9D")

    // Function to convert the hext to RGB color
    func colorFromHex(_ hex: String)-> UIColor {
        
       var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") { hexString.remove (at: hexString.startIndex)}
        
        if hexString.count != 6 {return UIColor.black}
        
        var rgb : UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        
        return UIColor.init(red: CGFloat ((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat ((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat (rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
    
    
    
    
    
    
    
    
    
    
}
