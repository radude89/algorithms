//
//  DynamicProgramming.swift
//  Algorithms
//
//  Created by Radu Dan on 09.07.2025.
//

import Foundation

enum DynamicProgramming: Playground {
    private static var calls = 0
    static func executeOperations() {
        let n = 5
        var memo = Array(repeating: -1, count: n + 1)
        memo[0] = 0
        memo[1] = 1
        print("Fibonacci example: \(calculateFibonacci(n, memo: &memo))")
        print("Number of function calls: \(calls)")
    }
}

extension DynamicProgramming {
    static func calculateFibonacci(_ n: Int, memo: inout [Int]) -> Int {
        calls += 1
        guard n >= 0 else { return -1 }
        
        if memo[n] != -1 { return memo[n] }
        
        let left = memo[n - 1] != -1 ? memo[n - 1] : calculateFibonacci(n - 1, memo: &memo)
        let right = memo[n - 2] != -1 ? memo[n - 2] : calculateFibonacci(n - 2, memo: &memo)
        let sum = left + right
        memo[n] = sum
        
        return sum
    }
}
