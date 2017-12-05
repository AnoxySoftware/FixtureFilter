//
//  UICollectionView+animations.swift
//  FixtureFilter
//
//  Created by keisyrzk on 05.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    
    
    func removeSectionAnim(sectionIndex: Int, onCompleted: @escaping () -> Void) {
        
        let itemsCount = self.numberOfItems(inSection: sectionIndex)
        var completedCounter = 0
        
        var cells: [UICollectionViewCell] = []
        
        for itemIndex in 0 ..< itemsCount {
            
            let indexPath = IndexPath(item: itemIndex, section: sectionIndex)
            if let cell = self.cellForItem(at: indexPath) {
                
                cells.append(cell)
            }
        }
        
        func hideNext() {
            
            if completedCounter == cells.count {
                onCompleted()
            }
            else {
                
                if completedCounter % 2 == 0 {
                    cells[completedCounter].hideLeft(onCompleted: {
                        completedCounter += 1
                        hideNext()
                    })
                }
                else {
                    cells[completedCounter].hideRight(onCompleted: {
                        completedCounter += 1
                        hideNext()
                    })
                }
                
            }
        }
        
        hideNext()
    }
}
