//
//  BTree.swift
//  Algorithms
//
//  Created by Radu Dan on 09.04.2025.
//

import Foundation

final class BTree {
    private let order: Int
    private var root: Node

    init(order: Int) {
        self.order = order
        root = Node(elements: [])
    }

    func insert(_ value: Int) {
        guard root.canInsert(order: order) else {
            insertAndSplit(value: value)
            return
        }

        guard !root.isEmpty, let last = root.lastElement else {
            root.insert(value)
            return
        }

        if value > last {
            root.right?.insert(value)
        } else {
            root.left?.insert(value)
        }
    }

    private func insertAndSplit(value: Int) {
        root.insert(value)
        let middle = root.findMiddleElement()
        let newRoot = Node(elements: [middle])
        let left = Node(elements: root.findElementsBeforeMiddleElement())
        let right = Node(elements: root.findElementsAfterMiddleElement())
        newRoot.left = left
        newRoot.right = right
        root = newRoot
    }
}

private extension BTree {
    final class Node {
        private var elements: [Int]

        var left: Node?
        var right: Node?

        init(elements: [Int]) {
            self.elements = elements
        }

        var isEmpty: Bool {
            elements.isEmpty
        }

        var lastElement: Int? {
            elements.last
        }

        private var middleIndex: Int {
            max(0, elements.count / 2 - 1)
        }

        func canInsert(order: Int) -> Bool {
            elements.count < order - 1
        }

        func insert(_ value: Int) {
            elements.append(value)
            elements.sort()
        }

        func findMiddleElement() -> Int {
            elements[middleIndex]
        }

        func findElementsBeforeMiddleElement() -> [Int] {
            Array(elements[0..<middleIndex])
        }

        func findElementsAfterMiddleElement() -> [Int] {
            Array(elements[middleIndex + 1 ..< elements.count])
        }
    }
}
