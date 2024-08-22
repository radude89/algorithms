//
//  GenericTree.swift
//  Algorithms
//
//  Created by Radu Dan on 18.08.2024.
//

class GenericTreeNode<T> {
    var data: T
    var firstChild: GenericTreeNode?
    var nextSibling: GenericTreeNode?
    
    init(data: T) {
        self.data = data
        self.firstChild = nil
        self.nextSibling = nil
    }
    
    func addChild(_ child: GenericTreeNode<T>) {
        if firstChild == nil {
            firstChild = child
        } else {
            var current = firstChild
            while current?.nextSibling != nil {
                current = current?.nextSibling
            }
            current?.nextSibling = child
        }
    }
    
    func traversePreOrder() {
        print(data)
        firstChild?.traversePreOrder()
        nextSibling?.traversePreOrder()
    }
    
    func traversePostOrder() {
        firstChild?.traversePostOrder()
        nextSibling?.traversePostOrder()
        print(data)
    }
    
    func traverseByLevel() {
        print(data)
        var sibling = nextSibling
        while sibling != nil {
            print(sibling!.data)
            sibling = sibling?.nextSibling
        }
        firstChild?.traverseByLevel()
        nextSibling?.firstChild?.traverseByLevel()
    }
    
    func traverseByLevelViaQueue() {
        var queue = [self]
        while !queue.isEmpty {
            let current = queue.removeFirst()
            print(current.data)
            if let child = current.firstChild {
                queue.append(child)
                var sibling = child.nextSibling
                while let next = sibling {
                    queue.append(next)
                    sibling = sibling?.nextSibling
                }
            }
        }
    }
}
