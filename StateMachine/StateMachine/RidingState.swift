//
//  RidingState.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class RidingState: State {
    
    static let sharedInstance: RidingState = {
        let instance = RidingState()
        // setup code
        return instance
    }()
    
    var id = 2
    
    var name = "Riding"
    
    var minFuelValue = 1
    
    func next(for car: Car){
        
        car.state = ParkingState.sharedInstance
        
    }
    
    func availableState(for car: Car) -> [State]{
        
        if car.fuelValue > 0{
            return [ParkingState.sharedInstance, FillingState.sharedInstance, RidingState.sharedInstance]
        }else{
            return [ParkingState.sharedInstance, FillingState.sharedInstance]
        }
    }
}
