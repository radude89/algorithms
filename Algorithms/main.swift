//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

// MARK: - main

let tree = BinaryTreeNode(data: 7)

let a = BinaryTreeNode(data: 6)
let b = BinaryTreeNode(data: 5)
let c = BinaryTreeNode(data: 4)
let d = BinaryTreeNode(data: 3)
let e = BinaryTreeNode(data: 2)
let f = BinaryTreeNode(data: 1)

a.rightChild = f
a.leftChild = e

b.rightChild = d
b.leftChild = c

tree.leftChild = a
tree.rightChild = b

print(tree.isPerfect)
