//
//  AbstractProduct.swift
//  AstractFactory
//
//  Created by Snake on 14/07/2017.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class AbstractProduct: NSObject {

    var bottle: AbstractBottle?
    var water: AbstractWater?
    
    init(bottle: AbstractBottle, water: AbstractWater) {
        
        self.bottle = bottle
        self.water = water
        
    }
    
    func showProdictComponents() -> String{
        let productInfo = "Bottle: \(String(describing: bottle!.label!)), Water: \(String(describing: water!.label!)) "
        
        print(productInfo)
        
        return productInfo
    }
    
}
