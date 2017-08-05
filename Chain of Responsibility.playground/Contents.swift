//: Playground - noun: a place where people can play

// Chain of Responsibility pattern

import Cocoa

struct langFrase{
    let lengCode: String
    let frase: String
}


protocol Translator{
    
    var successor: Translator? { get set }
    func handleReguest(reguest: langFrase)
    
}

class ToEnglishTranslator: Translator{
    
    let name = "Kate"
    
    let myLang = "en"

    var successor: Translator?

    func handleReguest(reguest: langFrase) {
        
        if myLang == reguest.lengCode {
            print("\(name) is your translator")
        } else if successor != nil{
            successor?.handleReguest(reguest: reguest)
        }
        
    }
    
}

class ToGemanTranslator: Translator{
    
    let name = "Karl"
    
    let myLang = "ge"
    
    var successor: Translator?
    
    func handleReguest(reguest: langFrase) {
        
        if myLang == reguest.lengCode {
            print("\(name) is your translator")
        } else if successor != nil{
            successor?.handleReguest(reguest: reguest)
        }
        
    }
    
}

let frase = langFrase(lengCode: "en", frase: "dog")

let translator1 = ToEnglishTranslator()
let translator2 = ToGemanTranslator()
translator1.successor = translator2

translator1.handleReguest(reguest: frase)
















