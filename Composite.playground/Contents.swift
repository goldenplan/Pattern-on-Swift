//: Playground - noun: a place where people can play

// Composite pattern

import Cocoa

protocol Component{
    var name:String {get set}
    init(name: String)
    func add(component: Component) throws
    func operation()
    func remove(at index: Int) throws
    func getChild() throws
}

enum MyError : Error {
    case RuntimeError(String)
}

class Composite: Component{
    
    var nodes = [Component]()
    
    var name: String = ""
    
    required init(name: String){
        self.name = name
    }
    
    func add(component: Component){
        nodes.append(component)
    }
    
    func operation(){
        print(name)
        
        for item in nodes{
            item.operation()
        }
        
    }
    
    func remove(at index: Int){
        nodes.remove(at: index)
    }
    
    func getChild(){
        for item in nodes{
            print("Child - ", item.name)
        }
    }
    
}

class Leaf: Component{
    
    var name: String = ""
    
    required init(name: String){
        self.name = name
    }
    
    func operation(){
        print(name)
    }
    
    func add(component: Component) throws {
        throw MyError.RuntimeError("It has no chaild.")
    }

    func remove(at index: Int) throws {
        throw MyError.RuntimeError("It has no chaild.")
    }
    func getChild() throws {
        throw MyError.RuntimeError("It has no chaild.")
        
    }
}

// Main

let root        = Composite(name: "ROOT")
let branch1     = Composite(name: "BR1")
let branch2     = Composite(name: "BR2")
let leaf1       = Leaf(name: "L1")
let leaf2       = Leaf(name: "L2")

root.add(component: branch1)
root.add(component: branch2)
branch1.add(component: leaf1)
branch2.add(component: leaf2)
root.operation()





