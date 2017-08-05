//
//  Pack.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class Pack: NSObject {

    let name = "Pack"
    
    var material: Material!
    
    init(material: Material) {
        super.init()
        
        self.material = material
        
    }
    
    func make(){
        
        material.add(stage: self.name)
        
    }
    
}
