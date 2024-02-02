//
//  LinkedList+Delete.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

protocol LinkedListDeletable {
    func deleteNodeAtBeginning()
    func deleteNodeAtEnd()
    func delete(at position: Int)
}

extension LinkedList: LinkedListDeletable {
    func delete(at position: Int) {
        guard head != nil else {
            return
        }
        
        if position == 0 {
            let newHead = head?.next
            head = newHead
            return
        }

        var currentIndex = 0
        var currentNode = head
        while currentNode?.next != nil {
            let nextNode = currentNode?.next
            currentIndex += 1
            if position == currentIndex {
                let nextNextNode = nextNode?.next
                currentNode?.next = nextNextNode
                break
            }
            currentNode = nextNode
        }
    }

    func deleteNodeAtBeginning() {
        guard head != nil else {
            return
        }
        
        guard head?.next != nil else {
            head = nil
            return
        }
        
        let newHead = head?.next
        head = newHead
    }
    
    func deleteNodeAtEnd() {
        guard head != nil else {
            return
        }
        
        guard head?.next != nil else {
            head = nil
            return
        }
        
        var current = head
        while current?.next != nil {
            let nextNode = current?.next
            if nextNode?.next == nil {
                current?.next = nil
                break
            }
            current = nextNode
        }
    }
}
