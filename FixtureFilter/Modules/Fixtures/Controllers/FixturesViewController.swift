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
                let league = cell.leagueName
                cell.isActive.value = true
                self?.fixturesViewModel.fixturesFor(leagueName: league, isActive: true)
                self?.fixturesCollectionView.inputDataSource = self!.fixturesViewModel.filteredData
                self?.fixturesCollectionView.reloadData()
            })
            .disposed(by: mainBag)
        
        leaguesCollectionView.rx.itemDeselected
            .subscribe(onNext: { [weak self] (indexPath) in
                let cell = self?.leaguesCollectionView.cellForItem(at: indexPath) as! LeagueCell
                let league = cell.leagueName
                cell.isActive.value = false
                
                
                if let sectionIndex = self?.fixturesViewModel.getSectionIndex(leagueName: league) {
                    
                    self?.fixturesCollectionView.removeSectionAnim(sectionIndex: sectionIndex, onCompleted: {
                        self?.fixturesViewModel.fixturesFor(leagueName: league, isActive: false)
                        self?.fixturesCollectionView.inputDataSource = self!.fixturesViewModel.filteredData
                        self?.fixturesCollectionView.reloadData()
                    })
                }
                else {
                    self?.fixturesViewModel.fixturesFor(leagueName: league, isActive: false)
                    self?.fixturesCollectionView.inputDataSource = self!.fixturesViewModel.filteredData
                    self?.fixturesCollectionView.reloadData()
                }
                
                
                
            })
            .disposed(by: mainBag)
        
    }

    @objc func filterButtonAction() {
        leaguesCollectionView.anim(with: fixturesCollectionView) {
            
            if self.leaguesTopConstraint.constant == 0 {
                self.leaguesTopConstraint.constant = -self.leaguesCollectionView.frame.height
                self.fixturesCollectionView.inputDataSource = self.fixturesViewModel.fixturesData
                self.fixturesCollectionView.reloadData()
            }
            else {
                self.leaguesTopConstraint.constant = 0
                self.fixturesCollectionView.inputDataSource = self.fixturesViewModel.filteredData
                self.fixturesCollectionView.reloadData()
            }
        }
    }

    
}
