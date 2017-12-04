//
//  FixturesViewController.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FixturesViewController: UIViewController {

    @IBOutlet weak var leaguesCollectionView: LeaguesCollectionView!
    @IBOutlet weak var fixturesCollectionView: FixturesCollectionView!
    @IBOutlet weak var leaguesTopConstraint: NSLayoutConstraint!
    
    fileprivate var fixturesViewModel: FixturesViewModel!
    fileprivate var fixturesFlowController: FixturesFlowController!
    
    private let mainBag = DisposeBag()
    
    func assignDependencies(fixturesFlowController: FixturesFlowController, fixturesViewModel: FixturesViewModel) {
        
        self.fixturesFlowController = fixturesFlowController
        self.fixturesViewModel = fixturesViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        handleRx()
    }

    private func setup() {
        
        self.view.backgroundColor = UIColor.backgroundBlue
        leaguesCollectionView.inputDataSource = Leagues.allLeagues
        fixturesCollectionView.inputDataSource = fixturesViewModel.fixturesData
        
        let filterButton = UIBarButtonItem(image: UIImage(named: "filterIcon"), style: .plain, target: self, action: #selector(filterButtonAction))
        navigationItem.rightBarButtonItems = [filterButton]
    }
    
    private func handleRx() {
        
        leaguesCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] (indexPath) in
                let cell = self?.leaguesCollectionView.cellForItem(at: indexPath) as! LeagueCell
                cell.isActive.value = true
            })
            .disposed(by: mainBag)
        
        leaguesCollectionView.rx.itemDeselected
            .subscribe(onNext: { [weak self] (indexPath) in
                let cell = self?.leaguesCollectionView.cellForItem(at: indexPath) as! LeagueCell
                cell.isActive.value = false
            })
            .disposed(by: mainBag)
    }

    @objc func filterButtonAction() {
        leaguesCollectionView.anim(with: fixturesCollectionView) {
            self.leaguesTopConstraint.constant = self.leaguesTopConstraint.constant == 0 ? -self.leaguesCollectionView.frame.height : 0
        }
    }

    
}
