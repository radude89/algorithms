//
//  RedBlackTree.swift
//  Algorithms
//
//  Created by Radu Dan on 22.10.2024.
//
import Foundation

class RedBlackTreeNode<T: SignedNumeric & Comparable> {
    var data: T
    var leftChild: RedBlackTreeNode?
    var rightChild: RedBlackTreeNode?

    init(
        data: T,
        leftChild: RedBlackTreeNode? = nil,
        rightChild: RedBlackTreeNode? = nil
    ) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

extension RedBlackTreeNode {
    func insert(value: T) {
        if value < data {
            if let leftChild {
                leftChild.insert(value: value)
            } else {
                leftChild = RedBlackTreeNode(data: value)
            }
        } else if value > data {
            if let rightChild {
                rightChild.insert(value: value)
            } else {
                rightChild = RedBlackTreeNode(data: value)
            }
        }
    }
}
