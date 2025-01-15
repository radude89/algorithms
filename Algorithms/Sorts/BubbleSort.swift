//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Radu Dan on 15.01.2025.
//

import Foundation

/*
 Time Complexity:
 - Best Case (Already sorted array): O(n) - only one pass through the array is needed
 - Average Case: O(n²) - requires comparing each element with the rest, resulting in n * (n-1)/2 comparisons
 - Worst Case (Reverse sorted array): O(n²) - maximum number of swaps needed

 Space Complexity: O(1) - constant extra space
 - Only uses a single temporary variable for swapping elements
 - In-place sorting algorithm
 - No additional data structures required
 */
enum BubbleSort {
    static func execute(array: [Int]) -> [Int] {
        guard array.count > 0 else { return [] }

        var finalArray: [Int] = array
        for i in 0 ..< finalArray.count {
            for j in 0 ..< (finalArray.count - i - 1) {
                if finalArray[j] > finalArray[j + 1] {
                    let temp = finalArray[j]
                    finalArray[j] = finalArray[j + 1]
                    finalArray[j + 1] = temp
                }
            }
        }
        return finalArray
    }
}
