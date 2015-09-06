//
//  HexClockView.swift
//  Hex Clock
//
//  Created by Tom Diggle on 03/09/2015.
//  Copyright © 2015 Tom Diggle. All rights reserved.
//

import Foundation
import ScreenSaver

class HexClockView: ScreenSaverView {
    
    let textLabel: NSTextField = {
        let label = NSTextField()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.editable = false
        label.drawsBackground = false
        label.bordered = false
        label.bezeled = false
        label.selectable = false
        label.textColor = .whiteColor()
        return label
    }()
    
    let hexClock = HexClock()
    
    // MARK: Initializers
    
    override init!(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialize()
    }
    
    // MARK: NSView
    
    override func drawRect(rect: NSRect) {
        self.textLabel.font = .systemFontOfSize(bounds.width / 10)
    }
    
    // MARK: ScreenSaver
    
    override func animateOneFrame() {
        self.textLabel.stringValue = "#" + self.hexClock.stringOfCurrentTime()
        self.layer?.backgroundColor = self.hexClock.colorFromCurrentTime().CGColor
    }
    
    // MARK: Private
    
    private func initialize() {
        self.wantsLayer = true;
        
        self.animationTimeInterval = 1 / 30
        
        addSubview(self.textLabel)
        addConstraints([
            NSLayoutConstraint(item: self.textLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.textLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.textLabel, attribute: .Width, relatedBy: .LessThanOrEqual, toItem: self, attribute: .Width, multiplier: 0.9, constant: 0)
        ])
    }
    
}
