//
//  Client.swift
//  AstractFactory
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Snake. All rights reserved.
//

import UIKit

class Client: NSObject {

    func make(on factory: AbstractFacrory) -> AbstractProduct {
        
        return factory.create()
        
    }
    
}
