//: Playground - noun: a place where people can play

// Decorator pattern

import Cocoa

class Component{
    func operation(){
        
    }
}

class ConcreteComponent: Component{
    override func operation() {
        print("Concrete component")
    }
}

class Decorator: Component{
    
    public var component: Component!
    
    override func operation() {
        if component != nil{
            component.operation()
        }
    }
}

class ConcreteDecoratorA: Decorator{
    
    let addedState = "Same State"
    
    override func operation() {
        super.operation()
        print(addedState)
    }
    
}

class ConcreteDecoratorB: Decorator{
    
    func addBehavior(){
        print("Behavior")
    }
    
    override func operation() {
        super.operation()
        addBehavior()
    }
    
}

let component = ConcreteComponent()
let decoratorA = ConcreteDecoratorA()
let decoratorB = ConcreteDecoratorB()

decoratorA.component = component
decoratorB.component = decoratorA
decoratorB.operation()



















