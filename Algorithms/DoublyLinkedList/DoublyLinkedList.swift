//
//  DoublyLinkedList.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

final class DoublyLinkedList<T> {
    
    var head: Node<T>?
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
}

extension DoublyLinkedList {
    final class Node<T> {
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

extension DoublyLinkedList: CustomStringConvertible {
    var description: String {
        var output = ""
        var node = head
        
        while node != nil {
            if let data = node?.data {
                output += "\(data)" + ", "
            }
            
            node = node?.next
        }
        
        let listOutput = String(output.dropLast(2))
        
        return "[\(listOutput)]"
    }
}
