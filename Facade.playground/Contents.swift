//: Playground - noun: a place where people can play

// Facade pattern

import Cocoa

class SubSystemA{
    public func operationA(){
        print("SubSystem A")
    }
}

class SubSystemB{
    public func operationB(){
        print("SubSystem B")
    }
}

class SubSystemC{
    public func operationC(){
        print("SubSystem C")
    }
}

class Facade{
    
    var subSystemA = SubSystemA()
    var subSystemB = SubSystemB()
    var subSystemC = SubSystemC()
    
    public func operationAB(){
        subSystemA.operationA()
        subSystemB.operationB()
    }
    
    public func operationBC(){
        subSystemB.operationB()
        subSystemC.operationC()
    }
}

let facade = Facade()
facade.operationAB()








