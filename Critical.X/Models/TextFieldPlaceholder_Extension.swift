//
//  TextFieldPlaceholder_Extension.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 9/10/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

// Creates the IB inspectable that can be selected. 
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
    
        }
    }

    
}
