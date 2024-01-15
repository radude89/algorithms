//
//  DoublyLinkedList+Reverse.swift
//  Algorithms
//
//  Created by Radu Dan on 17.01.2022.
//

import Foundation

protocol DoublyLinkedListReversable {
    func reverse()
}

extension DoublyLinkedList: DoublyLinkedListReversable {
    func reverse() {
        guard head != nil else {
            return
        }
        
        var currentNode = head
        var updatedNode: Node?
        
        while currentNode != nil {
            updatedNode = currentNode?.prev
            currentNode?.prev = currentNode?.next
            currentNode?.next = updatedNode
            currentNode = currentNode?.prev
        }
        
        if updatedNode != nil {
            head = updatedNode?.prev
        }
    }
}
