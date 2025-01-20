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

    func delete() {
        guard !elements.isEmpty else { return }

        elements[0] = elements[elements.count - 1]
        elements.removeLast()

        var currentIndex = 0

        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2
            var largestIndex = currentIndex

            if leftChildIndex < elements.count,
               elements[leftChildIndex] > elements[largestIndex] {
                largestIndex = leftChildIndex
            }

            if rightChildIndex < elements.count,
               elements[rightChildIndex] > elements[largestIndex] {
                largestIndex = rightChildIndex
            }

            if largestIndex == currentIndex { break }

            let temp = elements[currentIndex]
            elements[currentIndex] = elements[largestIndex]
            elements[largestIndex] = temp

            currentIndex = largestIndex
        }

    }
}
