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
        let root = Node(data: 8)
        let left = Node(data: 3)
        let right = Node(data: 10)
        let rightRight = Node(data: 14)
        let rightRightRight = Node(data: 13)
        let leftLeft = Node(data: 1)
        let leftRight = Node(data: 6)
        let leftRightLeft = Node(data: 4)
        let leftRightRight = Node(data: 7)
        
        root.leftChild = left
        root.rightChild = right
        left.leftChild = leftLeft
        left.rightChild = leftRight
        leftRight.leftChild = leftRightLeft
        leftRight.rightChild = leftRightRight
        right.rightChild = rightRight
        rightRight.rightChild = rightRightRight
        
        root.insertInBinarySearchTree(value: 2)
        
        root.bfs()
    }
}
