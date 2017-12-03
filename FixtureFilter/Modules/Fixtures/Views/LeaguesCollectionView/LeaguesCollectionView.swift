//
//  LeaguesCollectionView.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class LeaguesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var inputDataSource: [LeagueModel] = []
    
    
    
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        
        let nib = UINib(nibName: "LeagueCell", bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: "leagueCell")
        
        self.backgroundColor = UIColor.clear
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inputDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCell", for: indexPath) as! LeagueCell
        cell.config(league: inputDataSource[indexPath.row])

        return cell
    }
}
