//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Radu Dan on 14.09.2024.
//
import Foundation

extension BinaryTreeNode {
    func search(value: Int) -> BinaryTreeNode? {
        guard let dataAsInt = data as? Int else {
            return nil
        }
        
        return if dataAsInt == value {
            self
        } else if value < dataAsInt {
            leftChild?.search(value: value)
        } else if value > dataAsInt {
            rightChild?.search(value: value)
        } else {
            nil
        }
    }
}
