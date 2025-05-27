//
//  RadixSort.swift
//  Algorithms
//
//  Created by Radu Dan on 26.05.2025.
//

import Foundation

/**
 * Radix Sort - A non-comparative integer sorting algorithm
 *
 * Time Complexity: O(d * (n + k))
 * - d = number of digits in the maximum number
 * - n = number of elements in the array
 * - k = range of input (0-9 for decimal digits)
 * - In practice, often considered O(n) when d is constant
 *
 * Space Complexity: O(n + k)
 * - O(n) for the output array
 * - O(k) for the counting array (10 for decimal digits)
 *
 * Radix sort works by sorting numbers digit by digit, starting from the least
 * significant digit to the most significant digit. It uses a stable sorting
 * algorithm (counting sort) as a subroutine to sort the array based on each digit.
 *
 * Key properties:
 * - Stable: maintains relative order of equal elements
 * - Non-comparative: doesn't compare elements directly
 * - Works well for integers with a fixed number of digits
 */
enum RadixSort {
    static func execute(array: [Int]) -> [Int] {
        guard let max = array.max() else {
            return array
        }

        var result = array
        var digitPosition = 1

        while max / digitPosition > 0 {
            result = countSort(array: result, digitPosition: digitPosition)
            digitPosition *= 10
        }

        return result
    }

    private static let maxNumberOfDigits = 10 // 0...9

    private static func countSort(array: [Int], digitPosition: Int) -> [Int] {
        var countArray = Array(repeating: 0, count: maxNumberOfDigits)
        let numberOfElements = array.count
        var newArray = Array(repeating: 0, count: numberOfElements)

        for i in 0 ..< numberOfElements {
            let digit = (array[i] / digitPosition) % 10
            countArray[digit] += 1
        }

        for i in 1..<maxNumberOfDigits {
            countArray[i] += countArray[i - 1]
        }

        for i in stride(from: numberOfElements - 1, through: 0, by: -1) {
            let index = (array[i] / digitPosition) % 10
            countArray[index] -= 1
            let newIndex = countArray[index]
            newArray[newIndex] = array[i]
        }

        return newArray
    }
}
