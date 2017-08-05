//
//  ColaFactory.swift
//  StateMashine
//
//  Created by Snake on 14/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class ColaFactory: AbstractFacrory {

    override func create() -> ColaProduct{
        
        return ColaProduct(bottle: ColaBottle(), water: ColaWater())
    }
    
}
