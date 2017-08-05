//: Playground - noun: a place where people can play

// Visitor pattern

import Cocoa

protocol Visitor{
    func visitElementA(elementA: ElementA)
    func visitElementB(elementB: ElementB)
}

class ConcreteVisitor1: Visitor{
    func visitElementA(elementA: ElementA) {
        elementA.operationA()
    }
    func visitElementB(elementB: ElementB) {
        elementB.operationB()
    }
}

class ConcreteVisitor2: Visitor{
    func visitElementA(elementA: ElementA) {
        elementA.operationA()
    }
    func visitElementB(elementB: ElementB) {
        elementB.operationB()
    }
}



protocol Element{
    func accept(v: Visitor)
}

class ElementA: Element{
    func accept(v: Visitor) {
        v.visitElementA(elementA: self)
    }
    func operationA(){
        print("operationA")
    }
}

class ElementB: Element{
    func accept(v: Visitor) {
        v.visitElementB(elementB: self)
    }
    func operationB(){
        print("operationB")
    }
}


class ObjectStructure{
    
    var elements = [Element]()
    
    func add(element: Element){
        elements.append(element)
    }
    
    func fooForAll(visitor: Visitor){
        for element in elements{
            element.accept(v: visitor)
        }
    }
    
}

let structure = ObjectStructure()
structure.add(element: ElementA())
structure.add(element: ElementB())
structure.fooForAll(visitor: ConcreteVisitor1())




