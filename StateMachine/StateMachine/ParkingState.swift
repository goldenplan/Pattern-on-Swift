//
//  ParkingState.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class ParkingState: State {
    
    static let sharedInstance: ParkingState = {
        let instance = ParkingState()
        // setup code
        return instance
    }()
    
    var id = 0
    
    var name = "Parking"
    
    var minFuelValue = 0
    
    func next(for car: Car){
    
        car.state = FillingState.sharedInstance
    
    }
    
    func availableState(for car: Car) -> [State]{
        
        if car.fuelValue > 0{
            return [ParkingState.sharedInstance, FillingState.sharedInstance, RidingState.sharedInstance]
        }else{
            return [ParkingState.sharedInstance, FillingState.sharedInstance]
        }
    }
}
