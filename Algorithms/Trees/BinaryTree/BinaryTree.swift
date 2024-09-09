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
    
    func traverseDepthOrderWithStack() {
        let stack = StackList<BinaryTreeNode<T>>()
        stack.push(self)
        while !stack.isEmpty {
            guard let current = stack.pop() else { return }
            
            print(current.data)
            
            if let right = current.rightChild {
                stack.push(right)
            }
            if let left = current.leftChild {
                stack.push(left)
            }
        }
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
    
    // MARK: - Height
    
    var height: Int {
        if leftChild == nil && rightChild == nil {
            return 1
        }

        let leftHeight = leftChild?.height ?? 0
        let rightHeight = rightChild?.height ?? 0

        return 1 + max(leftHeight, rightHeight)
    }
    
    // MARK: - Size
    
    var size: Int {
        if leftChild == nil && rightChild == nil {
            return 1
        }
        let leftSize = leftChild?.size ?? 0
        let rightSize = rightChild?.size ?? 0
        return 1 + leftSize + rightSize
    }
    
    // MARK: - Spiral traversal
    
    func traverseInSpiralUsingStacks() {
        let stack1 = StackList<BinaryTreeNode>()
        let stack2 = StackList<BinaryTreeNode>()
        
        stack1.push(self)
        
        while !stack1.isEmpty || !stack2.isEmpty {
            while !stack1.isEmpty {
                let current = stack1.pop()
                print(String(describing: current?.data))
                if let right = current?.rightChild {
                    stack2.push(right)
                }
                if let left = current?.leftChild {
                    stack2.push(left)
                }
            }
            
            while !stack2.isEmpty {
                let current = stack2.pop()
                print(String(describing: current?.data))
                if let left = current?.leftChild {
                    stack1.push(left)
                }
                if let right = current?.rightChild {
                    stack1.push(right)
                }
            }
        }
    }
    
    // MARK: - Reverse level order traversal
    
    func reverseLevelOrderTraversal() {
        let stack = StackList<BinaryTreeNode>()
        stack.push(self)
        while let current = stack.peek,
                current.leftChild != nil,
                current.rightChild != nil {
            if let right = current.rightChild {
                stack.push(right)
            }
            if let left = current.leftChild {
                stack.push(left)
            }
        }
        while stack.peek != nil {
            guard let current = stack.pop() else { return }
            print(current.data)
        }
    }
    
    // MARK: - Sum
    
    var sum: Int {
        guard let value = data as? Int else { return -1 }
        
        let leftSum = leftChild?.sum ?? 0
        let rightSum = rightChild?.sum ?? 0
        
        return value + leftSum + rightSum
    }
    
    // MARK: - Min value
    
    var min: Int {
        guard let value = data as? Int else { return -1 }
        
        var minValue = value
        var queue = Queue(items: [self])
        
        while !queue.isEmpty {
            guard let current = queue.dequeue() else { continue }

            if let data =  current.data as? Int, data < minValue {
                minValue = data
            }
            
            if let left = current.leftChild {
                queue.enqueue(left)
            }
            
            if let right = current.rightChild {
                queue.enqueue(right)
            }
        }
        
        return minValue
    }
}
