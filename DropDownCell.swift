//
//  DropDownCell.swift
//  firenspec
//
//  Created by David Seek on 12/29/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import UIKit


class DropDownCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /*
     For Unit Test purposes
     */
    var style: DropDownDataStyle!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(with style: DropDownDataStyle, data: DropDownData) {
        
        self.style = style
        
        self.titleLabel.font = style.titleFont
        self.titleLabel.textColor = style.titleColor
        
        self.descriptionLabel.font = style.cellDescriptionFont
        self.descriptionLabel.textColor = style.cellDescriptionColor
        
        self.titleLabel.text = data.title
        self.descriptionLabel.text = data.description
        
        let selectedBackgroundView = UIView()
        selectedBackgroundView.backgroundColor = style.cellSelectionColor
        self.selectedBackgroundView = selectedBackgroundView
    }
}
