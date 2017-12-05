//
//  UIView+animations.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation
import UIKit


extension UIView
{
    func anim(with view: UIView, onCompleted: @escaping () -> Void) {
        
        let shouldShow = self.frame.origin.y == 0 ? false : true
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            //for self
            self.frame = CGRect(x: self.frame.origin.x,
                                y: shouldShow == false ? -self.frame.height : 0,
                                width: self.frame.width,
                                height: self.frame.height)
            self.alpha = shouldShow == false ? 0 : 1
            
            //for extra view
            view.frame = CGRect(x: view.frame.origin.x,
                                y: shouldShow == false ? 0 : self.frame.height,
                                width: view.frame.width,
                                height: view.frame.height)
        },completion: { _ in
            view.frame.size.height = shouldShow == false ? view.frame.height + self.frame.height : view.frame.height - self.frame.height
            onCompleted()
        })
    }
    
    func hideLeft(onCompleted: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            //for self
            self.frame = CGRect(x: -self.frame.width,
                                y: self.frame.origin.y,
                                width: self.frame.width,
                                height: self.frame.height)
            self.alpha = 0

        },completion: { _ in
            onCompleted()
        })
    }
    
    func hideRight(onCompleted: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            
            //for self
            self.frame = CGRect(x: 2 * self.frame.width,
                                y: self.frame.origin.y,
                                width: self.frame.width,
                                height: self.frame.height)
            self.alpha = 0
            
        },completion: { _ in
            onCompleted()
        })
    }
}
