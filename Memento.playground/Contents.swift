//: Playground - noun: a place where people can play

// Memento pattern

import Cocoa

class Originator{
    
    var state: String!{
        didSet{
            print("Set state: \(state!)")
        }
    }
    
    func setMemento(memento: Memento){
        print("Change current state: \(state!), to saved state: \(memento.state!)")
        state = memento.state
    }
    
    func createMemento() -> Memento{
        print("Save state:", state)
        return Memento(state: state)
    }
    
}

class Memento{
    var state: String!
    
    init(state: String) {
        self.state = state
    }
}

class Caretaker{
    var memento: Memento!
}


let originator = Originator()
originator.state = "On"

let careTaker = Caretaker()
careTaker.memento = originator.createMemento()

originator.state = "Off"

originator.setMemento(memento: careTaker.memento)






