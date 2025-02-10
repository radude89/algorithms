//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

// MARK: - main

let tree = BinaryTreeNode(data: 26)

let l1 = BinaryTreeNode(data: 10)
l1.leftChild = BinaryTreeNode(data: 4)
l1.rightChild = BinaryTreeNode(data: 6)
tree.leftChild = l1

let r1 = BinaryTreeNode(data: 3)
r1.rightChild = BinaryTreeNode(data: 3)
tree.rightChild = r1

print(tree.isSumTree)
