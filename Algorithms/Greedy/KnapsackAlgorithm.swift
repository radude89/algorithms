//
//  KnapsackAlgorithm.swift
//  Algorithms
//
//  Created by Radu Dan on 26.05.2025.
//

import Foundation

/**
 * Fractional Knapsack Algorithm - A greedy algorithm for the fractional knapsack problem
 *
 * Time Complexity: O(n log n)
 * - O(n log n) for sorting items by profit-to-weight ratio
 * - O(n) for selecting items
 *
 * Space Complexity: O(1)
 * - Only uses constant extra space (excluding input)
 *
 * The fractional knapsack problem allows taking fractions of items to maximize
 * profit within a weight constraint. The greedy approach works optimally:
 * 1. Calculate profit-to-weight ratio for each item
 * 2. Sort items by ratio in descending order
 * 3. Take items greedily until capacity is reached
 * 4. Take a fraction of the last item if it doesn't fit completely
 *
 * Key properties:
 * - Greedy choice property: local optimal choices lead to global optimum
 * - Optimal substructure: optimal solution contains optimal solutions to subproblems
 * - Unlike 0/1 knapsack, items can be taken fractionally
 */

struct KnapsackObject {
    let object: Int
    let profit: Int
    let weight: Int

    var ratio: Double {
        guard weight > 0 else { return 0 }
        return Double(profit) / Double(weight)
    }
}

enum KnapsackAlgorithm {
    static func calculateMaxProfit(
        objects: [Int],
        profits: [Int], 
        weights: [Int],
        capacity: Int
    ) -> Double {
        guard objects.count == profits.count && profits.count == weights.count else {
            precondition(false, "Arrays must have equal length")
        }
        
        guard capacity > 0 else { return 0 }
        
        let items = objects.enumerated().map { index, element in
            KnapsackObject(
                object: element,
                profit: profits[index],
                weight: weights[index]
            )
        }
        
        let sortedItems = items.sorted { $0.ratio > $1.ratio }
        var remainingCapacity = capacity
        var totalProfit: Double = 0
        
        for item in sortedItems {
            guard remainingCapacity > 0 else { break }
            
            if item.weight <= remainingCapacity {
                // Take the entire item
                totalProfit += Double(item.profit)
                remainingCapacity -= item.weight
            } else {
                // Take fraction of the item
                let fraction = Double(remainingCapacity) / Double(item.weight)
                totalProfit += Double(item.profit) * fraction
                remainingCapacity = 0
            }
        }
        
        return totalProfit
    }
}
