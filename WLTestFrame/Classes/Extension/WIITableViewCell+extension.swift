//
//  WIITableViewCell+extension.swift
//  WIICommonFrame
//
//  Created by freshera on 2019/9/13.
//

import Foundation

public extension UITableViewCell {
    
    class var identifier: String {
        
        
        let name = class_getName(self)
        return String(cString: name)
    }
    
}
