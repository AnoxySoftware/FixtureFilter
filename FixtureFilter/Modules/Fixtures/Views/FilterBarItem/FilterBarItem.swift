//
//  FilterBarItem.swift
//  FixtureFilter
//
//  Created by keisyrzk on 05.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit
import RxSwift

class FilterBarItem: UIBarButtonItem {

    let isActive = Variable<Bool>(false)
    private let mainBag = DisposeBag()
    
    private let icon = UIImage(named: "filterIcon")?.withRenderingMode(.alwaysTemplate)
    
    
    override init() {
        super.init()
        
        self.image = icon
        
        handleRx()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func handleRx() {
        
        isActive.asObservable()
            .subscribe(onNext: { (isActive) in
                self.tintColor = isActive ? UIColor.white.withAlphaComponent(0.4) : UIColor.white
            })
            .disposed(by: mainBag)
        
        self.rx.tap
            .subscribe({ [weak self] _ in
                self?.isActive.value = !self!.isActive.value
            })
            .disposed(by: mainBag)
    }
}
