//
//  BinaryTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 28.08.2024.
//
import Foundation

extension BinaryTreeNode: Playground {
    static func executeOperations() {
        let root = BinaryTreeNode<Int>(data: 10)
        let left = BinaryTreeNode<Int>(data: 11)
        let right = BinaryTreeNode<Int>(data: 9)
        let leftLeft = BinaryTreeNode<Int>(data: 7)
        let leftRight = BinaryTreeNode<Int>(data: 12)
        let rightLeft = BinaryTreeNode<Int>(data: 15)
        let rightRight = BinaryTreeNode<Int>(data: 8)
        
        left.leftChild = leftLeft
        left.rightChild = leftRight
        right.leftChild = rightLeft
        right.rightChild = rightRight
        root.leftChild = left
        root.rightChild = right
        
        root.deleteNonRootNode(key: 11)
    }
}

// Formulas
// Min. number of nodes of height `H` = H + 1
// Max. number of nodes in a tree of height `H` = 2^(H+1) - 1
// Max. number of nodes at any level `L` = 2^L
