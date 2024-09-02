//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Radu Dan on 28.08.2024.
//

class BinaryTreeNode<T: Equatable> {
    var data: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(
        data: T,
        leftChild: BinaryTreeNode? = nil,
        rightChild: BinaryTreeNode? = nil
    ) {
        self.data = data
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
    // MARK: - DFS
    
    func traversePreorder() {
        print(data)
        leftChild?.traversePreorder()
        rightChild?.traversePreorder()
    }
    
    func traverseInorder() {
        leftChild?.traversePreorder()
        print(data)
        rightChild?.traversePreorder()
    }
    
    func traversePostorder() {
        leftChild?.traversePreorder()
        rightChild?.traversePreorder()
        print(data)
    }
    
    // MARK: - BFS
    
    func bfs() {
        var queue = Queue<BinaryTreeNode>()
        queue.enqueue(self)
        
        while !queue.items.isEmpty {
            guard let current = queue.dequeue() else { return }
            print("\(String(describing: current.data))")
            if let left = current.leftChild {
                queue.enqueue(left)
            }
            if let right = current.rightChild {
                queue.enqueue(right)
            }
        }
    }
    
    // MARK: - Insert
    
    func insert(node: BinaryTreeNode) {
        var queue = Queue<BinaryTreeNode>()
        queue.enqueue(self)
        
        while !queue.items.isEmpty {
            guard let current = queue.dequeue() else { return }
            if current.leftChild == nil {
                current.leftChild = node
                break
            } else {
                queue.enqueue(current.leftChild!)
            }
            
            if current.rightChild == nil {
                current.rightChild = node
                break
            } else {
                queue.enqueue(current.rightChild!)
            }
        }
    }
    
    // MARK: - Delete
    
    func deleteNonRootNode(key: T) {
        var queue: Queue<BinaryTreeNode> = .init(items: [self])
        
        var nodeToDelete: BinaryTreeNode<T>?
        var lastNode: BinaryTreeNode<T>?
        var parentOfLastNode: BinaryTreeNode<T>?
        
        while !queue.isEmpty {
            guard let current = queue.dequeue() else { return }
            if current.data == key {
                nodeToDelete = current
            }
            if let left = current.leftChild {
                parentOfLastNode = current
                lastNode = left
                queue.enqueue(left)
            }
            if let right = current.rightChild {
                parentOfLastNode = current
                lastNode = right
                queue.enqueue(right)
            }
        }
        
        if let lastNode {
            nodeToDelete?.data = lastNode.data
        }
        
        if let parent = parentOfLastNode {
            if parent.rightChild === lastNode {
                parent.rightChild = nil
            } else if parent.leftChild === lastNode {
                parent.leftChild = nil
            }
        }
        
        bfs()
    }
    
    var height: Int {
        if leftChild == nil && rightChild == nil {
            return 1
        }

        let leftHeight = leftChild?.height ?? 0
        let rightHeight = rightChild?.height ?? 0

        return 1 + max(leftHeight, rightHeight)
    }
}
