//
//  LinkedList+Delete.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

protocol LinkedListDeletable {
    func deleteNode<T: Equatable>(data: T)
    func delete()
    func delete(at index: Int)
}

extension LinkedList: LinkedListDeletable {
    func deleteNode<T: Equatable>(data: T) {
        guard head != nil else {
            return
        }
        
        guard head?.data as? T != data else {
            head = head?.next
            return
        }
        
        var current = head
        
        while current?.next != nil {
            var nextNode = current?.next
            
            if nextNode?.data as? T == data {
                current?.next = nextNode?.next
                nextNode = nil
                break
            }
            
            current = nextNode
        }
    }
    
    func delete() {
        head = nil
    }
    
    func delete(at index: Int) {
        if head == nil {
            return
        }
        
        if index == 0 {
            head = head?.next
            return
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            if currentIndex + 1 == index {
                var nextNode = currentNode?.next
                currentNode?.next = nextNode?.next
                nextNode = nil
            }
            currentIndex += 1
            currentNode = currentNode?.next
        }
    }
}
