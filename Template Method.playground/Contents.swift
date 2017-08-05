//: Playground - noun: a place where people can play

// Template Method pattern

import Cocoa

class AbstractClass{
    
    func templateMethod(){
        primitiveOperation1()
        primitiveOperation2()
    }
    
    func primitiveOperation1(){}
    func primitiveOperation2(){}
    
}

class ConcreteClass: AbstractClass{
    
    override func primitiveOperation1() {
        print("primitiveOperation1")
    }
    
    override func primitiveOperation2() {
        print("primitiveOperation2")
    }
    
}

let concreteClass = ConcreteClass()
concreteClass.templateMethod()

