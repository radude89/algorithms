//
//  BTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 09.04.2025.
//

import Foundation

extension BTree: Playground {
    static func executeOperations() {
        let tree = BTree(order: 4)
        tree.insert(5)
        tree.insert(3)
        tree.insert(21)
        tree.insert(9)

    }
}
