//
//  CircularLinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 19.01.2022.
//

import Foundation

extension CircularLinkedList: Playground {
    private typealias ListInt = CircularLinkedList<Int>
    private typealias NodeInt = ListInt.Node

    static func executeOperations() {
        runInsertAtBeginningPlayground()
    }
}

private extension CircularLinkedList {
    static func runInsertAtBeginningPlayground() {
        let node = NodeInt(1)
        let anotherNode = NodeInt(2)
        node.next = anotherNode
        anotherNode.next = node
        let list = ListInt(last: anotherNode)
        print("Before 👉 \(list)")
        list.insertAfter(node: node, data: 3)
        print("After 👉 \(list)")
    }
}
