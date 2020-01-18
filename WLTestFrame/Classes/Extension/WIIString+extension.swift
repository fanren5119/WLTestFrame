//
//  StringExtend.swift
//  Inspection
//
//  Created by XUEYING FANG on 2019/5/7.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//


import CommonCrypto
import Foundation
import UIKit

extension String{
    public func sha1() -> String {
        //UnsafeRawPointer
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        let newData = NSData.init(data: data)
        CC_SHA1(newData.bytes, CC_LONG(data.count), &digest)
        let output = NSMutableString(capacity: Int(CC_SHA1_DIGEST_LENGTH))
        for byte in digest {
            output.appendFormat("%02x", byte)
        }
        return output as String
    }
    
    public func stringConvertDate(dateFormat:String = "yyyy年MM月dd日") -> Date? {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: self)
        return date
    }
    
    public func validatePhonoNum() -> Bool {
        //手机号以1开头，10个 \d 数字字
        let predicateString = "^1\\d{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", predicateString)
        return predicate.evaluate(with: self)
    }
    
    public func validateEmail() -> Bool {
        let predicateString = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", predicateString)
        return predicate.evaluate(with: self)
    }
    
    public func validatePwd() -> Bool {
        //6-20位字母数字组合，缺一不可
        let predicateString = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]+$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", predicateString)
        return predicate.evaluate(with: self)
    }
    
    public func getLabelHeight(font: UIFont, width: CGFloat)-> CGFloat {
        let statusLabelText: NSString = self as NSString
        let size = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : AnyObject], context: nil).size
        return strSize.height
    }
    
    public func getLabelWidth(font: UIFont)-> CGFloat {
        let statusLabelText: NSString = self as NSString
        let size = CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT))
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key : AnyObject], context: nil).size
        return strSize.width
    }
}

extension String {
    
    public var lineString: String {
        let str = NSMutableString(string: self)
        let regex = try! NSRegularExpression(pattern: "[A-Z]", options: NSRegularExpression.Options(rawValue:0))
        let res = regex.replaceMatches(in: str, options: NSRegularExpression.MatchingOptions(rawValue:0), range: NSMakeRange(1, str.length-1), withTemplate: "-$0")
        if res > 0  { return str.lowercased as String }
        return self
    }
}

extension String {
    
    public func firstCharacter() -> String {
        // 注意,这里一定要转换成可变字符串
        let mutableString = NSMutableString.init(string: self)
        // 将中文转换成带声调的拼音
        CFStringTransform(mutableString as CFMutableString, nil, kCFStringTransformToLatin, false)
        // 去掉声调(用此方法大大提高遍历的速度)
        let pinyinString = mutableString.folding(options: String.CompareOptions.diacriticInsensitive, locale: NSLocale.current)
        // 将拼音首字母装换成大写
        let strPinYin = polyphoneStringHandle(nameString: self, pinyinString: pinyinString).uppercased()
        // 截取大写首字母
        let firstString = strPinYin.substring(to: strPinYin.index(strPinYin.startIndex, offsetBy:1))
        // 判断姓名首位是否为大写字母
        let regexA = "^[A-Z]$"
        let predA = NSPredicate.init(format: "SELF MATCHES %@", regexA)
        return predA.evaluate(with: firstString) ? firstString : "#"
    }
    
    /// 多音字处理
    func polyphoneStringHandle(nameString:String, pinyinString:String) -> String {
        if nameString.hasPrefix("长") {return "chang"}
        if nameString.hasPrefix("沈") {return "shen"}
        if nameString.hasPrefix("厦") {return "xia"}
        if nameString.hasPrefix("地") {return "di"}
        if nameString.hasPrefix("重") {return "chong"}
        
        return pinyinString;
    }
}
