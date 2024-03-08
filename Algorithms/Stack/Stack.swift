//
//  Stack.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

protocol Stack {
    associatedtype T
    
    var peek: T? { get }
    var isEmpty: Bool { get }
    
    func push(_ data: T)
    func pop() -> T?
}
