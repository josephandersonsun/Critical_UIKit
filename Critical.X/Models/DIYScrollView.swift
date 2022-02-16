//
//  DIYScrollView.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 1/7/19.
//  Copyright © 2019 Jadie Barringer III. All rights reserved.
//

import UIKit

class DIYScrollView: UIView {
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self)
        bounds.origin.y = bounds.origin.y - translation.y
        
        recognizer.setTranslation(CGPoint.zero, in: self)
    }
}

