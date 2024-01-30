//
//  LinkedList+Archive.swift
//  Algorithms
//
//  Created by Radu Dan on 30.01.2024.
//

import Foundation

extension LinkedList {
    static func runOldExamples() {
        let list = LinkedList<Int>()
        list.head = LinkedList<Int>.Node(1)

        let second = LinkedList<Int>.Node(2)
        let third = LinkedList<Int>.Node(3)

        list.head?.next = second
        second.next = third

        print("Initial list: \(list)")

        // MARK: - Insert

        list.insertAtEnd(data: 10)
        list.insertAtEnd(data: 11)

        list.insertNodeAfter(node: second, data: 500)

        list.insertAtEnd(data: 20)
        list.insertAtEnd(data: 30)

        print("List after inserting nodes: \(list)")

        list.deleteNode(data: 11)
        list.deleteNode(data: 1)
        list.deleteNode(data: 500)
        list.deleteNode(data: 2)
        list.deleteNode(data: 3)
        list.deleteNode(data: 30)
        list.deleteNode(data: 10)

        print("List after deleting nodes: \(list)")

        list.delete()

        print("List after deleting it: \(list)")

        list.insertAtEnd(data: 3)
        list.insertAtEnd(data: 2)
        list.insertAtEnd(data: 1)

        print("New list: \(list)")

        list.delete(at: 1)

        print("List after deleting at index: \(list)")

        let listContainsOne = list.containsNode(havingValue: 1)
        let listContainsThree = list.containsNode(havingValue: 3)
        let listContainsTwo = list.containsNode(havingValue: 2)

        print("List contains element `1`? \(listContainsOne)")
        print("List contains element `3`? \(listContainsThree)")
        print("List contains element `2`? \(listContainsTwo)")

        (0...3).forEach { index in
            if let nodeValue = list.nodeValue(at: index) {
                print("Value at \(index) is \(nodeValue).")
            } else {
                print("Value at \(index) is nil.")
            }
        }

        list.delete()
        (1...5).forEach { list.insertAtEnd(data: $0) }

        let middle = list.middleNodeValue!
        print("For the list \(list), the middle is: \(middle)")
    }
}
