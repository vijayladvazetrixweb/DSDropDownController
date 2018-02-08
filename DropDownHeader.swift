//
//  DropDownHeader.swift
//  firenspec
//
//  Created by David Seek on 12/29/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import UIKit


class DropDownHeader: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var closeButton: ButtonWithAddedTouchArea!
    
    var delegate: DropDownDataProviderDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(with style: DropDownDataStyle, delegate: DropDownDataProviderDelegate, title: String) {
        
        self.titleLabel.font = style.titleFont
        self.titleLabel.textColor = style.titleColor
        self.backgroundColor = style.titleBackgroundColor
        self.titleLabel.text = title
        self.delegate = delegate
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        self.delegate.closeButtonPressed(at: nil)
    }
}
