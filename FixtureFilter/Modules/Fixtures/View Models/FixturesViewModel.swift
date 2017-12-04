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
    var filteredData: [League] = []
    
    init(fixturesData: [League]) {
        self.fixturesData = fixturesData
    }
    
    func fixturesFor(leagueName: String, isActive: Bool) {
        
        guard let league = (fixturesData.filter{ $0.name == leagueName }).first else {return}
        
        if isActive {
            filteredData.append(league)
        }
        else {
            if let leagueIndex = filteredData.index(of: league) {
                filteredData.remove(at: leagueIndex)
            }
        }
    }
}
