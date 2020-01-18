//
//  WIIDate+extension.swift
//  WIICommonFrame
//
//  Created by freshera on 2019/10/10.
//

import Foundation

extension Date {
    
    public func currentDayBeginInterval() -> Int64 {
        let datefmatter = DateFormatter()
        datefmatter.dateFormat="yyyy年MM月dd日"
        let dateStr = datefmatter.string(from: self)
        datefmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
        let dateBegin = datefmatter.date(from: "\(dateStr) 00:00:00")
//        let dateEnd = datefmatter.date(from: "\(dateStr) 23:59:59")
        let intevalBegin:TimeInterval = dateBegin!.timeIntervalSince1970 * 1000
//        let intevalEnd:TimeInterval = dateEnd!.timeIntervalSince1970 * 1000
        return Int64(intevalBegin)
    }
    
    public func currentDayEndInterval() -> Int64 {
        let datefmatter = DateFormatter()
        datefmatter.dateFormat="yyyy年MM月dd日"
        let dateStr = datefmatter.string(from: self)
        datefmatter.dateFormat="yyyy年MM月dd日 HH:mm:ss"
//        let dateBegin = datefmatter.date(from: "\(dateStr) 00:00:00")
        let dateEnd = datefmatter.date(from: "\(dateStr) 23:59:59")
//        let intevalBegin:TimeInterval = dateBegin!.timeIntervalSince1970 * 1000
        let intevalEnd:TimeInterval = dateEnd!.timeIntervalSince1970 * 1000
        return Int64(intevalEnd)
    }
    
    public func beginTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year,
                                                  Calendar.Component.month,
                                                  Calendar.Component.day]
        let dateComponents = calendar.dateComponents(component, from: self)
        
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: dateComponents.month, day: dateComponents.day, hour: 0, minute: 0, second: 0)
        return beginComponents.date ?? self
    }
    
    public func endTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year,
                                                  Calendar.Component.month,
                                                  Calendar.Component.day]
        let dateComponents = calendar.dateComponents(component, from: self)
        
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: dateComponents.month, day: dateComponents.day, hour: 23, minute: 59, second: 59)
        return beginComponents.date ?? self
    }
    
    public func beginMonthTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year,
                                                  Calendar.Component.month]
        let dateComponents = calendar.dateComponents(component, from: self)
        
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: dateComponents.month, day: 1, hour: 0, minute: 0, second: 0)
        return beginComponents.date ?? self
    }
    
    public func endMonthTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year,
                                                  Calendar.Component.month]
        var dateComponents = calendar.dateComponents(component, from: self)
        if let _ = dateComponents.month {
            dateComponents.month! += 1
        }
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: dateComponents.month, day: 1, hour: 0, minute: 0, second: 0)
        if let nextMonthDate = beginComponents.date {
            return nextMonthDate.addingTimeInterval(-1)
        }
        return self
    }
    
    public func beginYearTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year]
        let dateComponents = calendar.dateComponents(component, from: self)
        
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        return beginComponents.date ?? self
    }
    
    public func endYearTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year]
        var dateComponents = calendar.dateComponents(component, from: self)
        if let _ = dateComponents.year {
            dateComponents.year! += 1
        }
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: 1, day: 1, hour: 0, minute: 0, second: 0)
        if let nextMonthDate = beginComponents.date {
            return nextMonthDate.addingTimeInterval(-1)
        }
        return self
    }
    
    public func beginWeekTime() -> Date {
        let calendar = NSCalendar.current
        let component: Set<Calendar.Component> = [Calendar.Component.year,
                                                  Calendar.Component.month,
                                                  Calendar.Component.day,
                                                  Calendar.Component.weekday]
        let dateComponents = calendar.dateComponents(component, from: self)
        var interval = 0
        if dateComponents.weekday == 1 {
            interval = -6
        } else {
            interval = 2 - (dateComponents.weekday ?? 0)
        }
        let day = (dateComponents.day ?? 0) + interval
        
        let beginComponents = DateComponents(calendar: calendar, year: dateComponents.year, month: dateComponents.month, day: day, hour: 0, minute: 0, second: 0)
        return beginComponents.date ?? self
    }
    
    public func endWeekTime() -> Date {
        let beginDate = self.beginWeekTime()
        let interval = TimeInterval(7 * 24 * 3600 - 1)
        return beginDate.addingTimeInterval(interval)
    }
}

extension Date {
    public static func beginOfDay(_ year: Int, _ month: Int, _ day: Int) -> Date {
        let calendar = NSCalendar.current
        let components = DateComponents(calendar: calendar, year: year, month: month, day: day, hour: 0, minute: 0, second: 0)
        return components.date ?? Date()
    }
    
    public static func endOfDay(_ year: Int, _ month: Int, _ day: Int) -> Date {
        let calendar = NSCalendar.current
        let components = DateComponents(calendar: calendar, year: year, month: month, day: day, hour: 23, minute: 59, second: 59)
        return components.date ?? Date()
    }
}
