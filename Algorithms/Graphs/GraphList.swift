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
        adjacencyLists = []
        for row in matrix {
            let list = LinkedList<Int>()
            for element in row {
                list.insertAtEnd(data: element)
            }
            adjacencyLists.append(list)
        }
    }
}

// MARK: - DFS

extension GraphList {
    func dfs(from vertex: Int = 0) {
        guard vertex < adjacencyLists.count, vertex >= 0 else {
            return
        }

        var visited: [Bool] = Array(
            repeating: false,
            count: adjacencyLists.count
        )
        visit(vertex, visited: &visited)
    }

    private func visit(_ vertex: Int, visited: inout [Bool]) {
        markAsVisited(vertex, visited: &visited)
        traverseList(vertex, visited: &visited)
    }

    private func markAsVisited(_ vertex: Int, visited: inout [Bool]) {
        visited[vertex] = true
        print(vertex)
    }

    private func traverseList(_ vertex: Int, visited: inout [Bool]) {
        var current = adjacencyLists[vertex].head
        while let unwrappedCurrent = current {
            markAsVisitedIfNeeded(unwrappedCurrent, visited: &visited)
            current = unwrappedCurrent.next
        }
    }

    private func markAsVisitedIfNeeded(
        _ listNode: LinkedList<Int>.Node,
        visited: inout [Bool]
    ) {
        let vertex = listNode.data
        if !visited[vertex] {
            visit(vertex, visited: &visited)
        }
    }
}

// MARK: - BFS

extension GraphList {
    func bfs(from startVertex: Int = 0) {
    }
}
