//
//  RedBlackTree.swift
//  Algorithms
//
//  Created by Radu Dan on 22.10.2024.
//
import Foundation

class RedBlackTree<T: SignedNumeric & Comparable> {
    var data: T
    var leftChild: RedBlackTree?
    var rightChild: RedBlackTree?
    
    init(data: T, leftChild: RedBlackTree? = nil, rightChild: RedBlackTree? = nil) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
