//
//  Pentagon.swift
//  Bridge
//
//  Created by Snake on 24/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class Pentagon: FigureMaker {

    override init() {
        
        super.init()
        
        points = [
            CGPoint(x: 0, y: 30),
            CGPoint(x: -30, y: 10),
            CGPoint(x: -15, y: -20),
            CGPoint(x: 15, y: -20),
            CGPoint(x: 30, y: 10)
        ]
    }
    
}
