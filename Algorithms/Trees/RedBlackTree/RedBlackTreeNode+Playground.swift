//
//  RedBlackTreeNode+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 06.01.2025.
//
import Foundation

extension RedBlackTreeNode: Playground {
    private typealias Node = RedBlackTreeNode<Int>
    static func executeOperations() {
        print("Hello RBT")
        var node = Node(data: 20)
        node = node.insert(value: 18)
        node = node.insert(value: 21)
        node = node.insert(value: 19)

    }
}


