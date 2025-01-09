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
                leftChild?.parent = self
                return leftChild!.fixRedBlackTreeAfterInsertion()
            }
        } else if value > data {
            if let rightChild {
                self.rightChild = rightChild.insert(value: value)
            } else {
                rightChild = RedBlackTreeNode(data: value)
                rightChild?.parent = self
                return rightChild!.fixRedBlackTreeAfterInsertion()
            }
        }

        return self
    }

    private func fixRedBlackTreeAfterInsertion() -> RedBlackTreeNode {
        guard let parent, parent.isRed else {
            isRed = false
            return self
        }

        if siblingOfParent == nil || siblingOfParent?.isRed == false {
            // Do suitable rotation AND recolor
            if self === parent.rightChild && grandparent?.leftChild === parent {
                // LR rotation
                parent.rotateLeft()
            } else if self === parent.leftChild && grandparent?.rightChild === parent {
                // RL rotation
                parent.rotateRight()
            }
            parent.isRed = false
            if let grandparent {
                grandparent.isRed = true
                if isLeftChild {
                    grandparent.rotateRight()
                } else {
                    grandparent.rotateLeft()
                }
            }
        } else if siblingOfParent?.isRed == true {
            parent.isRed = false
            siblingOfParent?.isRed = false
            if let grandparent {
                grandparent.isRed = true
                return grandparent.fixRedBlackTreeAfterInsertion()
            }
        }

        return self
    }

    private var grandparent: RedBlackTreeNode? {
        parent?.parent
    }

    private var siblingOfParent: RedBlackTreeNode? {
        guard let grandparent else {
            return nil
        }

        if grandparent.leftChild === parent {
            return grandparent.rightChild
        }

        if grandparent.rightChild === parent {
            return grandparent.leftChild
        }

        return nil
    }

    private var isLeftChild: Bool {
        parent?.leftChild === self
    }
}

// MARK: - Rotations

private extension RedBlackTreeNode {
    @discardableResult
    func rotateLeft() -> RedBlackTreeNode {
        guard let newRoot = rightChild else { return self }

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

        return newRoot
    }

    @discardableResult
    func rotateRight() -> RedBlackTreeNode {
        guard let newRoot = leftChild else { return self }

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

        return newRoot
    }
}
