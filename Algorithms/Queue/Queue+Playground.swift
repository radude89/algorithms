//
//  Queue+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 08.02.2022.
//

import Foundation

extension Queue: Playground {
    static func executeOperations() {
        var queue = Queue<Int>()
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        
        print(queue.dequeue()!)
    }
}
