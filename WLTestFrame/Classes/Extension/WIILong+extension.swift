//
//  LongExtend.swift
//  Inspection
//
//  Created by XUEYING FANG on 2019/5/7.
//  Copyright © 2019 XUEYING FANG. All rights reserved.
//
import UIKit
import Foundation

extension Int64 {
    
    public func date() -> Date {
        return Date(timeIntervalSince1970: Double(self) / 1000.0)
    }
    
    public func normalTime() -> String{
        let timeDate:Date = NSDate.init(timeIntervalSince1970: Double(self) / 1000.0) as Date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        return formatter.string(from: timeDate)
    }
    
    public func detailTime(dateFormat:String = "yyyy年MM月dd日 HH:mm:ss") -> String{
        let timeDate:Date = NSDate.init(timeIntervalSince1970: Double(self) / 1000.0) as Date
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: timeDate)
    }
    
    public func time(_ dateFormat: String = "HH:mm:ss") -> String{
        let timeDate:Date = NSDate.init(timeIntervalSince1970: Double(self) / 1000.0) as Date
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: timeDate)
    }
    
    public func timeIntervalDesc() -> String {
        let timeInterval = Double(self) / 1000.0
        let intervalNow = NSDate().timeIntervalSince1970
        if intervalNow > timeInterval {
            return self.time("HH:mm")
        }
        if timeInterval - intervalNow < 60 * 60 {
            let min = (timeInterval - intervalNow) / 60
            return "\(Int(min))分"
        }
        return self.time("HH:mm")
    }
    
    public func timeDescription() -> String? {
        let date = self.date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        if calendar.isDateInToday(date) {
            dateFormatter.dateFormat = "HH:mm"
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
        }
        return dateFormatter.string(from: date)
    }
}
