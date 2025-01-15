//
//  SelectionSort.swift
//  Algorithms
//
//  Created by Radu Dan on 15.01.2025.
//

import Foundation

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
