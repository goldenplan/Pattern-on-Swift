//
//  State.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

protocol State {
    
    var id: Int {get set}
    
    var name:String {get set}
    
    var minFuelValue:Int {get set}
    
    func next(for car: Car)
    
    func availableState(for car: Car) -> [State]

}


