//
//  CircularDoublyLinkedList+Delete.swift
//  Algorithms
//
//  Created by Radu Dan on 09.02.2024.
//

import Foundation

protocol CircularDoublyLinkedListDeletable {
    associatedtype T
    
    func delete(node: CircularDoublyLinkedList<T>.Node)
}

extension CircularDoublyLinkedList: CircularDoublyLinkedListDeletable {
    func delete(node: CircularDoublyLinkedList<T>.Node) {
        guard head != nil else {
            return
        }
        
        if head === node && head?.next === head {
            head = nil
            return
        }
        
        node.prev?.next = node.next
        node.next?.prev = node.prev
        if node === head {
            head = head?.next
        }
    }
}
