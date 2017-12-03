//
//  LeagueModel.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class LeagueModel {
    
    var name: String
    var image: UIImage
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}

class Leagues {
    
    static let championsLeague: LeagueModel = LeagueModel(name: "Champions League", image: UIImage(named: "champions-league-icon")!)
    static let eredivisieLeague: LeagueModel = LeagueModel(name: "Eredivisie", image: UIImage(named: "Dutch contest 2")!)
    static let premierLeague: LeagueModel = LeagueModel(name: "Premier League", image: UIImage(named: "england")!)
    static let ligue1League: LeagueModel = LeagueModel(name: "Ligue 1", image: UIImage(named: "France Contest")!)
    static let serieALeague: LeagueModel = LeagueModel(name: "Serie A", image: UIImage(named: "Italy Badge")!)
    static let mlsLeague: LeagueModel = LeagueModel(name: "MLS", image: UIImage(named: "mls contest")!)
    static let ligaLeague: LeagueModel = LeagueModel(name: "Saudi League", image: UIImage(named: "saudi contest")!)
    static let primeraDivisionLeague: LeagueModel = LeagueModel(name: "Primera Division", image: UIImage(named: "Spain Contest Badge")!)
    
    static let allLeagues = [championsLeague,
                             eredivisieLeague,
                             premierLeague,
                             ligue1League,
                             serieALeague,
                             mlsLeague,
                             ligaLeague,
                             primeraDivisionLeague]
}
