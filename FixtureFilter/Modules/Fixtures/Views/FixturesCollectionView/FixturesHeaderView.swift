//
//  FixturesHeaderView.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixturesHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.backgroundBlue
    }
}
