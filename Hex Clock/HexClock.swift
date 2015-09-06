//
//  HexClock.swift
//  Hex Clock
//
//  Created by Tom Diggle on 27/08/2015.
//  Copyright © 2015 Tom Diggle. All rights reserved.
//

import Cocoa

class HexClock {
    
    let calendar: NSCalendar
    
    init() {
        self.calendar = NSCalendar.currentCalendar()
    }
    
    func stringOfCurrentTime() -> String {
        let time = self.getCurrentTime()
        let hour = time.hour <= 9 ? "0\(time.hour)" : "\(time.hour)"
        let minute = time.minute <= 9 ? "0\(time.minute)" : "\(time.minute)"
        let second = time.second <= 9 ? "0\(time.second)" : "\(time.second)"
        
        return "\(hour)\(minute)\(second)"
    }
    
    func colorFromCurrentTime() -> NSColor {
        let time = self.getCurrentTime()
        return NSColor(red: time.hour, green: time.minute, blue: time.second)
    }
    
    private func getCurrentTime() -> (hour: Int, minute: Int, second: Int) {
        var (hour, minute, second, nanosecond) = (0, 0, 0, 0)
        let date = NSDate()
        calendar.getHour(&hour, minute: &minute, second: &second, nanosecond: &nanosecond, fromDate: date)
        
        return (hour, minute, second)
    }
    
}
