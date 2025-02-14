//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

// MARK: - main

let tree = BinaryTreeNode(data: 1)

let a = BinaryTreeNode(data: 2)
let b = BinaryTreeNode(data: 3)
let c = BinaryTreeNode(data: 4)

tree.leftChild = a
tree.rightChild = b
a.leftChild = c

print(tree.isComplete)
