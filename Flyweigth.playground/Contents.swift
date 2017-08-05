//: Playground - noun: a place where people can play

// Flyweight pattern

import Cocoa

class FlyweightFactory{
    
    var pool = [String : Flyweight]()
    
    func getFlyweight(key: String) -> Flyweight{
        
        if pool.keys.contains(key){
            return pool[key]!
        }
        
        pool[key] = SharedFlyweight()
        
        return pool[key]!
    }
    
}

class Flyweight{
    func operation(frase: String){}
}

class SharedFlyweight: Flyweight{
    
    override func operation(frase: String) {
        print("SharedFlyweight tell:", frase)
    }
    
}

class UnsharedFlyweightA: Flyweight{
    
    var flyWeight: Flyweight!
    
    init(flyWeight: Flyweight) {
        self.flyWeight = flyWeight
    }
    
    override func operation(frase: String) {
        self.flyWeight.operation(frase: "\(frase) as UnsharedFlyweightA")
    }
    
}

class UnsharedFlyweightB: Flyweight{
    
    var flyWeight: Flyweight!
    
    init(flyWeight: Flyweight) {
        self.flyWeight = flyWeight
    }
    
    override func operation(frase: String) {
        self.flyWeight.operation(frase: "\(frase) as UnsharedFlyweightB")
    }
    
}

let factory = FlyweightFactory()
let sharedFlyweight = factory.getFlyweight(key: "1")

let unsharedFlyweightA = UnsharedFlyweightA(flyWeight: sharedFlyweight)
unsharedFlyweightA.operation(frase: "Hi")

let unsharedFlyweightB = UnsharedFlyweightB(flyWeight: sharedFlyweight)
unsharedFlyweightB.operation(frase: "Hi")






