//
//  CircularDoublyLinkedList.swift
//  Algorithms
//
//  Created by Radu Dan on 09.02.2024.
//

import Foundation

final class CircularDoublyLinkedList<T> {
    
    var head: Node?
    
    init(head: Node? = nil) {
        self.head = head
    }
    
}

extension CircularDoublyLinkedList {
    final class Node {
        let data: T
        var next: Node?
        var prev: Node?
        
        init(_ data: T, next: Node? = nil, prev: Node? = nil) {
            self.data = data
            self.next = next
            self.prev = prev
        }
    }
}

extension CircularDoublyLinkedList: CustomStringConvertible {
    var description: String {
        guard head != nil else {
            return "[]"
        }
        
        var output = ""
        var current = head
        repeat {
            if let data = current?.data {
                output += "\(data)" + ", "
            }
            current = current?.next
        } while current !== head
        
        let listOutput = String(output.dropLast(2))
        return "[\(listOutput)]"
    }
}
