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
        // https://media.geeksforgeeks.org/wp-content/uploads/20230727130331/Undirected_to_Adjacency_matrix.png
        _ = Graph(
            matrix: [
                [0, 0], [0, 1], [0, 1],
                [1, 1], [1, 0], [1, 1],
                [2, 1], [2, 1], [2, 0],
            ]
        )

         let matrix = [[2,3,1], [0], [0,4], [0], [2]]
         let graph = GraphList(matrix: matrix)
         graph.depthFirstTraversal() // Output: 0 2 4 3 1
    }
}
