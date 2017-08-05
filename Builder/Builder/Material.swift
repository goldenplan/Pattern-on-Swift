//
//  Material.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class Material: NSObject {

    var name: String!
    
    var stages = [String]()
    
    func add(stage: String){
        
        self.stages.append(stage)
        
    }
    
    
    func show() -> String {
        
        print(stages.joined(separator: " "))
        
        return stages.joined(separator: " ")
    }
    
    
    
}
