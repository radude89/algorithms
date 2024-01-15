//
//  StackList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

extension StackList: Playground {

    // MARK: - Main
    static func executeOperations() {
        var expression = "(a+(b-c))*(d/e)"
        print("Infix to postfix\n\(expression) --> \(infixToPostfix(from: expression))\n")
        
        expression = "*+ab-cd"
        print("Prefix to infix\n\(expression) --> \(prefixToInfix(from: expression))\n")

        print("Prefix to postfix\n\(expression) --> \(prefixToPostfix(from: expression))\n")

        expression = prefixToPostfix(from: expression)
        print("Postfix to prefix\n\(expression) --> \(postfixToPrefix(from: expression))\n")

        print("Postfix to infix\n\(expression) --> \(postfixToInfix(from: expression))\n")
        
        expression = "(A-B/C)*(A/K-L)"
        print("Infix to prefix\n\(expression) --> \(infixToPrefix(from: expression))\n")
    }
    
    // MARK: - Operations
    private static func infixToPrefix(from expression: String) -> String {
        let stack = StackList<String>()
        var output = String()
        
        expression.reversed().forEach { char in
            guard !char.isLetter else {
                output.append(char)
                return
            }
            
            while char != ")",
                  !stack.isEmpty,
                  let peek = stack.peek,
                  peek != ")",
                  let charPriority = priority(from: char),
                  let peekPriority = priority(from: Character(peek)),
                  (charPriority.rawValue < peekPriority.rawValue ||
                   (char == "^" && charPriority.rawValue <= peekPriority.rawValue)) {
                output.append(stack.pop()!)
            }
            
            if char == "(" {
                _ = stack.pop()
            } else {
                stack.push(data: char)
            }
        }
        
        while !stack.isEmpty {
            output.append(stack.pop()!)
        }
        
        return String(output.reversed())
    }
    
    private static func postfixToInfix(from expression: String) -> String {
        let stack = StackList<String>()
        
        expression.forEach { char in
            if char.isLetter {
                stack.push(data: char)
            } else {
                let op1 = stack.pop() ?? ""
                let op2 = stack.pop() ?? ""
                let newElement = "(\(op2)\(String(char))\(op1))"
                stack.push(data: newElement)
            }
        }
        
        return stack.pop() ?? ""
    }
    
    private static func postfixToPrefix(from expression: String) -> String {
        let stack = StackList<String>()
        
        expression.forEach { char in
            if char.isLetter {
                stack.push(data: char)
            } else {
                let op1 = stack.pop() ?? ""
                let op2 = stack.pop() ?? ""
                let newElement = "\(String(char))\(op2)\(op1)"
                stack.push(data: newElement)
            }
        }
        
        return stack.pop() ?? ""
    }
    
    private static func prefixToPostfix(from expression: String) -> String {
        let stack = StackList<String>()
        
        expression.reversed().forEach { char in
            if char.isLetter {
                stack.push(data: char)
            } else {
                let op1 = stack.pop() ?? ""
                let op2 = stack.pop() ?? ""
                let newElement = "\(op1)\(op2)\(String(char))"
                stack.push(data: newElement)
            }
        }
        
        return stack.pop() ?? ""
    }
    
    private static func prefixToInfix(from expression: String) -> String {
        let stack = StackList<String>()
        
        expression.reversed().forEach { char in
            if char.isLetter {
                stack.push(data: char)
            } else {
                let op1 = stack.pop() ?? ""
                let op2 = stack.pop() ?? ""
                let newElement = "(\(op1)\(String(char))\(op2))"
                stack.push(data: newElement)
            }
        }
        
        return stack.pop() ?? ""
    }
    
    private static func infixToPostfix(from expression: String) -> String {
        let stack = StackList<String>()
        var output = String()
        
        expression.forEach { char in
            guard !char.isLetter else {
                output.append(char)
                return
            }
            
            while char != "(",
                  !stack.isEmpty,
                  let peek = stack.peek,
                  peek != "(",
                  let charPriority = priority(from: char),
                  let peekPriority = priority(from: Character(peek)),
                  charPriority.rawValue <= peekPriority.rawValue {
                output.append(stack.pop()!)
            }
            
            if char == ")" {
                _ = stack.pop()
            } else {
                stack.push(data: char)
            }
        }
        
        while !stack.isEmpty {
            output.append(stack.pop()!)
        }
        
        return output
    }
}

// MARK: - Helpers
private enum Priority: Int {
    case lowest
    case low
    case medium
    case high
}

private func priority(from char: Character) -> Priority? {
    switch char {
    case ")", "(":
        return .lowest
    case "+", "-":
        return .low
    case "/", "*":
        return .medium
    case "^":
        return .high
    default:
        return nil
    }
}
