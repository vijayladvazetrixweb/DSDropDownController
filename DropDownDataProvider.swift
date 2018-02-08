//
//  DropDownDataProvider.swift
//  firenspec
//
//  Created by David Seek on 12/28/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import Foundation


class DropDownDataProvider: NSObject {
    

    var title: String
    var data: [DropDownData]
    var delegate: DropDownDataProviderDelegate
    var controller: UIViewController
    var style: DropDownDataStyle
    var manager: DropDownManager
    
    init(title: String = "Please select", data: [DropDownData], delegate: DropDownDataProviderDelegate, controller: UIViewController, style: DropDownDataStyle = .basic) {
        
        self.title = title
        self.data = data
        self.delegate = delegate
        self.controller = controller
        self.style = style
        
        self.manager = DropDownManager(dataCount: self.data.count)
    }
    
    /**
     Disable bounce only for the top.
     This avoids giving away the fact that the `Header View` is just a section header.
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        scrollView.bounces = scrollView.contentOffset.y > 25
    }
}

// MARK: - DATA SOURCE
extension DropDownDataProvider: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = self.data[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownCell") as! DropDownCell
        cell.bindData(with: self.style, data: data)
        return cell
    }
}

// MARK: - DELEGATE
extension DropDownDataProvider: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = self.data[indexPath.row]
        self.delegate.getSelected(data: data, at: self.controller)
    }
}

// MARK: - TITLE HEADER AND CLOSE BUTTON
extension DropDownDataProvider {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "dropDownHeader") as! DropDownHeader
        headerCell.bindData(with: self.style, delegate: self, title: self.title)
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
}

// MARK: - PROVIDER DELEGATE
extension DropDownDataProvider: DropDownDataProviderDelegate {
    
    
    func closeButtonPressed(at controller: UIViewController?) {
        
        self.delegate.closeButtonPressed(at: self.controller)
    }
}

protocol DropDownDataProviderDelegate {
    
    
    func getSelected(data: DropDownData, at controller: UIViewController?)
    func closeButtonPressed(at controller: UIViewController?)
}

extension DropDownDataProviderDelegate {
    
    
    func getSelected(data: DropDownData, at controller: UIViewController?) {}
    func closeButtonPressed(at controller: UIViewController?) {}
}
