//
//  Graph+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2025.
//
import Foundation

extension Graph: Playground {
    static func executeOperations() {
        basicInsertion()
    }

    private static func basicInsertion() {
        // https://media.geeksforgeeks.org/wp-content/uploads/20230727130331/Undirected_to_Adjacency_matrix.png
        _ = Graph(
            matrix: [
                [0, 0], [0, 1], [0, 1],
                [1, 1], [1, 0], [1, 1],
                [2, 1], [2, 1], [2, 0],
            ]
        )

        let firstList = LinkedList<Int>()
        firstList.insertAtEnd(data: 1)
        firstList.insertAtEnd(data: 2)

        let secondList = LinkedList<Int>()
        secondList.insertAtEnd(data: 0)
        secondList.insertAtEnd(data: 2)

        let thirdList = LinkedList<Int>()
        thirdList.insertAtEnd(data: 0)
        thirdList.insertAtEnd(data: 1)


        let graphList = GraphList(
            adjacencyLists: [
                firstList,
                secondList,
                thirdList,
            ]
        )

        graphList.breadthFirstTraversal()
    }
}
