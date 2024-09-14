//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Radu Dan on 14.09.2024.
//
import Foundation

extension BinaryTreeNode {
    func search(value: T) -> BinaryTreeNode? {
        if data == value {
            self
        } else if value < data {
            leftChild?.search(value: value)
        } else if value > data {
            rightChild?.search(value: value)
        } else {
            nil
        }
    }
    
    func insertInBinarySearchTree(value: T) {
        if value < data {
            if let leftChild {
                leftChild.insertInBinarySearchTree(value: value)
            } else {
                leftChild = BinaryTreeNode(data: value)
            }
        } else if value > data {
            if let rightChild {
                rightChild.insertInBinarySearchTree(value: value)
            } else {
                rightChild = BinaryTreeNode(data: value)
            }
        }
    }
}
