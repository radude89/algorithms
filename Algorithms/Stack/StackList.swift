//
//  StackList.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

final class StackList<T> {
    var top: Node?
    
    init(top: Node? = nil) {
        self.top = top
    }
}

extension StackList {
    final class Node {
        let data: T
        var link: Node?
        
        init(_ data: T, next: Node? = nil) {
            self.data = data
            self.link = next
        }
    }
}

extension StackList: CustomStringConvertible {
    var description: String {
        var output = ""
        var node = top
        
        while node != nil {
            if let data = node?.data {
                output += "\(data)" + ", "
            }
            node = node?.link
        }
        
        let listOutput = String(output.dropLast(2))
        
        return "[\(listOutput)]"
    }
}
