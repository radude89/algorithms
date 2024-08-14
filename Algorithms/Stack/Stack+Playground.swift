//
//  StackList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

extension StackList: Playground {
    static func executeOperations() {
        postfixToPrefix()
    }
}

// MARK: - Postfix to Prefix
private extension StackList {
    static func postfixToPrefix() {
        let input = "ABC*DE-/+".stringByRemovingSpecialCharacters
        let stack: StackList<String> = .init()
        for char in input {
            if char.isLetter {
                stack.push(String(char))
            } else {
                let operand1 = stack.pop() ?? ""
                let operand2 = stack.pop() ?? ""
                let result = "\(char)\(operand2)\(operand1)"
                stack.push(result)
            }
        }
        print(stack.pop() ?? "")
    }
}

// MARK: - Prefix to Postfix
private extension StackList {
    static func prefixToPostfix() {
        let input = "*-A/BC-/AKL".stringByRemovingSpecialCharacters
        let reversed = input.reversed()
        let stack: StackList<String> = .init()
        for char in reversed {
            if char.isLetter {
                stack.push(String(char))
            } else {
                let operand1 = stack.pop() ?? ""
                let operand2 = stack.pop() ?? ""
                let result = "\(operand1)\(operand2)\(char)"
                stack.push(result)
            }
        }
        print(stack.pop() ?? "")
    }
}

// MARK: - Prefix to Infix
private extension StackList {
    static func prefixToInfix() {
//        let input = "*+AB-CD".stringByRemovingSpecialCharacters
//        let input = "*-A/BC-/AKL".stringByRemovingSpecialCharacters
        let input = "*-A/BC*-/AKL+MN".stringByRemovingSpecialCharacters
        let reversed = input.reversed()
        let stack: StackList<String> = .init()
        for char in reversed {
            if char.isLetter {
                stack.push(String(char))
            } else {
                let operand1 = stack.pop() ?? ""
                let operand2 = stack.pop() ?? ""
                let result = "(\(operand1)\(char)\(operand2))"
                stack.push(result)
            }
        }
        print(stack.pop() ?? "")
    }
}

// MARK: - Infix to Postfix
private extension StackList {
    static func infixToPostfix() {
        let input = "a+b*(c^d-e)^(f+g*h)-i".stringByRemovingSpecialCharacters
        let outputStack: StackList<Character> = .init()
        let operatorStack: StackList<Character> = .init()
        
        for char in input {
            if char.isLetter { // found operand
                outputStack.push(char)
            } else if char == "(" || operatorStack.isEmpty || operatorStack.peek == "(" {
                operatorStack.push(char)
            } else if char == ")" {
                while let current = operatorStack.pop(), current != "(" {
                    outputStack.push(current)
                }
            } else if let currentOperator = Operator(char) {
                while let topOperator = Operator(operatorStack.peek),
                      currentOperator.precedencePriority <= topOperator.precedencePriority,
                      !operatorStack.isEmpty,
                      operatorStack.peek != "(" {
                    outputStack.push(Character(topOperator.rawValue))
                    operatorStack.pop()
                }
                operatorStack.push(Character(currentOperator.rawValue))
            }
        }
        while !operatorStack.isEmpty {
            if let currentOperator = operatorStack.pop() {
                outputStack.push(currentOperator)
            }
        }
        
        let reversedStack: StackList<Character> = .init()
        while !outputStack.isEmpty {
            if let value = outputStack.pop() {
                reversedStack.push(value)
            }
        }
        
        print(reversedStack)
    }
    
}

// MARK: - Helpers
private extension String {
    var stringByRemovingSpecialCharacters: String {
        let allowedCharacterSet = CharacterSet(
            charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz{}[]()/*+-^"
        )
        return components(separatedBy: allowedCharacterSet.inverted).joined()
    }
}
