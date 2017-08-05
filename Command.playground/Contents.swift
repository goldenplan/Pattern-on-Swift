//: Playground - noun: a place where people can play

// Command pattern

import Cocoa

class Invoker{ // Waiter
    
    var command: Command!
    
    public func storeCommand(command: Command){
        self.command = command
    }
    
    public func executeCommand(){
        command.execute()
    }
    
}

class Command {
    
    var receiver: Receiver
    
    init(receiver: Receiver) {
        self.receiver = receiver
    }
    
    public func execute(){
        
    }
    
}

class Receiver{  // Cook
    
    public func action(){
        
        print("Receiver")
        
    }
    
}

class ConcreteCommand: Command{
    
    override init(receiver: Receiver) {
        super.init(receiver: receiver)
    }
    
    override func execute() {
        receiver.action()
    }
    
}

let receiver = Receiver() // Cook
let command = ConcreteCommand(receiver: receiver)
let invoker = Invoker() // Waiter

invoker.storeCommand(command: command)
invoker.executeCommand()


