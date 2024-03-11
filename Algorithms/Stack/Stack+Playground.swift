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

extension StackList {
    enum Operator: String {
        case plus = "+"
        case minus = "-"
        case multiply = "*"
        case divide = "/"
        case power = "^"
        
        init?(_ character: Character?) {
            guard let character else { return nil }
            self.init(rawValue: String(character))
        }
        
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
