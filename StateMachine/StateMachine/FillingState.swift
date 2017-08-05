//
//  FillingState.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class FillingState: State {
    
    static let sharedInstance: FillingState = {
        let instance = FillingState()
        // setup code
        return instance
    }()
    
    var id = 1
    
    var name = "Filling"
    
    var minFuelValue = 0
    
    func next(for car: Car){
        
        if car.fuelValue > 0{
            car.state = RidingState.sharedInstance
        }else{
            car.state = ParkingState.sharedInstance
        }
        
    }
    
    func availableState(for car: Car) -> [State]{
        
        if car.fuelValue > 0{
            return [ParkingState.sharedInstance, FillingState.sharedInstance, RidingState.sharedInstance]
        }else{
            return [ParkingState.sharedInstance, FillingState.sharedInstance]
        }
        
    }
}
