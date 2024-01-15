//
//  BinaryTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 11.02.2022.
//

import Foundation

extension BinaryTree: Playground {
    static func executeOperations() {
        let left = BinaryTree<Int>.node(.empty, 1, .empty)
        let right = BinaryTree<Int>.node(.empty, 3, .empty)
        let tree = BinaryTree<Int>.node(left, 2, right)
        
        tree.traverseInOrder { print("\($0)") }
        print("--")
        tree.traversePreOrder { print("\($0)") }
        print("--")
        tree.traversePostOrder { print("\($0)") }
    }
}
