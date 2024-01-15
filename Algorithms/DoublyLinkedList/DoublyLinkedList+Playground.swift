//
//  DoublyLinkedList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2022.
//

import Foundation

extension DoublyLinkedList: Playground {
    static func executeOperations() {
        let list = DoublyLinkedList<Int>()
        list.insert(at: 0, data: 1)
        list.insert(at: 0, data: 10)
        list.insert(at: 0, data: 8)
        list.insert(at: 1, data: 7)
        list.insert(after: list.head!, data: 5)
        list.insert(before: list.head!, data: 4)
        list.append(data: 32)

        print("List \(list)")

        list.reverse()

        print("Reversed List \(list)")
    }
}
