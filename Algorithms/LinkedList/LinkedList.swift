//
//  LinkedList.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

final class LinkedList<T> {
    
    var head: Node?
    
    init(head: Node? = nil) {
        self.head = head
    }
    
}

extension LinkedList {
    final class Node {
        let data: T
        var next: Node?
        
        init(_ data: T, next: Node? = nil) {
            self.data = data
            self.next = next
        }
    }
}

extension LinkedList: CustomStringConvertible {
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
        
        return "[\(listOutput)] size: \(length)"
    }
}
