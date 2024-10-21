//
//  AVLTree.swift
//  Algorithms
//
//  Created by Radu Dan on 25.09.2024.
//
import Foundation

class AVLTreeNode<T: SignedNumeric & Comparable> {
    var data: T
    var leftChild: AVLTreeNode?
    var rightChild: AVLTreeNode?
    var height: Int
    
    init(data: T, leftChild: AVLTreeNode? = nil, rightChild: AVLTreeNode? = nil) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.height = 0
    }
    
    func insert(_ value: T) -> AVLTreeNode {
        if value > data {
            if let rightChild {
                self.rightChild = rightChild.insert(value)
            } else {
                rightChild = AVLTreeNode(data: value)
            }
        } else {
            if let leftChild {
                self.leftChild = leftChild.insert(value)
            } else {
                leftChild = AVLTreeNode(data: value)
            }
        }
        updateHeight()

        let balanceFactor = balance
        if balanceFactor > 1, let leftChild, value < leftChild.data {
            return rightRotate()
        } else if balanceFactor < -1, let rightChild, value > rightChild.data {
            return leftRotate()
        } else if balanceFactor < -1, let rightChild, value < rightChild.data {
            // RL
            self.rightChild = rightChild.rightRotate()
            return leftRotate()
        } else if balanceFactor > 1, let leftChild, value > leftChild.data {
            // LR
            self.leftChild = leftChild.leftRotate()
            return rightRotate()
        }
        
        return self
    }
    
    func delete(_ value: T) -> AVLTreeNode? {
        let newTree = deleteNode(value: value)
        return newTree
    }
    
    private func deleteNode(value: T) -> AVLTreeNode? {
        if value < data {
            leftChild = leftChild?.delete(value)
        } else if value > data {
            rightChild = rightChild?.delete(value)
        } else {
            if leftChild == nil && rightChild == nil {
                return nil
            } else if leftChild == nil {
                return rightChild
            } else if rightChild == nil {
                return leftChild
            } else {
                let minRightSubTree = rightChild?.minimumNode
                data = minRightSubTree!.data
                rightChild = rightChild?.delete(minRightSubTree!.data)
            }
        }
        
        updateHeight()
        
        let balanceFactor = balance
        if balanceFactor > 1, let leftChild, value < leftChild.data {
            return rightRotate()
        } else if balanceFactor < -1, let rightChild, value > rightChild.data {
            return leftRotate()
        } else if balanceFactor < -1, let rightChild, value < rightChild.data {
            // RL
            self.rightChild = rightChild.rightRotate()
            return leftRotate()
        } else if balanceFactor > 1, let leftChild, value > leftChild.data {
            // LR
            self.leftChild = leftChild.leftRotate()
            return rightRotate()
        }

        return self
    }
    
    var minimumNode: AVLTreeNode {
        leftChild?.minimumNode ?? self
    }

    func rightRotate() -> AVLTreeNode {
        let newRoot = leftChild!
        leftChild = newRoot.rightChild
        newRoot.rightChild = self
        updateHeight()
        newRoot.updateHeight()
        return newRoot
    }
    
    func leftRotate() -> AVLTreeNode {
        let newRoot = rightChild!
        rightChild = newRoot.leftChild
        newRoot.leftChild = self
        updateHeight()
        newRoot.updateHeight()
        return newRoot
    }
    
    func updateHeight() {
        let leftHeight = leftChild?.height ?? -1
        let rightHeight = rightChild?.height ?? -1
        height = 1 + max(leftHeight, rightHeight)
    }
    
    var balance: Int  {
        let leftHeight = leftChild?.height ?? -1
        let rightHeight = rightChild?.height ?? -1
        return leftHeight - rightHeight
    }
}
