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
        
        let filterButton = UIBarButtonItem(image: UIImage(named: "filterIcon"), style: UIBarButtonItemStyle.done, target: self, action: #selector(filterButtonAction(sender:)))
        self.navigationItem.setRightBarButtonItems([filterButton], animated: false)
    }

    @objc func filterButtonAction(sender: UIBarButtonItem) {
        leaguesCollectionView.showOrHide(direction: .Vertical)
    }

    
}
