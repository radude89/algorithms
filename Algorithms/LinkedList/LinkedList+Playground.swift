//
//  LinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

extension LinkedList: Playground {
    private typealias ListInt = LinkedList<Int>
    private typealias NodeInt = ListInt.Node

    static func executeOperations() {
        runInsertAtEndPlayground()
    }
}

// MARK: - Playgrounds
private extension LinkedList {
    static func runInsertAtEndPlayground() {
        let list = ListInt()
        let node = NodeInt(2)
        list.head = NodeInt(1, next: node)
        node.next = NodeInt(3)
        print("Before 👉 \(list)")
        list.insertAtEnd(data: 4)
        print("After 👉 \(list)")
    }

    static func runInsertAfterNodePlayground() {
        let list = ListInt()
        let node = NodeInt(2)
        list.head = NodeInt(1, next: node)
        let anotherNode = NodeInt(3)
        node.next = anotherNode
        print("Before 👉 \(list)")
        list.insertNodeAfter(node: list.head!, data: 5)
        print("After 👉 \(list)")
    }
    
    static func runInsertAtBeginningPlayground() {
        let list = ListInt()
        let node = NodeInt(2)
        list.head = NodeInt(1, next: node)
        print("Before 👉 \(list)")
        list.insertAtBeginning(data: 3)
        print("After 👉 \(list)")
    }
}
