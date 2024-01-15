//
//  CircularLinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 19.01.2022.
//

import Foundation

extension CircularLinkedList: Playground {
    static func executeOperations() {
        let list = CircularLinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.insertAtStart(4)
        list.insertAtStart(5)
        
        list.insertAfter(node: list.last!.next!.next!, data: 200)
        list.insertAfter(node: list.last!, data: 300)
        list.insertAfter(node: list.last!.next!, data: 400)
        
        print(list)
        
        list.deleteLast()
        list.deleteFirst()
        
        // [400, 4, 200, 1, 2, 3]
        list.deleteNode(after: list.last!.next!.next!.next!.next!.next!)
        
        print(list)        
    }
}
