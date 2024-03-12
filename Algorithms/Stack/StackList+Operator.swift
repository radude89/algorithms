//
//  StackList+Operator.swift
//  Algorithms
//
//  Created by Radu Dan on 12.03.2024.
//

import Foundation

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
