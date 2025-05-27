//
//  CountSort.swift
//  Algorithms
//
//  Created by Radu Dan on 26.05.2025.
//

import Foundation

/**
 * Counting Sort - A non-comparative integer sorting algorithm
 *
 * Time Complexity: O(n + k)
 * - n = number of elements in the array
 * - k = range of input values (0 to max value)
 * - Linear time when k is not significantly larger than n
 *
 * Space Complexity: O(k)
 * - O(k) for the counting array to store frequencies
 * - O(n) for the output array (not counted as extra space)
 *
 * Counting sort works by counting the occurrences of each distinct element,
 * then using arithmetic to determine the positions of each element in the
 * output sequence. It's particularly efficient when the range of potential
 * items (k) is not significantly greater than the number of items (n).
 *
 * Key properties:
 * - Stable: maintains relative order of equal elements
 * - Non-comparative: doesn't compare elements directly
 * - Only works with non-negative integers (or easily mappable to non-negative integers)
 * - Optimal for small range of values relative to array size
 */
enum CountSort {
    static func execute(array: [Int], key: Int = 9) -> [Int] {
        let numberOfElements = array.count
        precondition(
            key < (numberOfElements * numberOfElements),
            "Invalid value for the key. It should be less than the square of the number of elements in the array."
        )
        precondition(
            array.allSatisfy { $0 >= 0 },
            "All elements in the array should be positive integers."
        )

        var countArray = Array(repeating: 0, count: key + 1)

        for i in 0..<numberOfElements {
            countArray[array[i]] += 1
        }

        for i in 1...key {
            countArray[i] += countArray[i - 1]
        }

        var newArray: [Int] = array
        for i in stride(from: numberOfElements - 1, through: 0, by: -1) {
            let currentElement = array[i]
            countArray[currentElement] -= 1
            let newIndex = countArray[currentElement]
            newArray[newIndex] = currentElement
        }

        return newArray
    }
}
