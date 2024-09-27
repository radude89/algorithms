//
//  AVLTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 25.09.2024.
//

extension AVLTreeNode: Playground {
    static func executeOperations() {
        var tree = AVLTreeNode<Int>(data: 12)
        tree = tree.insert(18)
        tree = tree.insert(19)
        print(tree.balance)
        tree = tree.insert(8)
        tree = tree.insert(11)
        tree = tree.insert(5)
        tree = tree.insert(4)
        tree = tree.insert(7)
        tree = tree.insert(2)
        
    }
}
