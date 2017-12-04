//
//  League.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation
import EVReflection

class League: EVObject {
    
    var name: String = ""
    var fixtures: [Fixture] = []
    
    //this is just in case of some differences between JSON and model not to cause a crash
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("Missing key:  \(key)")
    }
}
