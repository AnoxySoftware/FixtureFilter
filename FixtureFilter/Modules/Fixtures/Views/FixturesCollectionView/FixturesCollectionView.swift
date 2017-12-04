//
//  FixturesCollectionView.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var inputDataSource: [League] = []
    
    

    
    override func awakeFromNib() {
        delegate = self
        dataSource = self

        let nib = UINib(nibName: "FixtureCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "fixtureCell")
        
        self.backgroundColor = UIColor.clear
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return inputDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inputDataSource[section].fixtures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! FixturesHeaderView
            headerView.headerLabel.text = inputDataSource[indexPath.section].name
            
            return headerView
            
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fixtureCell", for: indexPath) as! FixtureCell
        cell.config(fixture: inputDataSource[indexPath.section].fixtures[indexPath.row])
        
        return cell
    }
}
