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
        let leftLeft = BinaryTreeNode<Int>(data: 4)
        let leftRight = BinaryTreeNode<Int>(data: 5)
        let rightLeft = BinaryTreeNode<Int>(data: 6)
        let rightRight = BinaryTreeNode<Int>(data: 7)
        
        left.leftChild = leftLeft
        left.rightChild = leftRight
        right.leftChild = rightLeft
        right.rightChild = rightRight
        root.leftChild = left
        root.rightChild = right
        
        root.traverseInSpiralUsingStacks()
    }
}

// Formulas
// Min. number of nodes of height `H` = H + 1
// Max. number of nodes in a tree of height `H` = 2^(H+1) - 1
// Max. number of nodes at any level `L` = 2^L
