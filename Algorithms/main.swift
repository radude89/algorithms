//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

let totalWeight = KnapsackAlgorithm.calculateMaxProfit(
    objects: [1, 2, 3, 4, 5, 6, 7],
    profits: [5, 10, 15, 7, 8, 9, 4],
    weights: [1, 3, 5, 4, 1, 3, 2],
    capacity: 15
)
print(totalWeight)
