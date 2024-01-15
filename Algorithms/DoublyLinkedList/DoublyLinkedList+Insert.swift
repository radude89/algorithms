//
//  DoublyLinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

protocol DoublyLinkedListInsertable {
    associatedtype T
    
    func insert(at position: UInt, data: T)
    func insert(after node: DoublyLinkedList<T>.Node, data: T)
    func insert(before node: DoublyLinkedList<T>.Node, data: T)
    func append(data: T)
}

extension DoublyLinkedList: DoublyLinkedListInsertable {
    func insert(at position: UInt, data: T) {
        guard head != nil else {
            head = Node(data)
            return
        }
        
        var index = 0
        var currentNode = head
        
        while currentNode != nil && index <= position {
            if index == position {
                let nodeToInsert = Node(data)
                nodeToInsert.next = currentNode
                nodeToInsert.prev = currentNode?.prev
                currentNode?.prev?.next = nodeToInsert
                currentNode?.prev = nodeToInsert
                
                if currentNode === head {
                    head = nodeToInsert
                }
                
                break
            }
            
            index += 1
            currentNode = currentNode?.next
        }
    }
    
    func insert(after node: Node, data: T) {
        guard head != nil else {
            return
        }
        
        let nodeToInsert = Node(data)
        nodeToInsert.prev = node
        nodeToInsert.next = node.next
        node.next?.prev = nodeToInsert
        node.next = nodeToInsert
    }
    
    func insert(before node: Node, data: T) {
        guard head != nil else {
            head = Node(data)
            return
        }
        
        let nodeToInsert = Node(data)
        nodeToInsert.next = node
        nodeToInsert.prev = node.prev
        node.prev?.next = nodeToInsert
        node.prev = nodeToInsert
        
        if node === head {
            head = nodeToInsert
        }
    }
    
    func append(data: T) {
        if head == nil {
            head = Node(data)
            return
        }
        
        var lastNode = head
        
        while lastNode?.next != nil {
            lastNode = lastNode?.next
        }
        
        let nodeToInsert = Node(data)
        lastNode?.next = nodeToInsert
        nodeToInsert.prev = lastNode
    }
}
