//
//  MergeSort.swift
//  Algorithms
//
//  Created by Radu Dan on 15.01.2025.
//

import Foundation

/*
 Time Complexity:
 - Best Case: O(n log n) - always divides array in half and merges
 - Average Case: O(n log n) - consistent performance regardless of input
 - Worst Case: O(n log n) - same as best case due to divide-and-conquer approach

 Space Complexity: O(n) - linear extra space
 - Requires additional array of size n for merging
 - Not an in-place sorting algorithm
 - Uses recursion which adds space on call stack (O(log n))
 */
enum MergeSort {
    static func execute(array: [Int]) -> [Int] {
        let size = array.count
        guard size > 1 else { return array }

        let middle = size / 2

        var leftArray = Array(array[0 ..< middle])
        var rightArray = Array(array[middle ..< size])

        leftArray = execute(array: leftArray)
        rightArray = execute(array: rightArray)

        return merge(leftArray, rightArray)
    }

    private static func merge(
        _ left: [Int],
        _ right: [Int]
    ) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var sortedArray: [Int] = []

        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                sortedArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                sortedArray.append(right[rightIndex])
                rightIndex += 1
            }
        }

        while leftIndex < left.count {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        }

        while rightIndex < right.count {
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }

        return sortedArray
    }
}
