//
//  Graph+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2025.
//

import Foundation

extension Graph: Playground {
    static func executeOperations() {
        executeGraphOperations()
    }

    private static func executeGraphOperations() {
        let matrix = [[1,2], [0,2], [0,1,3,4], [2], [2]]
        let graph = GraphList(matrix: matrix)
        graph.bfs(from: 0)
    }
}
