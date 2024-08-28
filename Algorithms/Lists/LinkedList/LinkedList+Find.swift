//
//  LinkedList+Find.swift
//  Algorithms
//
//  Created by Radu Dan on 13.01.2022.
//

import Foundation

protocol LinkedListFindable {
    associatedtype U
    var middleNodeValue: U? { get }
    
    func containsNode<U: Equatable>(havingValue value: U) -> Bool
    func nodeValue(at position: Int) -> U?
}

extension LinkedList: LinkedListFindable {
    func findNodeFromTheEnd(_ position: Int) -> Node? {
        guard head != nil else {
            return nil
        }
        
        var firstPointer = head
        var secondPointer = head
        var currentIndex = 0
        
        while firstPointer?.next != nil {
            firstPointer = firstPointer?.next
            currentIndex += 1
            if currentIndex > position - 1 {
                secondPointer = secondPointer?.next
            }
        }
        
        if currentIndex >= position - 1 {
            return secondPointer
        }
        return nil
    }

    func containsNode<U: Equatable>(havingValue value: U) -> Bool {
        var currentNode = head
        
        while currentNode != nil {
            if currentNode?.data as? U == value {
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
