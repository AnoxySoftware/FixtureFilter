//
//  FixturesFactory.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesFactory {
    
    static func showIn(window: UIWindow) {
        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        
        let fixturesController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! FixturesViewController
        fixturesController.title = "Games"
        let fixturesFlowController = FixturesFlowController(navigationController: navigationController)
        
        let fixturesData = Services.getSampleData()
        let viewModel = FixturesViewModel(fixturesData: fixturesData)
        
        fixturesController.assignDependencies(fixturesFlowController: fixturesFlowController, fixturesViewModel: viewModel)
        
        navigationController.setViewControllers([fixturesController], animated: false)
        window.rootViewController = navigationController
    }
}
