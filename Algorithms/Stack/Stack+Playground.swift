//
//  StackList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

extension StackList: Playground {
    static func executeOperations() {
        let stack: StackList<Int> = StackList<Int>()
        stack.push(data: 1)
        stack.push(data: 2)
        stack.push(data: 3)
        stack.popN()
        stack.popN()
        print(stack)
    }
}
