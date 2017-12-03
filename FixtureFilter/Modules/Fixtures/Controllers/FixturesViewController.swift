//
//  FixturesViewController.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesViewController: UIViewController {

    @IBOutlet weak var leaguesCollectionView: LeaguesCollectionView!
    
    fileprivate var fixturesViewModel: FixturesViewModel!
    fileprivate var fixturesFlowController: FixturesFlowController!
    
    func assignDependencies(fixturesFlowController: FixturesFlowController, fixturesViewModel: FixturesViewModel) {
        
        self.fixturesFlowController = fixturesFlowController
        self.fixturesViewModel = fixturesViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    private func setup() {
        
        self.view.backgroundColor = UIColor.backgroundBlue
        leaguesCollectionView.inputDataSource = Leagues.allLeagues
        
        let filterButton = UIBarButtonItem(image: UIImage(named: "filterIcon"), style: .plain, target: self, action: #selector(filterButtonAction))
        navigationItem.rightBarButtonItems = [filterButton]
    }

    @objc func filterButtonAction() {
        leaguesCollectionView.showOrHide(direction: .Vertical)
    }

    
}
