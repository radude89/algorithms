//
//  CountSort.swift
//  Algorithms
//
//  Created by Radu Dan on 26.05.2025.
//

import Foundation

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
