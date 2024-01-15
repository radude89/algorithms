//
//  StackList+PushPop.swift
//  Algorithms
//
//  Created by Radu Dan on 20.01.2022.
//

import Foundation

extension StackList: Stack {
    var peek: T? {
        top?.data
    }
    
    var isEmpty: Bool {
        top == nil
    }
    
    func push(data: T) {
        guard top != nil else {
            top = Node(data)
            return
        }
        
        let node = Node(data)
        node.link = top
        top = node
    }
    
    func pop() -> T? {
        guard top != nil else {
            return nil
        }
        
        let value = top?.data
        top = top?.link
        return value
    }
}

extension Stack where T == String {
    func push(data: Character) {
        push(data: String(data))
    }
}
