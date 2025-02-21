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
    func bfs(from vertex: Int = 0) {
        guard vertex < adjacencyLists.count, vertex >= 0 else {
            return
        }

        var queue = Queue<Int>()
        var visited: [Bool] = Array(
            repeating: false,
            count: adjacencyLists.count
        )
        visitNodes(from: vertex, queue: &queue, visited: &visited)
    }

    private func visitNodes(
        from vertex: Int,
        queue: inout Queue<Int>,
        visited: inout [Bool]
    ) {
        queue.enqueue(vertex)
        markAsVisited(vertex, visited: &visited)
        visitNodes(fromQueue: &queue, visited: &visited)
    }

    private func visitNodes(
        fromQueue queue: inout Queue<Int>,
        visited: inout [Bool]
    ) {
        while !queue.isEmpty {
            guard let currentVertex = queue.dequeue() else {
                continue
            }

            traverseList(
                from: currentVertex,
                queue: &queue,
                visited: &visited
            )
        }
    }

    private func traverseList(
        from vertex: Int,
        queue: inout Queue<Int>,
        visited: inout [Bool]
    ) {
        var current = adjacencyLists[vertex].head
        while let node = current {
            visitNodeIfNeeded(
                node,
                queue: &queue,
                visited: &visited
            )
            current = current?.next
        }
    }

    private func visitNodeIfNeeded(
        _ listNode: LinkedList<Int>.Node,
        queue: inout Queue<Int>,
        visited: inout [Bool]
    ) {
        let vertex = listNode.data
        if !visited[vertex] {
            queue.enqueue(vertex)
            markAsVisited(vertex, visited: &visited)
        }
    }
}
