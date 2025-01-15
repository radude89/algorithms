//
//  GraphList.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2025.
//

import Foundation

struct GraphList {
    var adjacencyLists: [LinkedList<Int>]

    init(matrix: [[Int]]) {
        self.adjacencyLists = Array(
            repeating: LinkedList<Int>(),
            count: matrix.count
        )
        for (i, connections) in matrix.enumerated() {
            // Use the connections in their original order
            for vertex in connections.reversed() { // Reverse to maintain order in linked list
                adjacencyLists[i].insertAtBeginning(data: vertex)
            }
        }
    }

    func breadthFirstTraversal(from startVertex: Int = 0) {
        guard startVertex >= 0,
              startVertex < adjacencyLists.count else {
            return
        }

        var visited: [Bool] = Array(
            repeating: false,
            count: adjacencyLists.count
        )

        var queue = Queue<Int>()
        queue.enqueue(startVertex)
        visited[startVertex] = true

        while !queue.isEmpty {
            guard let currentVertex = queue.dequeue() else { return }

            print(currentVertex)

            var node = adjacencyLists[currentVertex].head
            while let currentNode = node {
                let data = currentNode.data
                if !visited[data] {
                    visited[data] = true
                    queue.enqueue(data)
                }

                node = currentNode.next
            }
        }
    }

    func depthFirstTraversal(from startVertex: Int = 0) {
        guard startVertex >= 0,
              startVertex < adjacencyLists.count else {
            return
        }

        var visited: [Bool] = Array(
            repeating: false,
            count: adjacencyLists.count
        )
        traverse(vertex: startVertex, visited: &visited)
    }

    private func traverse(
        vertex: Int,
        visited: inout [Bool]
    ) {
        visited[vertex] = true
        print(vertex)

        var node = adjacencyLists[vertex].head
        while let currentNode = node {
            let data = currentNode.data
            if !visited[data] {
                traverse(vertex: data, visited: &visited)
            }

            node = currentNode.next
        }

    }
}
