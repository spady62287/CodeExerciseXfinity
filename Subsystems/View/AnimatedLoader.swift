//
//  AnimatedLoader.swift
//  CodeExerciseXfinity
//
//  Created by DANIEL SPADY on 9/6/19.
//  Copyright © 2019 DANIEL SPADY. All rights reserved.
//

import UIKit

class AnimatedLoader: UIView {
    
    @IBInspectable var tick:CGFloat = 1.0 {
        didSet { setNeedsDisplay() }
    }
    
    fileprivate var timer: Timer?
    
    fileprivate static let numberOfFrames = 34.0
    
    func start() {
        guard timer == nil else { return }
        
        timer = Timer(timeInterval: 0.7 / AnimatedLoader.numberOfFrames, target: self, selector: #selector(AnimatedLoader.timerEvent), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }

    @objc func timerEvent() {
        tick += 1
    }
}
