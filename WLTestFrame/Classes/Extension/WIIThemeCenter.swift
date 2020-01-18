//
//  FECThemeCenter.swift
//  Alamofire
//
//  Created by freshera on 2019/9/4.
//

import Foundation
import UIKit

public enum ThemeType: String {
    case normal = "Normal"
    
    func colorDictPath() -> String {
        let colorPath = self.rawValue + "Color"
        return Bundle.main.path(forResource: colorPath, ofType: "plist") ?? ""
    }
    
    func imagePrefixStr() -> String {
        switch self {
        case .normal:
            return "n"
        }
    }
}

public class FECThemeCenter {
    
    public class func shared() -> FECThemeCenter {
        return FECThemeCenter()
    }
    public var themeType: ThemeType = .normal
    public var colorDict: [String: String]?
    
    init() {
        self.switchThemeType(.normal)
    }
    
    public func switchThemeType(_ type: ThemeType) {
        self.themeType = type
        let colorDictPath = type.colorDictPath()
        self.colorDict = NSDictionary(contentsOfFile: colorDictPath) as? [String: String]
    }
    
    public func colorWithName(_ name: String) -> UIColor {
        let colorHexString = self.colorDict?[name] ?? "#000000"
        return UIColor(hexString: colorHexString)
    }
    
    public func imageWithName(_ name: String) -> UIImage? {
        let nName = "\(self.themeType.imagePrefixStr())_" + name
        return UIImage(named: nName)
    }
}
