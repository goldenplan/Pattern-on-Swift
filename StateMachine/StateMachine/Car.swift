//
//  Car.swift
//  StateMachine
//
//  Created by Snake on 15.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

class Car: NSObject {
    
    var state: State = ParkingState.sharedInstance {
        didSet{
            
            if !(self.state.availableState(for: self).contains(where: { (state) -> Bool in
                return state.name == self.state.name
            })) {
                
                self.state = ParkingState.sharedInstance
                
            }
            delegate?.changeState(state: state)
        }

    }

    var fuelValue: Int = 30{
        didSet{
            delegate?.changeFuelValue(value: fuelValue)
        }
    }
    
    var delegate:ViewControllerProtocol?
    
    func nextState(){
        state.next(for: self)
    }
    

}
