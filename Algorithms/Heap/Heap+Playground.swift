//
//  Heap+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2025.
//

import Foundation

enum Heap: Playground {
    static func executeOperations() {
        let maxHeap = MaxHeap(
            elements: [
                70, 50, 40, 45, 35, 39, 16, 10, 9,
            ]
        )
        maxHeap.insert(element: 60)
        print(maxHeap.elements)
    }
}
