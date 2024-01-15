//
//  CircularLinkedList.swift
//  Algorithms
//
//  Created by Radu Dan on 19.01.2022.
//

import Foundation

final class CircularLinkedList<T> {
    
    var last: Node<T>?
    
    init(last: Node<T>? = nil) {
        self.last = last
    }
    
}

extension CircularLinkedList {
    final class Node<T> {
        let data: T
        var next: Node?
        
        init(_ data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
}

extension CircularLinkedList: CustomStringConvertible {
    var description: String {
        var output = ""
        var node = last
        
        while node?.next !== last {
            node = node?.next
            if let data = node?.data {
                output += "\(data)" + ", "
            }
        }
        
        if let data = last?.data {
            output += "\(data)" + ", "
        }
        
        let listOutput = String(output.dropLast(2))
        
        return "[\(listOutput)]"
    }
}
