//
//  Queue.swift
//  Algorithms
//
//  Created by Radu Dan on 08.02.2022.
//

import Foundation

struct Queue<T> {
    var items: [T]
    
    init(items: [T] = []) {
        self.items = items
    }
    
    mutating func enqueue(_ item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        items.removeFirst()
    }
    
    var peek: T? {
        items.first
    }
}
