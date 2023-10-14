//
//  HexClock.swift
//  Hex Clock
//
//  Created by Tom Diggle on 27/08/2015.
//  Copyright © 2015 Tom Diggle. All rights reserved.
//

import Cocoa

class HexClock {
    
    let calendar: Calendar
    
    init() {
        self.calendar = Calendar.current
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
        let date = Date()
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        return (hour, minute, second)
    }
    
}
