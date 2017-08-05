//: Playground - noun: a place where people can play

// Strategy pattern

import Cocoa

class Context{
    
    var strategy: Strategy!
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func contextInterface(){
        strategy.algoritmInterface()
    }
    
}

protocol Strategy{
    func algoritmInterface()
}

class ConcreteStrategyA: Strategy{
    func algoritmInterface() {
        print("ConcreteStrategyA")
    }
}

class ConcreteStrategyB: Strategy{
    func algoritmInterface() {
        print("ConcreteStrategyB")
    }
}

class ConcreteStrategyC: Strategy{
    func algoritmInterface() {
        print("ConcreteStrategyC")
    }
}


var context: Context!
context = Context(strategy: ConcreteStrategyA())
context.contextInterface()
context = Context(strategy: ConcreteStrategyB())
context.contextInterface()
context = Context(strategy: ConcreteStrategyC())
context.contextInterface()






