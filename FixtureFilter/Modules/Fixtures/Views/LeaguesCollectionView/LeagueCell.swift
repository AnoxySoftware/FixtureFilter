//
//  LeagueCell.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LeagueCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    var leagueName: String = ""
    
    let isActive = Variable<Bool>(false)
    private let cellbag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(league: LeagueModel) {
        
        leagueName = league.name
        cellImageView.image = league.image
        cellLabel.text = league.name
        
        handleRx()
    }
    
    private func handleRx() {
        
        isActive
            .asObservable()
            .subscribe(onNext: { (isActive) in
                self.alpha = isActive ? 1 : 0.4
            })
            .disposed(by: cellbag)
    }

    override func prepareForReuse() {
        cellImageView.image = UIImage()
        cellLabel.text = ""
    }
}
