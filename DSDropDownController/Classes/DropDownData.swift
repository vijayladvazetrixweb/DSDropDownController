//
//  DropDownData.swift
//  firenspec
//
//  Created by David Seek on 12/29/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import Foundation


protocol Presentable {
    var output: String { get }
    var description: String { get }
}

extension Presentable {
    var description: String {
        return String()
    }
}


struct DropDownData {
    
    
    var title: String
    var description: String?
    var value: Any
    
    init<T: Presentable>(presentable: T) {
        self.title = presentable.output
        self.description = presentable.description
        self.value = presentable
    }
    
    init(title: String, description: String? = nil, value: Any) {
        
        self.title = title
        self.description = description
        self.value = value
    }
    
    static var duplicatePicker: [DropDownData] {
        
        var data = [DropDownData]()
        
        for index in 0..<100 {
            data.append(DropDownData(title: String(index), value: index))
        }
        
        return data
    }
}
