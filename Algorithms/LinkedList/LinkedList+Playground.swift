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
        runFindNodeFromTheEnd()
    }
}

private extension LinkedList {
    // MARK: - Find

    static func runFindNodeFromTheEnd() {
        let nodeValueToFind = 5
        let list: ListInt = [1, 2, 3, 4, 5]
        print("Find node \(nodeValueToFind) from the end of 👉 \(list)")
        let node = list.findNodeFromTheEnd(nodeValueToFind)
        print("Node: \(node?.data ?? -1)")
    }
    
    // MARK: - Delete
    
    static func runDeleteAtIndexPlayground() {
        let list = ListInt()
        let anotherNode = NodeInt(3)
        let node = NodeInt(2, next: anotherNode)
        list.head = NodeInt(1, next: node)
        print("Before 👉 \(list)")
        list.delete(at: 1)
        print("After 👉 \(list)")
    }
    
    static func runDeleteNodeAtEndPlayground() {
        let list = ListInt()
        let anotherNode = NodeInt(3)
        let node = NodeInt(2, next: anotherNode)
        list.head = NodeInt(1, next: node)
        print("Before 👉 \(list)")
        list.deleteNodeAtEnd()
        print("After 👉 \(list)")
    }

    static func runDeleteNodeAtBeginningPlayground() {
        let list = ListInt()
        let node = NodeInt(2)
        list.head = NodeInt(1, next: node)
        print("Before 👉 \(list)")
        list.deleteNodeAtBeginning()
        print("After 👉 \(list)")
    }
    
    // MARK: - Insert

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
