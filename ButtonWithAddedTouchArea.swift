//
//  ButtonWithAddedTouchArea.swift
//  firenspec
//
//  Created by David Seek on 7/12/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import Foundation
import UIKit


class ButtonWithAddedTouchArea: UIButton {

    
    var touchArea: CGFloat = 20
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        let bounds = CGRect(
            
            x: self.bounds.origin.x - self.touchArea,
            y: self.bounds.origin.y - self.touchArea,
            width: self.bounds.width + 2 * self.touchArea,
            height: self.bounds.width + 2 * self.touchArea
        )
        
        return bounds.contains(point)
    }
}
