// Adapter

import Cocoa

class Client{
    var target: Target!
}

protocol Target{
    func reguest()
}

class Adaptee{
    func spesialRequest(){
        print("Adapted at new request")
    }
}

// Class Adapter

class ClassAdapter: Adaptee, Target{
    
    func reguest() {
        spesialRequest()
    }
    
}

let client = Client()
client.target = ClassAdapter()
client.target.reguest()


// Object Adapter

class ObjectAdapter: Target{
    
    var adaptee = Adaptee()
    
    func reguest() {
        adaptee.spesialRequest()
    }
    
}

client.target = ObjectAdapter()

client.target.reguest()











