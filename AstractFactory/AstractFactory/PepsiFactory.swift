//
//  PepsiFactory.swift
//  StateMashine
//
//  Created by Snake on 14/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class PepsiFactory: AbstractFacrory {

    override func create() -> PepsiProduct{
        
        return PepsiProduct(bottle: PepsiBottle(), water: PepsiWater())
    }
    
}
