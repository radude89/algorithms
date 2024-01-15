//
//  CircularLinkedList+Delete.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

protocol CircularLinkedListDeletable {
    associatedtype T
    
    func deleteFirst()
    func deleteLast()
    func deleteNode(after node: CircularLinkedList<T>.Node<T>)
}

extension CircularLinkedList: CircularLinkedListDeletable {
    func deleteFirst() {
        guard last != nil else {
            return
        }
        
        guard last?.next !== last else {
            last = nil
            return
        }
        
        last?.next = last?.next?.next
    }
    
    func deleteLast() {
        guard last != nil else {
            return
        }
        
        guard last?.next !== last else {
            last = nil
            return
        }
        
        var currentNode = last?.next
        
        while currentNode !== last {
            if currentNode?.next === last {
                currentNode?.next = last?.next
                last = currentNode
                break
            }
            currentNode = currentNode?.next
        }
    }
    
    func deleteNode(after node: Node<T>) {
        guard last != nil else {
            return
        }

        guard last?.next !== last else {
            last = nil
            return
        }
        
        var currentNode = last
        repeat {
            if currentNode === node {
                var nodeToDelete = currentNode?.next
                currentNode?.next = nodeToDelete?.next
                if nodeToDelete === last {
                    last = currentNode
                }
                nodeToDelete = nil
                break
            }
            currentNode = currentNode?.next
        } while currentNode !== last
    }
}
