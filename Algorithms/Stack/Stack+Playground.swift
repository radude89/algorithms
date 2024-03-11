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
            } else if let currentBracket = Bracket(char) {
                if currentBracket.isOpen {
                    operatorStack.push(char)
                } else {
                    // Pop all characters until we reach the open bracket
                    while !operatorStack.isEmpty {
                        let current = operatorStack.pop()
                        let bracket = Bracket(current)
                        if let bracket, bracket.isOpposite(to: currentBracket) {
                            break
                        } else if bracket == nil, let current {
                            outputStack.push(current)
                        }
                    }
                }
            } else if let currentOperator = Operator(char) {
                let topOperatorFromStackIsBracket = Bracket(operatorStack.peek) != nil
                if operatorStack.isEmpty || topOperatorFromStackIsBracket {
                    operatorStack.push(Character(currentOperator.rawValue))
                } else {
                    // found operator
                    guard var topOperator = Operator(operatorStack.peek) else { return }
                    if currentOperator.precedencePriority <= topOperator.precedencePriority {
                        while currentOperator.precedencePriority <= topOperator.precedencePriority && !operatorStack.isEmpty {
                            operatorStack.pop()
                            outputStack.push(Character(topOperator.rawValue))
                            if !operatorStack.isEmpty {
                                let topOperatorFromStackIsBracket = Bracket(operatorStack.peek) != nil
                                if topOperatorFromStackIsBracket {
                                    break
                                } else {
                                    topOperator = Operator(operatorStack.peek)!
                                }
                            }
                        }
                    }
                    operatorStack.push(Character(currentOperator.rawValue))
                }
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
    enum Bracket: String {
        case openParanthesis = "("
        case closedParanthesis = ")"
        case openBracket = "["
        case closedBracket = "]"
        case openCurlyBrace = "{"
        case closedCurlyBrace = "}"
        
        init?(_ character: Character?) {
            guard let character else { return nil }
            self.init(rawValue: String(character))
        }
        
        var isOpen: Bool {
            return switch self {
            case .openParanthesis, .openBracket, .openCurlyBrace:
                true
            case .closedParanthesis, .closedBracket, .closedCurlyBrace:
                false
            }
        }
        
        func isOpposite(to bracket: Bracket) -> Bool {
            return switch bracket {
            case .openParanthesis:
                self == .closedParanthesis
            case .closedParanthesis:
                self == .openParanthesis
            case .openBracket:
                self == .closedBracket
            case .closedBracket:
                self == .openBracket
            case .openCurlyBrace:
                self == .closedCurlyBrace
            case .closedCurlyBrace:
                self == .openCurlyBrace
            }
        }
    }
    
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
