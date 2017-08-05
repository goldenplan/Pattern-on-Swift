//: Playground - noun: a place where people can play

// Interpreter pattern

import Cocoa

class Context{
    
    var source:     String!
    var vocabulary: Character!
    var result:     Bool!
    var position:   Int = 0
    
    init(vocabulary: Character, source: String) {
        self.vocabulary = vocabulary
        self.source = source
    }
    
    
}

protocol AbstructExpression{
    func interpret(context: Context)
}

class TerminalExpression: AbstructExpression{
    
    func interpret(context: Context) {
        let index = context.source.index(context.source.startIndex, offsetBy: context.position)
        context.result = context.source[index] == context.vocabulary
    }
    
}

class NonterminalExpression: AbstructExpression{

    var nonterminalExpression: AbstructExpression!
    var terminalExpression: AbstructExpression!
    
    func interpret(context: Context) {
        
        if context.position < context.source.characters.count{
            terminalExpression = TerminalExpression()
            terminalExpression.interpret(context: context)
            context.position = context.position + 1
            
            if context.result{
                
                nonterminalExpression = NonterminalExpression()
                nonterminalExpression.interpret(context: context)
                
            }
        
        }
        
    }
    
}

let context = Context(vocabulary: "a", source: "aaa")

let expression = NonterminalExpression()
expression.interpret(context: context)
print(context.result)














