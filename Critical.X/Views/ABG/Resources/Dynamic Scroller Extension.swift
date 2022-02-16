//
//  Dynamic Scroller Extension.swift
//  Critical.X
//
//  Created by Jadie Barringer III on 7/17/18.
//  Copyright © 2018 Jadie Barringer III. All rights reserved.
//

import Foundation
import UIKit
extension UIScrollView {
    //it will block the mainThread
    func recalculateVerticalContentSize() {
        let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
        self.contentSize = CGRect(x: 0, y: 0, width: self.frame.width, height: unionCalculatedTotalRect.height).size
        //(0, 0, self.frame.width, unionCalculatedTotalRect.height).size;
    }
    
    private func recursiveUnionInDepthFor (view: UIView) -> CGRect {
        var totalRect = CGRect.zero
        //calculate recursevly for every subView
        for subView in view.subviews {
            totalRect =  totalRect.union(recursiveUnionInDepthFor(view: subView))
        }
        //return the totalCalculated for all in depth subViews.
        return totalRect.union(view.frame)
    }
}


// This is the secondOne
extension UIScrollView {
    
    func resizeScrollViewContentSize() {
        
        var contentRect = CGRect.zero
        
        for view in self.subviews {
            
            contentRect = contentRect.union(view.frame)
        }
        
        self.contentSize = contentRect.size
        
    }
}
