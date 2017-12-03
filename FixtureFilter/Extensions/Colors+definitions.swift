//
//  Colors+definitions.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red")
        assert(green >= 0 && green <= 255, "Invalid green")
        assert(blue >= 0 && blue <= 255, "Invalid blue")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex:Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    static let navBarBlue = UIColor(hex: 0x2F459A)
    static let fontBlue = UIColor(hex: 0x2F8CD0)
    static let backgroundBlue = UIColor(hex: 0x152D44)
    static let cellDarkBlue = UIColor(hex: 0x0B212C)
    static let cellLightBlue = UIColor(hex: 0x0D242E)
}
