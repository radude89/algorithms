//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

let sorted = CountSort.execute(array: [
    2, 1, 1, 0, 2, 5, 4, 0, 2, 8, 7, 7, 9, 2, 0, 1, 9,
])
print(sorted)

let radixSorted = RadixSort.execute(array: [
    432, 8, 530, 90, 88, 231, 11, 45, 677, 199
])
print(radixSorted)
