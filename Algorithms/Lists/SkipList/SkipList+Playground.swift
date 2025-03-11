//
//  SkipList+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 05.03.2025.
//

import Foundation

extension SkipList: Playground {
    static func executeOperations() {
        let list = SkipList()
        list.insert(key: 12)
        list.insert(key: 17)
        list.insert(key: 20)
        list.insert(key: 25)
        list.insert(key: 31)
        list.insert(key: 39)
        list.insert(key: 50)
        list.insert(key: 55)
        print(list)
    }
}
