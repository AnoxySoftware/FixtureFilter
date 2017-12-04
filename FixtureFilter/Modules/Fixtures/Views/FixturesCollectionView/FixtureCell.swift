//
//  FixtureCell.swift
//  FixtureFilter
//
//  Created by keisyrzk on 04.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import UIKit

class FixtureCell: UICollectionViewCell {
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
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
        dateView.backgroundColor = UIColor.cellDarkBlue
        dateLabel.textColor = UIColor.fontBlue
    }
    
    func config(fixture: Fixture, prevDate: Date?) {
        
        dateView.isHidden = true
        
        if let _prevDate = prevDate {
            if let _date = fixture.dateValue {
                if Calendar.current.compare(_date, to: _prevDate, toGranularity: .day) != .orderedSame {
                    dateView.isHidden = false
                    dateLabel.text = fixture.date.pretty()
                }
            }
        }
        else {
            if let _ = fixture.dateValue {
                dateView.isHidden = false
                dateLabel.text = fixture.date.pretty()
            }
        }

        homeLabel.text = fixture.home
        awayLabel.text = fixture.away
        timeLabel.text = fixture.time
    }
    
    override func prepareForReuse() {
        dateLabel.text = ""
        homeLabel.text = ""
        awayLabel.text = ""
        timeLabel.text = ""
        dateView.isHidden = true
    }

}
