//
//  SelectionSort.swift
//  Algorithms
//
//  Created by Radu Dan on 15.01.2025.
//

import Foundation

/*
 Time Complexity:
 - Best Case: O(n²) - always needs to traverse the entire array to find minimum
 - Average Case: O(n²) - requires n passes, each pass comparing with n-i elements
 - Worst Case: O(n²) - same as best case, always needs complete traversal

 Space Complexity: O(1) - constant extra space
 - Only uses a single temporary variable for swapping elements
 - In-place sorting algorithm
 - More efficient than bubble sort in terms of memory writes
 */
enum SelectionSort {
    static func execute(array: [Int]) -> [Int] {
        var finalArray = array
        for i in 0 ..< finalArray.count {
            var indexOfMin = i
            for j in (i + 1) ..< finalArray.count {
                if finalArray[indexOfMin] > finalArray[j] {
                    indexOfMin = j
                }
            }
            if indexOfMin != i {
                let temp = finalArray[i]
                finalArray[i] = finalArray[indexOfMin]
                finalArray[indexOfMin] = temp
            }
        }
        return finalArray
    }
}
