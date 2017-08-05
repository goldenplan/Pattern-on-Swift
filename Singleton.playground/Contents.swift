//: Playground - noun: a place where people can play

import UIKit



// Singleton

class Singleton: NSObject{
    
    //static var sharedInstance: Singleton?
    
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
    
    let testData:Int?
    
    internal override init() {
        
        testData = Int(arc4random())
        
        super.init()
    }
    
    //    class func getInstance() -> Singleton{
    //
    //        if sharedInstance == nil {
    //            sharedInstance = Singleton()
    //        }
    //
    //        return sharedInstance!
    //    }
    
    
}

//let sing1 = Singleton.getInstance()
//print(sing1.testData ?? "")
//let sing2 = Singleton.getInstance()
//print(sing2.testData ?? "")


let sing1 = Singleton.sharedInstance
print(sing1.testData ?? "")
let sing2 = Singleton.sharedInstance
print(sing2.testData ?? "")

