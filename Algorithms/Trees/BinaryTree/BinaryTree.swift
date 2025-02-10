//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Radu Dan on 28.08.2024.
//

class BinaryTreeNode<T: Comparable> {
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
        
        while !queue.isEmpty {
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
        
        while !queue.isEmpty {
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

    func insert(data: T) {
        var queue = [self]
        let newNode = BinaryTreeNode(data: data)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if node.leftChild == nil {
                node.leftChild = newNode
                return
            } else if node.rightChild == nil {
                node.rightChild = newNode
                return
            } else {
                queue.append(node.leftChild!)
                queue.append(node.rightChild!)
            }
        }
    }

    // MARK: - Delete
    
    func delete(key: T) {
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
    
    var min: T {
        var minValue = data
        var queue = Queue(items: [self])
        
        while !queue.isEmpty {
            guard let current = queue.dequeue() else { continue }
            
            if current.data < minValue {
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
    
    // MARK: - Max path sum
    
    func maxPathSum() -> T where T: Numeric {
        var queue = Queue<BinaryTreeNode>()
        queue.enqueue(self)
        
        var leftSum = data
        var rightSum = data
        
        while !queue.isEmpty {
            guard let current = queue.dequeue() else { continue }
            
            if let left = current.leftChild {
                leftSum = left.data + leftSum
                queue.enqueue(left)
            }
            if let right = current.rightChild {
                rightSum += right.data
                queue.enqueue(right)
            }
        }
        
        return max(leftSum, rightSum)
    }
}

// MARK: - Max Depth / Height

extension BinaryTreeNode {
    var maxDepth: Int {
        let left = 1 + (leftChild?.maxDepth ?? -1)
        let right = 1 + (rightChild?.maxDepth ?? -1)
        return max(left, right)
    }
}

// MARK: - Level of nodeb given the key

extension BinaryTreeNode {
    func level(for key: T) -> Int {
        var level = 0
        if data == key {
            return level
        }

        if let leftChild {
            level += 1
            let leftChildLevel = self.level(
                for: key,
                node: leftChild,
                level: level
            )
            if leftChildLevel != -1 {
                return leftChildLevel
            }
        } else if let rightChild {
            level += 1
            let rightChildLevel = self.level(
                for: key,
                node: rightChild,
                level: level + 1
            )
            if rightChildLevel != -1 {
                return rightChildLevel
            }
        }

        return level
    }

    private func level(
        for key: T,
        node: BinaryTreeNode,
        level: Int
    ) -> Int {
        if data == key {
            return level
        }
        return -1
    }
}

// MARK: - Sum tree
