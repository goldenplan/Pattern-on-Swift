//: Playground - noun: a place where people can play

// Observer pattern

import Cocoa

class Subject{
    
    var observers = [Observer]()
    
    var state: String!{
        didSet{
            notify()
        }
    }
    
    func attach(observer: Observer){
        observers.append(observer)
    }
    
    func detach(observer: Observer){
        observers = observers.filter({ (ob) -> Bool in
            if ob != observer{
                return true
            }else{
                return false
            }
        })
    }
    
    func notify(){
        
        for observer in observers{
            observer.update(state: state)
        }
    }
    
}


class Observer: NSObject{
    
    var observerState: String!{
        didSet{
            print("\(self.className.components(separatedBy: ".")[1]) state set on: \(observerState!)")
        }
    }
    var subject: Subject!
    
    init(subject: Subject) {
        self.subject = subject
    }
    
    func update(state: String? = nil){}
    
}

class PullObserver: Observer{
    
    override func update(state: String? = nil){
        observerState = subject.state
    }
    
}


class PushObserver: Observer{
    
    override func update(state: String? = nil){
        observerState = state
    }
    
}

let subject = Subject()

let pullObserver = PullObserver(subject: subject)
let pushObserver = PushObserver(subject: subject)

subject.attach(observer: pullObserver)
subject.attach(observer: pushObserver)
subject.detach(observer: pullObserver)

subject.state = "GoodState"


