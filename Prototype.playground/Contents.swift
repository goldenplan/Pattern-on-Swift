//: Playground - noun: a place where people can play

import UIKit

// Pattern - Prototype

class Person: NSObject, NSCopying {
    var firstName:String?
    var lastName:String?
    var age: Int?
    
    init(firstName: String?, lastName: String?, age: Int?) {
        super.init()
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
        
    }
    
    init(person: Person) {
        super.init()
        
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.age = person.age
        
    }
    
    
    
    func copy(with zone: NSZone? = nil) -> Any {

        return Person(person: self)
        
    }
}

let people = Person(firstName: "Ivan", lastName: "Sidorov", age: 0)

let women = people.copy() as! Person
women.age = 14
women.firstName = "Ann"
women.lastName = "Belova"

print(women.firstName ?? "Name")
print(women.age ?? "No age")



