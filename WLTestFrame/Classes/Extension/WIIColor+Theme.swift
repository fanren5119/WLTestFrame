//
//  UIColor+Theme.swift
//  Health
//
//  Created by XUEYING FANG on 2019/2/3.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    public class func colorWithName(_ name: String) -> UIColor {
        return FECThemeCenter.shared().colorWithName(name)
    }
    
    public class var theme_primaryColor: UIColor {
        return colorWithName("primary")
    }//主题色
    public class var theme_primaryTitleColor: UIColor {
        return colorWithName("primaryTitle")
    }//主题字体色
    public class var theme_normalTitle: UIColor {
        return colorWithName("normalTitle")
    }
    public class var theme_mainTypeTitleColor: UIColor {
        return colorWithName("mainTypeTitle")
    }
    public class var theme_mainTypeSelectTitleColor: UIColor {
        return colorWithName("mainTypeSelectTitle")
    }
    public class var theme_tabBarItemTitleColor: UIColor {
        return colorWithName("tabBarItemTitle")
    }
    public class var theme_tabBarItemSelelctTitleColor: UIColor {
        return colorWithName("tabBarItemSelectTitle")
    }
    public class var theme_backgroundColor: UIColor {
        return colorWithName("backgroundColor")
    }
    public class var theme_taskNomal: UIColor {
        return colorWithName("taskNormal")
    }
    public class var theme_taskUnfinished: UIColor {
        return colorWithName("taskUnfinished")
    }
    public class var theme_taskCompleted: UIColor {
        return colorWithName("taskCompleted")
    }
    public class var theme_taskErrored: UIColor {
        return colorWithName("taskErrored")
    }
    public class var theme_taskAlarm: UIColor {
        return colorWithName("taskAlarm")
    }
    public class var theme_taskOffLine: UIColor {
        return colorWithName("taskOffLine")
    }
    public class var theme_taskTimeout: UIColor {
        return colorWithName("taskTimeout")
    }
    public class var theme_InspectionBtn: UIColor {
        return colorWithName("inspectionBtn")
    }
    public class var theme_InspectionBtnTitle: UIColor {
        return colorWithName("inspectionBtnTitle")
    }
    public class var theme_segmentControl: UIColor {
        return colorWithName("segmentControl")
    }
    
    public class var theme_loginBg: UIColor {
        return colorWithName("loginBg")
    }
    
    public class var theme_logoutTitle: UIColor {
        return colorWithName("logoutTitle")
    }
    
    public class var theme_locationTag: UIColor {
        return colorWithName("locationTag")
    }
    
    public class var theme_secondColor: UIColor { return UIColor(hexString: "#FFB900")}//黄色
    public class var theme_highlightedColor: UIColor { return UIColor(hexString: "#FF1515")} //红色
    public class var theme_disabledColor: UIColor { return UIColor(hexString: "#EEEEEE")}
    
    public class var theme_blackColor: UIColor { return UIColor(hexString: "#000000")}
    public class var theme_darkGrayColor: UIColor { return UIColor(hexString: "#333333")}
    public class var theme_grayColor: UIColor { return UIColor(hexString: "#555555")}
    public class var theme_SlightlyGrayColor: UIColor {
        return UIColor(hexString: "#777777")
    }
    public class var theme_lightGrayColor: UIColor { return UIColor(hexString: "#999999")}
    
    public class var theme_whiteColor: UIColor { return UIColor(hexString: "#ffffff")}
    public class var theme_lineColor: UIColor { return UIColor(hexString: "#EFEFEF")}
    public class var theme_yellowColor: UIColor {
        return UIColor(hexString: "#FFCC00")
    }
}


extension UIColor {
    // RGB整数设置颜色
     public convenience init(red: Int, green: Int, blue: Int , alp: CGFloat = 1.0 ) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alp)
        
    }
    // 16进制设置颜色
     public convenience init(hexInt: Int) {
        self.init(red:(hexInt >> 16) & 0xff, green:(hexInt >> 8) & 0xff, blue:hexInt & 0xff)
    }
    
    // 字符串设置颜色
     public convenience init(hexString: String) {
        
        var hexStr = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if (hexStr.hasPrefix("#")) {
            hexStr = String(hexStr.dropFirst())
        }
        var hexInt: UInt32 = 0
        Scanner(string: hexStr).scanHexInt32(&hexInt)
        self.init(red: Int((hexInt >> 16) & 0xff), green: Int((hexInt >> 8) & 0xff), blue: Int(hexInt & 0xff))
    }
    
    public var randomColor: UIColor {
        let hue = CGFloat(( Double(arc4random() % 256) / 256.0 ))  //0.0 to 1.0
        let saturation = CGFloat(( Double(arc4random() % 128) / 256.0 ) + 0.5)  // 0.5 to 1.0,away from white
        let brightness = CGFloat(( Double(arc4random() % 128) / 256.0 ) + 0.5)  //0.5 to 1.0,away from black
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    
}

