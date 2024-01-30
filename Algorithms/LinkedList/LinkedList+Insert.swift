//
//  LinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

protocol LinkedListInsertable {
    associatedtype T
    
    func insertAtBeginning(data: T)
    func insertAtEnd(data: T)
    func insertNodeAfter(node: LinkedList<T>.Node, data: T)
}

extension LinkedList: LinkedListInsertable {
    func insertAtBeginning(data: T) {
        guard head != nil else {
            head = Node(data)
            return
        }
        
        let newNode = Node(data, next: head)
        head = newNode
    }

    func insertAtEnd(data: T) {
        guard head != nil else {
            head = Node(data)
            return
        }
        
        var lastNode = head
        while lastNode?.next != nil {
            lastNode = lastNode?.next
        }
        
        let newNode = Node(data)
        lastNode?.next = newNode
    }
    
    func insertNodeAfter(node: Node, data: T) {
        guard head != nil else {
            head = node
            return
        }
        
        let newNode = Node(data, next: node.next)
        node.next = newNode
    }
}
