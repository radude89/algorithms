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
    var height: Int
    var isRed: Bool
    var parent: RedBlackTreeNode?

    init(
        data: T,
        leftChild: RedBlackTreeNode? = nil,
        rightChild: RedBlackTreeNode? = nil
    ) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
        height = 0
        isRed = true
        parent = nil
    }
}

extension RedBlackTreeNode {
    func insert(value: T) -> RedBlackTreeNode {
        if value < data {
            if let leftChild {
                self.leftChild = leftChild.insert(value: value)
            } else {
                leftChild = RedBlackTreeNode(data: value)
            }
        } else if value > data {
            if let rightChild {
                self.rightChild = rightChild.insert(value: value)
            } else {
                rightChild = RedBlackTreeNode(data: value)
            }
        }

        updateHeight()
        return fixRedBlackProperties(self)
    }

    private func updateHeight() {
        let leftHeight = leftChild?.height ?? -1
        let rightHeight = rightChild?.height ?? -1
        height = 1 + max(leftHeight, rightHeight)
    }

    private func fixRedBlackProperties(_ node: RedBlackTreeNode) -> RedBlackTreeNode {
        // Case 1: Root node should be black
        if parent == nil {
            isRed = false
            return self
        }

        // Case 2: If parent is black, tree is valid
        if !parent!.isRed {
            return self
        }

        // Case 3: If uncle is red, recolor parent, uncle, and grandparent
        let uncle = uncle
        let grandparent = parent?.parent

        if let uncle, uncle.isRed {
            parent?.isRed = false
            uncle.isRed = false
            grandparent?.isRed = true
            return grandparent?.fixRedBlackProperties(grandparent!) ?? self
        }

        // Case 4: If uncle is black and node is inner child
        var newNode = self
        if let grandparent = grandparent {
            if !isLeftChild && parent?.isLeftChild == true {
                parent?.rotateLeft()
                newNode = leftChild!
            } else if isLeftChild && parent?.isLeftChild == false {
                parent?.rotateRight()
                newNode = rightChild!
            }

            // Case 5: If uncle is black and node is outer child
            newNode.handleOuterChild(grandparent)
        }

        return self
    }

    private var uncle: RedBlackTreeNode? {
        parent?.parent?.leftChild === parent ? parent?.parent?.rightChild : parent?.parent?.leftChild
    }

    private var isLeftChild: Bool {
        parent?.leftChild === self
    }

    private func handleOuterChild(_ grandparent: RedBlackTreeNode) {
        parent?.isRed = false
        grandparent.isRed = true

        if isLeftChild {
            grandparent.rotateRight()
        } else {
            grandparent.rotateLeft()
        }
    }
}

// MARK: - Rotations

private extension RedBlackTreeNode {
    @discardableResult
    func rotateLeft() -> RedBlackTreeNode {
        let newRoot = rightChild!
        rightChild = newRoot.leftChild
        rightChild?.parent = self
        newRoot.leftChild = self
        newRoot.parent = parent
        parent = newRoot

        if let newRootParent = newRoot.parent {
            if newRootParent.leftChild === self {
                newRootParent.leftChild = newRoot
            } else {
                newRootParent.rightChild = newRoot
            }
        }

        updateHeight()
        newRoot.updateHeight()
        return newRoot
    }

    @discardableResult
    func rotateRight() -> RedBlackTreeNode {
        let newRoot = leftChild!
        leftChild = newRoot.rightChild
        leftChild?.parent = self
        newRoot.rightChild = self
        newRoot.parent = parent
        parent = newRoot

        if let newRootParent = newRoot.parent {
            if newRootParent.leftChild === self {
                newRootParent.leftChild = newRoot
            } else {
                newRootParent.rightChild = newRoot
            }
        }

        updateHeight()
        newRoot.updateHeight()
        return newRoot
    }
}
