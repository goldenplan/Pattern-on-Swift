//
//  ConcreteBuilder.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class ConcreteBuilder: NSObject, Builder {

    var material: Material!
    
    var collect: Collect!
    
    var fry: Fry!
    
    var pack: Pack!
    
    var count: Int!
    
    init(material: Material) {
        super.init()
        
        self.material = material
        
        if material is Seeds {
            self.count = 1000
        }else{
            self.count = 100
        }
        
        self.collect = Collect(material:material, countForCollect:count)
        self.fry = Fry(material: material)
        self.pack = Pack(material: material)
        
    }
    
    func stageA(){
        collect.make()
    }
    
    func stageB(){
        fry.make()
    }
    
    func stageC(){
        pack.make()
    }
    
    func getResult() -> Material{
        return material
    }
    
    
}
