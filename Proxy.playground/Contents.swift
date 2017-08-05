//: Playground - noun: a place where people can play

// Proxy pattern

import Cocoa

protocol Subject{
    func operation()
}

class RealSubject: Subject{
    func operation() {
        print("I am subject")
    }
}

class Proxy: Subject{
    
    var realSubject:RealSubject?
    
    var requst:RealSubject?{
        get{
            if realSubject == nil{
                realSubject = RealSubject()
            }
            return realSubject
        }
    }
    
    func operation() {
        requst!.operation()
    }

}

let proxy = Proxy()
proxy.operation()








