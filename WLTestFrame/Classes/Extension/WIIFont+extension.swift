//
//  UIFont+Theme.swift
//  Health
//
//  Created by XUEYING FANG on 2019/2/3.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    open class func mediumFont(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Medium", size: size)!
    }
    
    open class func regularFont(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Regular", size: size)!
    }
    
    open class func lightFont(_ size: CGFloat) -> UIFont {
        return UIFont.init(name: "PingFangSC-Light", size: size)!
    }
    
    open class var bigMedFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 20.0)!
        }
    }

    open class var headerLightFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Light", size: 18.0)!
        }
    }
    
    open class var headerRegularFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Regular", size: 18.0)!
        }
    }
    
    open class var headerMedFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 18.0)!
        }
    }
    
    open class var titleLightFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Light", size: 16.0)!
        }
    }
    
    open class var titleRegularFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Regular", size: 16.0)!
        }
    }
    
    open class var titleMedFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 16.0)!
        }
    }
    
    open class var bodyLightFont: UIFont {
        get {
           return UIFont.init(name: "PingFangSC-Light", size: 14.0)!
        }
    }
    
    open class var bodyRegularFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Regular", size: 14.0)!
        }
    }
    
    open class var bodyMedFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 14.0)!
        }
    }
    
    
    open class var captonLightFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Light", size: 12.0)!
        }
    }

    open class var captonRegularFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Regular", size: 12.0)!
        }
    }
    
    open class var captonMediaFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 12.0)!
        }
    }
    
    open class var capton2Font: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Light", size: 10.0)!
        }
    }
    
    open class var capton2MediaFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Medium", size: 10.0)!
        }
    }
    
    open class var capton2RegularFont: UIFont {
        get {
            return UIFont.init(name: "PingFangSC-Regular", size: 10.0)!
        }
    }

}
