//
//  ViewController.swift
//  Preview
//
//  Created by Tom Diggle on 03/09/2015.
//  Copyright © 2015 Tom Diggle. All rights reserved.
//

import Cocoa
import ScreenSaver

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = view as? ScreenSaverView {
            NSTimer.scheduledTimerWithTimeInterval(view.animationTimeInterval, target: view, selector: "animateOneFrame", userInfo: nil, repeats: true)
        }
    }
    
}
