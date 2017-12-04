//
//  FixtureCell.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixtureCell: UICollectionViewCell {

    @IBOutlet weak var homeBackground: UIView!
    @IBOutlet weak var homeLabel: UILabel!
    
    @IBOutlet weak var timeBackground: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var awayBackground: UIView!
    @IBOutlet weak var awayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        homeBackground.backgroundColor = UIColor.cellDarkBlue
        timeBackground.backgroundColor = UIColor.cellLightBlue
        awayBackground.backgroundColor = UIColor.cellDarkBlue
    }
    
    func config(fixture: Fixture) {
        
        homeLabel.text = fixture.home
        awayLabel.text = fixture.away
        timeLabel.text = fixture.time
    }
    
    override func prepareForReuse() {
        homeLabel.text = ""
        awayLabel.text = ""
        timeLabel.text = ""
    }

}
