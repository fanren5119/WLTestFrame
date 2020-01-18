//
//  FECUIImage+Theme.swift
//  Inspection
//
//  Created by freshera on 2019/9/4.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//

import Foundation

extension UIImage {
    public class func fecImageWithName(_ name: String) -> UIImage? {
        return FECThemeCenter.shared().imageWithName(name)
    }
    
    public func origin() -> UIImage? {
        return self.withRenderingMode(.alwaysOriginal)
    }
}
