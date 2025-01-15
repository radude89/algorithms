//
//  BubbleSort.swift
//  Algorithms
//
//  Created by Radu Dan on 15.01.2025.
//

import Foundation

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
