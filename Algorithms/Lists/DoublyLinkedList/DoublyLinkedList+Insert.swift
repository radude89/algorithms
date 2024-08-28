//
//  DoublyLinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

protocol DoublyLinkedListInsertable {
    associatedtype T
    
    func insertAtFront(data: T)
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
    
    func insertAtFront(data: T) {
        let node = Node(data)
        node.next = head
        node.prev = nil
        head?.prev = node
        head = node
    }
    
    func insertAtEnd(data: T) {
        guard head != nil else {
            let node = Node(data)
            head = node
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        let node = Node(data)
        node.next = nil
        node.prev = current
        current?.next = node
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
        if head == nil && node !== head {
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
        insertAtEnd(data: data)
    }
}
