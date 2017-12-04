//
//  Services.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation

class Services {
    
    static func getSampleData() -> [League] {
        
        let bundle = Bundle(for: self)
        let path = bundle.path(forResource: "fixtures", ofType: "json")!
        let jsonString = try! String(contentsOfFile: path)
        let response = FixturesModel(json: jsonString)
        
        return response.data
    }
}
