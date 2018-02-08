//
//  DropDownManager.swift
//  firenspec
//
//  Created by David Seek on 12/29/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import Foundation


class DropDownManager {
    
    
    var dataCount: Int
    
    init(dataCount: Int) {
        
        self.dataCount = dataCount
    }
}

// MARK: - UI
extension DropDownManager {
    
    /**
     Desired is to get the height for the tableViewConstraint.
     
     - parameter dataCount: DropDownDataProvider data array count.
     - returns: CGFloat where dataCount cap is 6 (6*50 = 300) and add of 50 for the title header view.
     */
    func getDesiredTableViewHeight() -> CGFloat {
        
        var combinedCellHeight: CGFloat = CGFloat(self.dataCount * 50)
        
        if combinedCellHeight > 300 {
            combinedCellHeight = 300
        }
        
        return combinedCellHeight + 50
    }
}
