//
//  BinaryTree.swift
//  Algorithms
//
//  Created by Radu Dan on 09.02.2022.
//

import Foundation

indirect enum BinaryTree<T> {
  case node(BinaryTree<T>, T, BinaryTree<T>)
  case empty
}

extension BinaryTree {
    func traverseInOrder(process: (T) -> Void) {
        guard case let .node(left, value, right) = self else {
            return
        }
        
        left.traverseInOrder(process: process)
        process(value)
        right.traverseInOrder(process: process)
    }
    
    func traversePreOrder(process: (T) -> Void) {
        guard case let .node(left, value, right) = self else {
            return
        }
        
        process(value)
        left.traversePreOrder(process: process)
        right.traversePreOrder(process: process)
    }
    
    func traversePostOrder(process: (T) -> Void) {
        guard case let .node(left, value, right) = self else {
            return
        }
        
        left.traversePostOrder(process: process)
        right.traversePostOrder(process: process)
        process(value)
    }
}

// binary tree = should contain 0...2 children
// max number of nodes of level = 2^i
//
// height = number of edges in the longest path connecting that node to a leaf node
// depth = number of edges from root to the node
//
// max number of nodes in a tree = 2^(h+1) - 1
// min number of nodes in a tree = h+1
// given the max number of nodes, h = ceil(log2(n+1) - 1)
// given the min number of nodes, h = n-1
//
// Types of binary trees
// * full/proper/strict binary trees: each node has 2 or 0 children
//      number of leaf nodes = number of internal nodes + 1
//      max number of nodes = 2^(h+1) - 1
//      min number of nodes = 2*h + 1
//      given the max number of nodes, h = ceil(log2(n+1) - 1)
//      given the min number of nodes, h = (n-1)/2
//
//  * complete binary tree: all levels are filled and all nodes are as left as possible
//      max number of nodes = 2^(h+1) - 1
//      min number of nodes = 2^h
//      given the max number of nodes, h = ceil(log2(n+1) - 1)
//      given the min number of nodes, h = log(n)
//
//  * perfect binary: all internal nodes are having 2 children and all the leaves are the same level
//      max number of nodes = 2^(h+1) - 1
//      min number of nodes = 2^(h+1) - 1
//      min number of nodes in a tree = h+1
//      given the max number of nodes, h = ceil(log2(n+1) - 1)
//      given the min number of nodes, h = ceil(log2(n+1) - 1)
