//
//  FixturesViewModel.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesViewModel {
    
    var fixturesData: [League] = []
    
    init(fixturesData: [League]) {
        self.fixturesData = fixturesData
    }
}
