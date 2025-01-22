//
//  CircularDoublyLinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 09.02.2024.
//

import Foundation

extension CircularDoublyLinkedList: Playground {
    private typealias ListInt = CircularDoublyLinkedList<Int>
    private typealias NodeInt = ListInt.Node

    static func executeOperations() {
        runDeletePlayground()
    }
}

private extension CircularDoublyLinkedList {
    static func runInsertAtBeginningPlayground() {
        let list = ListInt()
        print("Before 👉 \(list)")
        list.insertAtBeginning(3)
        list.insertAtBeginning(2)
        list.insertAtBeginning(1)
        print("After 👉 \(list)")
    }
    
    static func runAppendPlayground() {
        let list = ListInt()
        print("Before 👉 \(list)")
        list.append(1)
        list.append(2)
        list.append(3)
        list.insertAtBeginning(0)
        print("After 👉 \(list)")
    }
    
    static func runDeletePlayground() {
        let node = NodeInt(2)
        node.next = node
        node.prev = node
        let list = ListInt(head: node)
        list.append(1)
        print("Before 👉 \(list)")
        list.delete(node: node)
        print("After 👉 \(list)")
        
    }
}
