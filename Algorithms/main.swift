//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

// MARK: - main

//TrieNode.executeOperations()

let tree = BinaryTreeNode(data: 0)
tree.insert(data: 1)
tree.insert(data: 2)
tree.insert(data: 3)
tree.insert(data: 4)
tree.insert(data: 5)
tree.insert(data: 6)
tree.insert(data: 7)

print(tree.level(for: 5))
