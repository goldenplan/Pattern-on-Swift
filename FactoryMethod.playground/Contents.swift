//: Playground - noun: a place where people can play

import Cocoa

class Product: NSObject{
    
}

class ConcreteProduct: Product{
    
    func tellAboutSelf(){
        print(self.hash)
    }
    
}

class Creator{
    
    var product: Product? = nil
    
    func factoryMethod() -> Product {
        return Product()
    }
    
    public func anOperation(){
        print("anOperation")
        self.product = factoryMethod()
    }
    
}

class ConcreteCreator: Creator{
    
    override func factoryMethod() -> Product {
        return ConcreteProduct()
    }
    
}

let creator = ConcreteCreator()
let product = creator.factoryMethod()

(product as! ConcreteProduct).tellAboutSelf()
creator.anOperation()










