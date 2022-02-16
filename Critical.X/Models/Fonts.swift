//
//  Fonts.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/17/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit


// MARK: Font Struct
struct Font {
    static let header = UIFont(name: "HelveticaNeue", size: 20.0)!
    static let regular = UIFont(name: "HelveticaNeue", size: 17.0)!
    static let subheader = UIFont(name: "HelveticaNeue", size: 13.0)!
    static let medium = UIFont(name: "HelveticaNeue-Medium", size: 14.0)!
    static let thin = UIFont(name: "HelveticaNeue-Thin", size: 14.0)!
    static let CondensedBlack = UIFont(name: "HelveticaNeue-CondensedBlack", size: 14.0)!
    static let CondensedBold = UIFont(name: "HelveticaNeue-CondensedBold", size: 14.0)!
}
/*
 and you access an individual font using:  //Font.header
 and to alter the size: //Font.header.fontWithSize(32.0)
 */
