//
//  Director.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class Director: NSObject {

    var builder: Builder!
    
    init(builder: Builder) {
        super.init()
        
        self.builder = builder
        
    }
    
    func constract() {
        builder.stageA()
        builder.stageB()
        builder.stageC()
    }
    
}
