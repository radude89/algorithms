//
//  BinaryTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 28.08.2024.
//
import Foundation

extension BinaryTreeNode: Playground {
    static func executeOperations() {
        let root = BinaryTreeNode<Int>(data: 1)
        let left = BinaryTreeNode<Int>(data: 2)
        let right = BinaryTreeNode<Int>(data: 3)
        let rightLeft = BinaryTreeNode<Int>(data: 4)
        
        root.leftChild = left
        right.leftChild = rightLeft
        root.rightChild = right
        
        print(root.height)
    }
}

// Formulas
// Min. number of nodes of height `H` = H + 1
// Max. number of nodes in a tree of height `H` = 2^(H+1) - 1
// Max. number of nodes at any level `L` = 2^L
