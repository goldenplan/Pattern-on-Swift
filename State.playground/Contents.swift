//: Playground - noun: a place where people can play

// State pattern

import Cocoa

class Context{
    
    var state: State? = nil{
        didSet{
            print("My state changed to: \(state!.stateName)")
        }
    }
    
    init(state: State) {
        print("Set default state: \(state.stateName)")
        self.state = state
    }
    
    func request(){
        state?.handle(context: self)
    }
    
}

protocol State{
    var stateName: String {get set}
    func handle(context: Context)
}

class ConcreteStateA: State{
    
    var stateName: String = "State A"
    
    func handle(context: Context) {
        context.state = ConcreteStateB()
    }
}

class ConcreteStateB: State{
    
    var stateName: String = "State B"

    func handle(context: Context) {
        context.state = ConcreteStateA()
    }
}


let context = Context(state: ConcreteStateA())
context.request()
context.request()





