//
//  Triangle.swift
//  Bridge
//
//  Created by Snake on 24/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class Triangle: FigureMaker {

    override init() {
        
        super.init()
        
        points = [
            CGPoint(x: 0, y: 30),
            CGPoint(x: -50, y: -30),
            CGPoint(x: 50, y: -30),
            ]
    }
    
    
    
}
