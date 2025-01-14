//
//  GraphList.swift
//  Algorithms
//
//  Created by Radu Dan on 14.01.2025.
//
import Foundation

struct GraphList {
    var adjacencyLists: [LinkedList<Int>]

    func breadthFirstTraversal(from startVertex: Int = 0) {
        guard startVertex >= 0 && startVertex < adjacencyLists.count else { return }

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
}
