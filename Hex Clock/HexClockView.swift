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
        label.isEditable = false
        label.drawsBackground = false
        label.isBordered = false
        label.isBezeled = false
        label.isSelectable = false
        label.textColor = .white
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
    
    override func draw(_ rect: NSRect) {
        self.textLabel.font = NSFont.monospacedDigitSystemFont(
                ofSize: bounds.width / 15,
                weight: .ultraLight
            )
    }
    
    // MARK: ScreenSaver
    
    override func animateOneFrame() {
        self.textLabel.stringValue = "#" + self.hexClock.stringOfCurrentTime()
        self.layer?.backgroundColor = self.hexClock.colorFromCurrentTime().cgColor
    }
    
    // MARK: Private
    
    private func initialize() {
        self.wantsLayer = true;
        
        self.animationTimeInterval = 1 / 30
        
        addSubview(self.textLabel)
        addConstraints([
            NSLayoutConstraint(item: self.textLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.textLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: self.textLabel, attribute: .width, relatedBy: .lessThanOrEqual, toItem: self, attribute: .width, multiplier: 0.9, constant: 0)
        ])
    }
    
}
