//
//  Heap.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2025.
//

///
/// Two types of heap ⬇️
///
/// **1. Max Heap**
/// - A[parent(i)] >= A[i], except the root node
/// - for every node i, the value of node is less than or equal to its parent value.
///
/// **2. Min Heap**
/// - A[parent(i)] <= A[i], except the root node
/// - for every node i, the value of node is greater than or equal to its parent value
final class MaxHeap {
    var elements: [Int]

    init(elements: [Int] = []) {
        self.elements = elements
    }

    func insert(element: Int) {
        elements.append(element)
        var currentIndex = elements.count - 1
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2

            if elements[parentIndex] >= elements[currentIndex] {
                break
            }

            let temp = elements[currentIndex]
            elements[currentIndex] = elements[parentIndex]
            elements[parentIndex] = temp

            currentIndex = parentIndex
        }
    }
}
