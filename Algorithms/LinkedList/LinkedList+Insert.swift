//
//  LinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

protocol LinkedListInsertable {
    associatedtype T
    
    func insertAfter(node: LinkedList<T>.Node, data: T)
    func append(data: T)
}

extension LinkedList: LinkedListInsertable {
    func insertAfter(node: Node, data: T) {
        let nodeToBeInserted = Node(data)
        guard head != nil else {
            head = nodeToBeInserted
            return
        }
        
        nodeToBeInserted.next = node.next
        node.next = nodeToBeInserted
    }
    
    func append(data: T) {
        guard head != nil else {
            head = Node(data)
            return
        }
        
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        
        let node = Node(data)
        current?.next = node
    }
}
