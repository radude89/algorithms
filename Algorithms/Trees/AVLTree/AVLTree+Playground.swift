//
//  AVLTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 25.09.2024.
//

extension AVLTreeNode: Playground {
    static func executeOperations() {
        var tree: AVLTreeNode<Int>? = AVLTreeNode<Int>(data: 14)
        tree = tree?.insert(19)
        tree = tree?.insert(11)
        tree = tree?.insert(17)
        tree = tree?.insert(53)
        tree = tree?.insert(7)
        tree = tree?.insert(12)
        tree = tree?.insert(4)
        tree = tree?.insert(8)
        tree = tree?.insert(13)
        tree = tree?.insert(60)
        tree = tree?.insert(20)
        tree = tree?.insert(16)
        
        // 8, 7, 11, 14
        tree = tree?.delete(8)
        tree = tree?.delete(7)
        tree = tree?.delete(11)
        tree = tree?.delete(14)
    }
}
