//
//  AbstractBottle.swift
//  StateMashine
//
//  Created by Snake on 14/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class AbstractBottle: NSObject {
    
    var label:String?
    
    override init() {
        super.init()
        
        label = String(describing: type(of: self))
    }
    

}
