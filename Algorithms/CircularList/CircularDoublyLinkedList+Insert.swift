//
//  CircularDoublyLinkedList+Insert.swift
//  Algorithms
//
//  Created by Radu Dan on 09.02.2024.
//

import Foundation

protocol CircularDoublyLinkedListInsertable {
    associatedtype T
    
    func insertAtBeginning(_ data: T)
    func append(_ data: T)
}

extension CircularDoublyLinkedList: CircularDoublyLinkedListInsertable {
    func insertAtBeginning(_ data: T) {
        let newNode = Node(data)
        guard head != nil else {
            newNode.next = newNode
            newNode.prev = newNode
            head = newNode
            return
        }
        
        newNode.next = head
        newNode.prev = head?.prev
        head?.prev?.next = newNode
        head?.prev = newNode
        head = newNode
    }
    
    func append(_ data: T) {
        let newNode = Node(data)
        guard head != nil else {
            newNode.next = newNode
            newNode.prev = newNode
            head = newNode
            return
        }
        
        newNode.next = head
        newNode.prev = head?.prev
        head?.prev?.next = newNode
        head?.prev = newNode
    }
}
