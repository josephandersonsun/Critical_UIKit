//
//  RoundTo.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 6/1/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit

// Takes a double and rounds it to places without converting to string.
extension Double {
    
    func roundTo(places:Int) -> Double {
    
        let divisor = pow(10.0, Double(places))
    
        return (self * divisor).rounded() / divisor
    }
}

