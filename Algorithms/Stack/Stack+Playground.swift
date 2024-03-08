//
//  StackList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

extension StackList: Playground {
    static func executeOperations() {
        infixToPostfix()
    }

    private static func infixToPostfix() {
        let input = "A+B-C*D/E^F+G*H-I".stringByRemovingSpecialCharacters
        let outputStack: StackList<Character> = .init()
        let operatorStack: StackList<Operator> = .init()
        
        for char in input {
            if char.isLetter { // found operand
                outputStack.push(char)
            } else if let currentOperator = Operator(rawValue: String(char)) {
                // found operator
                if operatorStack.isEmpty {
                    operatorStack.push(currentOperator)
                } else {
                    var topOperator = operatorStack.peek!
                    if currentOperator.precedencePriority <= topOperator.precedencePriority {
                        while currentOperator.precedencePriority <= topOperator.precedencePriority && !operatorStack.isEmpty {
                            operatorStack.pop()
                            outputStack.push(Character(topOperator.rawValue))
                            if !operatorStack.isEmpty {
                                topOperator = operatorStack.peek!
                            }
                        }
                    }
                    operatorStack.push(currentOperator)
                }
            }
        }
        while !operatorStack.isEmpty {
            let currentOperator = operatorStack.pop()
            if let operatorAsString = currentOperator?.rawValue {
                outputStack.push(Character(operatorAsString))
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

private extension StackList {
    enum Bracket: String {
        case openParanthesis = "("
        case closedParanthesis = ")"
        case openBracket = "["
        case closedBracket = "]"
        case openCurlyBrace = "{"
        case closedCurlyBrace = "}"
    }
    
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
        case power = "^"
        
        var precedencePriority: Int {
            return switch self {
            case .plus, .minus:
                1
            case .multiply, .divide:
                2
            case .power:
                3
            }
        }
        
        var isLeftAssociativity: Bool {
            return switch self {
            case .power:
                false
            default:
                true
            }
        }
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
