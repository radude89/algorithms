//
//  LinkedList+Length.swift
//  Algorithms
//
//  Created by Radu Dan on 12.01.2022.
//

import Foundation

protocol LinkedListCountable {
    var length: Int { get }
}

extension LinkedList: LinkedListCountable {
    var length: Int {
        if head == nil {
            return 0
        }
        
        var count = 0
        var currentNode = head
        
        while currentNode != nil {
            count += 1
            currentNode = currentNode?.next
        }
        
        return count
    }
}
