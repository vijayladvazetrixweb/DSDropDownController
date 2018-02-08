//
//  DropDownDataStyle.swift
//  firenspec
//
//  Created by David Seek on 12/29/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import Foundation


struct DropDownDataStyle {
    
    
    var controllerBackgroundColor: UIColor
    
    var titleFont: UIFont
    var titleColor: UIColor
    var titleBackgroundColor: UIColor
    
    var cellTitleFont: UIFont
    var cellTitleColor: UIColor
    
    var cellDescriptionFont: UIFont
    var cellDescriptionColor: UIColor
    
    var cellBackgroundColor: UIColor
    var cellSelectionColor: UIColor
    
    var closeButtonImage: UIImage
    var closeButtonColor: UIColor
    
    init(controllerBackgroundColor: UIColor = UIColor(white: 0, alpha: 0.7),
         titleFont: UIFont = UIFont(name: "HelveticaNeue-Medium", size: 14)!,
         titleColor: UIColor = .black,
         titleBackgroundColor: UIColor = .white,
         cellTitleFont: UIFont = UIFont(name: "HelveticaNeue-Medium", size: 14)!,
         cellTitleColor: UIColor = .black,
         cellDescriptionFont: UIFont = UIFont(name: "HelveticaNeue-Medium", size: 8)!,
         cellDescriptionColor: UIColor = .gray,
         cellBackgroundColor: UIColor = .white,
         cellSelectionColor: UIColor = UIColor.blue.withAlphaComponent(0.2),
         closeButtonImage: UIImage = UIImage(named: "closeDropDownButton")!,
         closeButtonColor: UIColor = .blue) {
        
        self.controllerBackgroundColor = controllerBackgroundColor
        
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.titleBackgroundColor = titleBackgroundColor
        
        self.cellTitleFont = cellTitleFont
        self.cellTitleColor = cellTitleColor
        
        self.cellDescriptionFont = cellDescriptionFont
        self.cellDescriptionColor = cellDescriptionColor
        
        self.cellBackgroundColor = cellBackgroundColor
        self.cellSelectionColor = cellSelectionColor
        
        self.closeButtonImage = closeButtonImage
        self.closeButtonColor = closeButtonColor
    }
}

// MARK: - DEFAULT
extension DropDownDataStyle {
    
    static var basic: DropDownDataStyle {
        return DropDownDataStyle()
    }
}

// MARK: - EQUATABLE
extension DropDownDataStyle: Equatable {}

/*
 Conform to Equatable for UnitTests
 */
func == (lhs: DropDownDataStyle, rhs: DropDownDataStyle) -> Bool {
    
    if lhs.controllerBackgroundColor != rhs.controllerBackgroundColor {
        return false
    }
    
    if lhs.titleFont != rhs.titleFont {
        return false
    }
    
    if lhs.titleColor != rhs.titleColor {
        return false
    }
    
    if lhs.titleBackgroundColor != rhs.titleBackgroundColor {
        return false
    }
    
    if lhs.cellTitleFont != rhs.cellTitleFont {
        return false
    }
    
    if lhs.cellTitleColor != rhs.cellTitleColor {
        return false
    }
    
    if lhs.cellDescriptionFont != rhs.cellDescriptionFont {
        return false
    }
    
    if lhs.cellDescriptionColor != rhs.cellDescriptionColor {
        return false
    }
    
    if lhs.cellBackgroundColor != rhs.cellBackgroundColor {
        return false
    }
    
    if lhs.cellSelectionColor != rhs.cellSelectionColor {
        return false
    }
    
    if lhs.closeButtonImage != rhs.closeButtonImage {
        return false
    }
    
    if lhs.closeButtonColor != rhs.closeButtonColor {
        return false
    }
    
    return true
}
