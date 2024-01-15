//
//  CircularLinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 19.01.2022.
//

import Foundation

protocol CircularLinkedListInsertable {
    associatedtype T
    
    func append(_ data: T)
    func insertAtStart(_ data: T)
    func insertAfter(node: CircularLinkedList<T>.Node<T>, data: T)
}

extension CircularLinkedList: CircularLinkedListInsertable {
    func append(_ data: T) {
        guard last != nil else {
            insertFirstNode(data)
            return
        }
        
        let node = Node(data)
        node.next = last?.next
        last?.next = node
        last = node
    }
    
    private func insertFirstNode(_ data: T) {
        last = Node(data)
        last?.next = last
        return
    }
    
    func insertAtStart(_ data: T) {
        guard last != nil else {
            insertFirstNode(data)
            return
        }
        
        let node = Node(data)
        node.next = last?.next
        last?.next = node
    }
    
    func insertAfter(node: CircularLinkedList<T>.Node<T>, data: T) {
        guard last != nil else {
            insertFirstNode(data)
            return
        }
        
        let nodeToInsert = Node(data)
        if node === last {
            nodeToInsert.next = last?.next
            last?.next = nodeToInsert
            last = nodeToInsert
        } else {
            var currentNode = last?.next
            while currentNode !== last {
                if currentNode === node {
                    nodeToInsert.next = currentNode?.next
                    currentNode?.next = nodeToInsert
                    break
                }
                currentNode = currentNode?.next
            }
        }
    }
}
