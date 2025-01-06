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
    
    func deleteInBinarySearchTree(value: T) -> BinaryTreeNode? {
        if value < data {
            leftChild = leftChild?.deleteInBinarySearchTree(value: value)
        } else if value > data {
            rightChild = rightChild?.deleteInBinarySearchTree(value: value)
        } else {
            if leftChild == nil && rightChild == nil {
                return nil
            } else if leftChild == nil {
                return rightChild
            } else if rightChild == nil {
                return leftChild
            } else {
                // Replace with the In-order Predecessor (the largest node in the left subtree).
                // or
                // Replace with the In-order Successor (the smallest node in the right subtree).
                //
                // In our case, we are going to replace it with the smallest node from the right subtree.
                let minRightSubTree = rightChild?.minimumNode
                data = minRightSubTree!.data
                rightChild = rightChild?.deleteInBinarySearchTree(value: minRightSubTree!.data)
            }
        }
        return self
    }
    
    var minimumNode: BinaryTreeNode {
        leftChild?.minimumNode ?? self
    }
    
    var maximumNode: BinaryTreeNode {
        rightChild?.maximumNode ?? self
    }
}
