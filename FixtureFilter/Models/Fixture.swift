//
//  Fixture.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation
import EVReflection

class Fixture: EVObject {
    
    var home: String = ""
    var away: String = ""
    var date: String = "" {
        didSet {
            dateValue = date.toDate()
            time = date.timeOnly()
        }
    }
    
    var dateValue: Date?
    var time: String?
    
    //this is just in case of some differences between JSON and model not to cause a crash
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("Missing key:  \(key)")
    }
}
