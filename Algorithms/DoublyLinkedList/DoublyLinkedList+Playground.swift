//
//  DoublyLinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

extension DoublyLinkedList: Playground {
    private typealias ListInt = DoublyLinkedList<Int>
    private typealias NodeInt = ListInt.Node

    static func executeOperations() {
        runInsertAtEndPlayground()
    }
}

private extension DoublyLinkedList {
    static func runInsertAtFrontPlayground() {
        let list = ListInt()
        print("Before 👉 \(list)")
        list.insertAtFront(data: 1)
        print("After 👉 \(list)")
    }
    
    static func runInsertAfterPlayground() {
        let head = NodeInt(1)
        let list = ListInt(head: head)
        
        let node = NodeInt(2)
        head.next = node
        node.prev = head
        node.next = nil
        print("Before 👉 \(list)")
        list.insert(after: head, data: 3)
        print("After 👉 \(list)")
    }
    
    static func runInsertBeforePlayground() {
        let head = NodeInt(1)
        let list = ListInt(head: head)
        
        let node = NodeInt(2)
        head.next = node
        node.prev = head
        node.next = nil
        print("Before 👉 \(list)")
        list.insert(before: node, data: 3)
        print("After 👉 \(list)")
    }
    
    static func runInsertAtEndPlayground() {
        let head = NodeInt(1)
        let list = ListInt()
        list.insert(after: head, data: 2)
        list.insertAtEnd(data: 3)
        print("Before 👉 \(list)")
    }
}
