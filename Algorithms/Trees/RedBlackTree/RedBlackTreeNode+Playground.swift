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
        let node = Node(data: 2)
        node.insert(value: 3)

    }
}
