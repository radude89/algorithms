//
//  BinaryTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 28.08.2024.
//
import Foundation

extension BinaryTreeNode: Playground {
    private typealias Node = BinaryTreeNode<Int>
    static func executeOperations() {
        let root = Node(data: 3)
        let left = Node(data: 11)
        let right = Node(data: 4)
        let leftLeft = Node(data: 4)
        let leftRight = Node(data: 2)
        let rightRight = Node(data: 1)
        
        root.leftChild = left
        left.leftChild = leftLeft
        left.rightChild = leftRight
        root.rightChild = right
        right.rightChild = rightRight
        
        print(root.sum())
    }
}

// Formulas
// Min. number of nodes of height `H` = H + 1
// Max. number of nodes in a tree of height `H` = 2^(H+1) - 1
// Max. number of nodes at any level `L` = 2^L
