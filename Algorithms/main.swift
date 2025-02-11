//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

// MARK: - main

let tree = BinaryTreeNode(data: 1)

let l1 = BinaryTreeNode(data: 2)
let l2 = BinaryTreeNode(data: 4)
let l3 = BinaryTreeNode(data: 5)
l1.leftChild = l2
l1.rightChild = l3

tree.leftChild = l1

let r1 = BinaryTreeNode(data: 3)
let r2 = BinaryTreeNode(data: 6)
r1.rightChild = r2

tree.rightChild = r1

print(l2.isCousin(with: r2, tree: tree))
