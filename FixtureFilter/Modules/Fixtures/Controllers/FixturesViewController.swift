//
//  FixturesViewController.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesViewController: UIViewController {

    
    fileprivate var fixturesViewModel: FixturesViewModel!
    fileprivate var fixturesFlowController: FixturesFlowController!
    
    func assignDependencies(fixturesFlowController: FixturesFlowController, fixturesViewModel: FixturesViewModel) {
        
        self.fixturesFlowController = fixturesFlowController
        self.fixturesViewModel = fixturesViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
