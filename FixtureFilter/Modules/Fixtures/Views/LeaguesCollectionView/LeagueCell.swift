//
//  LeagueCell.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class LeagueCell: UICollectionViewCell {

    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(league: LeagueModel) {
        
        cellImageView.image = league.image
        cellLabel.text = league.name
    }

    override func prepareForReuse() {
        cellImageView.image = UIImage()
        cellLabel.text = ""
    }
}
