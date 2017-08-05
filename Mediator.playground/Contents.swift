//: Playground - noun: a place where people can play

// Mediator pattern

import Cocoa

protocol Mediator{
    func send(message: String, colleague: Colleague)
}

class Colleague{
    
    var mediator: Mediator!
    
    init(mediator: Mediator) {
        self.mediator = mediator
    }
    
}

class ConcreteMediator: Mediator{
    var concreteColleagueFirst: ConcreteColleagueFirst!
    var concreteColleagueSecond: ConcreteColleagueSecond!
    
     func send(message: String, colleague: Colleague) {
        if colleague is ConcreteColleagueFirst{
            concreteColleagueSecond.notify(message: message)
        }else{
            concreteColleagueFirst.notify(message: message)
        }
    }
}

class ConcreteColleagueFirst:Colleague{
    
    override init(mediator: Mediator) {
        super.init(mediator: mediator)
    }
    
    func send(message: String){
        mediator.send(message: message, colleague: self)
    }
    
    func notify(message: String){
        print("First got: ", message)
    }
    
}


class ConcreteColleagueSecond:Colleague{
    
    override init(mediator: Mediator) {
        super.init(mediator: mediator)
    }
    
    func send(message: String){
        mediator.send(message: message, colleague: self)
    }
    
    func notify(message: String){
        print("Second got: ", message)
    }
    
}

let concreteMediator  = ConcreteMediator()
let concreteColleagueFirst = ConcreteColleagueFirst(mediator: concreteMediator)
let concreteColleagueSecond = ConcreteColleagueSecond(mediator: concreteMediator)

concreteMediator.concreteColleagueFirst = concreteColleagueFirst
concreteMediator.concreteColleagueSecond = concreteColleagueSecond
concreteColleagueFirst.send(message: "Hi Second!")
concreteColleagueSecond.send(message: "Hi First!")

