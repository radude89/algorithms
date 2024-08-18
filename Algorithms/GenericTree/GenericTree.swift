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
    
    func traverse(level: Int = 0) {
        let indentation = String(repeating: "  ", count: level)
        print("\(indentation)\(data)")
        firstChild?.traverse(level: level + 1)
        nextSibling?.traverse(level: level)
    }
}
