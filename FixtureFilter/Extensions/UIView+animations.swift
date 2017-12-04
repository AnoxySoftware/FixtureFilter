//
//  UIView+animations.swift
//  FixtureFilter
//
//  Created by keisyrzk on 03.12.2017.
//  Copyright © 2017 keisyrzk. All rights reserved.
//

import Foundation
import UIKit



//wheter the view is currently showed or hidden
private var isShowedOrHidden: Bool = false

extension UIView
{
    enum AnimationDirection
    {
        case Vertical
        case Horizontal
    }
    
    //new UIView's attribute definition via associated object
    var isShowed : Bool {
        get
        {
            return objc_getAssociatedObject(self, &isShowedOrHidden) as! Bool
        }
        
        set(value)
        {
            objc_setAssociatedObject(self, &isShowedOrHidden, value, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    override open func awakeFromNib()
    {
        isShowed = false
    }
    
    
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
    
    
    func showOrHide(direction: AnimationDirection)
    {
        //view's edges
        let viewLeftEdge = self.frame.origin.x
        let viewRightEdge = self.frame.origin.x + self.frame.width
        let viewTopEdge = self.frame.origin.y
        let viewBottomEdge = self.frame.origin.y + self.frame.height
        
        //view parent's edges
        let parentRightEdge = self.superview!.frame.width
        let parentBottomEdge = self.superview!.frame.height
        
        
        //calculate the closest edge
        let leftSpace = viewLeftEdge
        let rightSpace = parentRightEdge - viewRightEdge
        let topSpace = viewTopEdge
        let bottomSpace = parentBottomEdge - viewBottomEdge
        
        
        //animate
        if direction == .Horizontal
        {
            if leftSpace < rightSpace
            {
                //animate to the left side
                let newPosition = leftSpace < 0 ? abs(leftSpace + self.frame.width) : -(leftSpace + self.frame.width)
                UIView.animate(withDuration: 0.5, animations: {
                    self.frame.origin.x = newPosition
                })
            }
            else
            {
                //animate to the right side
                let newPosition = rightSpace < 0 ? parentRightEdge + rightSpace : parentRightEdge + rightSpace
                UIView.animate(withDuration: 0.5, animations: {
                    self.frame.origin.x = newPosition
                })
            }
        }
        else
        {
            if topSpace < bottomSpace
            {
                //animate to the top side
                let newPosition = topSpace < 0 ? abs(topSpace + self.frame.height) : -(topSpace + self.frame.height)
                UIView.animate(withDuration: 0.5, animations: {
                    self.frame.origin.y = newPosition
                })
            }
            else
            {
                //animate to the bottom side
                let newPosition = bottomSpace < 0 ? parentBottomEdge + bottomSpace : parentBottomEdge + bottomSpace
                UIView.animate(withDuration: 0.5, animations: {
                    self.frame.origin.y = newPosition
                })
            }
        }
        
        //if self is out of it's superview's frame - it is hidden, otherwise it is showed
        if self.superview?.frame.contains(self.frame) == true
        {
            self.isShowed = true
        }
        else
        {
            self.isShowed = false
        }
    }//end of showOrHide
}
