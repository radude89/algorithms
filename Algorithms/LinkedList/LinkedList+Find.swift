//
//  LinkedList+Find.swift
//  Algorithms
//
//  Created by Radu Dan on 13.01.2022.
//

import Foundation

protocol LinkedListFindable {
    associatedtype T
    
    var middleNodeValue: T? { get }
    
    func containsNode<T: Equatable>(havingValue value: T) -> Bool
    func nodeValue(at position: Int) -> T?
}

extension LinkedList: LinkedListFindable {
    func containsNode<T: Equatable>(havingValue value: T) -> Bool {
        var currentNode = head
        
        while currentNode != nil {
            if currentNode?.data as? T == value {
                return true
            }
            currentNode = currentNode?.next
        }
        
        return false
    }
    
    func nodeValue(at position: Int) -> T? {
        var currentIndex = 0
        var currentNode = head
        
        while currentNode != nil && currentIndex <= position {
            if currentIndex == position {
                return currentNode?.data
            }
            currentNode = currentNode?.next
            currentIndex += 1
        }
        
        return nil
    }
    
    var middleNodeValue: T? {
        if head == nil {
            return nil
        }
        
        var size = 0
        var currentNode = head
        while currentNode != nil {
            currentNode = currentNode?.next
            size += 1
        }
        
        var currentIndex = 0
        let middleIndex = Int(size / 2)
        currentNode = head
        
        while currentNode != nil && currentIndex <= middleIndex {
            if currentIndex == middleIndex {
                return currentNode?.data
            }
            
            currentIndex += 1
            currentNode = currentNode?.next
        }
        
        return nil
    }
}
