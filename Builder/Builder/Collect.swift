//
//  Collect.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class Collect: NSObject {

    var name = "Collect"
    
    var countForCollect:Int!
    
    var material: Material!
    
    init(material:Material, countForCollect:Int) {
        super.init()
        
        self.material = material
        
        self.countForCollect = countForCollect
        
        self.name = "\(name)(\(countForCollect))"
    }
    
    func make(){
        
        material.add(stage: self.name)
        
    }
    
}
