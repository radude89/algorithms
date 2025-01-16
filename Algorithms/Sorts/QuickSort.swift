//
//  QuickSort.swift
//  Algorithms
//
//  Created by Radu Dan on 16.01.2025.
//

import Foundation

/// QuickSort implementation
/// Time Complexity:
/// - Best case: O(n log n) when the pivot always divides the array into roughly equal halves
/// - Average case: O(n log n)
/// - Worst case: O(n²) when the array is already sorted and we always pick the smallest/largest element as pivot
///
/// Space Complexity:
/// - O(log n) due to the recursive call stack in the best and average cases
/// - O(n) in the worst case when the recursion depth goes up to n levels
enum QuickSort {
    static func execute(array: [Int]) -> [Int] {
        var arrayCopy = array
        quickSort(
            array: &arrayCopy,
            start: 0,
            end: array.count - 1
        )
        return arrayCopy
    }

    private static func quickSort(
        array: inout [Int],
        start: Int,
        end: Int
    ) {
        guard start < end else { return }

        let pivot = partition(
            array: &array,
            start: start,
            end: end
        )

        quickSort(
            array: &array,
            start: start,
            end: pivot - 1
        )
        quickSort(
            array: &array,
            start: pivot + 1,
            end: end
        )
    }

    private static func partition(
        array: inout [Int],
        start: Int,
        end: Int
    ) -> Int {
        let pivot = array[end]
        var i = start - 1

        for j in start ..< end {
            if array[j] < pivot {
                i += 1
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
        i += 1
        let temp = array[i]
        array[i] = array[end]
        array[end] = temp

        return i
    }
}
