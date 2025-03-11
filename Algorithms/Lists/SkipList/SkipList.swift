//
//  SkipList.swift
//  Algorithms
//
//  Created by Radu Dan on 04.03.2025.
//

import Foundation

final class SkipListNode {
    var above: SkipListNode?
    var below: SkipListNode?
    var next: SkipListNode?
    var prev: SkipListNode?

    var key: Int

    init(
        key: Int,
        above: SkipListNode? = nil,
        below: SkipListNode? = nil,
        next: SkipListNode? = nil,
        prev: SkipListNode? = nil
    ) {
        self.key = key
        self.above = above
        self.below = below
        self.next = next
        self.prev = prev
    }
}

final class SkipList {
    private var head: SkipListNode
    private var tail: SkipListNode

    private static let negativeInf = Int.min
    private static let positiveInf = Int.max

    private var height: Int = 0

    init() {
        head = SkipListNode(key: Self.negativeInf)
        tail = SkipListNode(key: Self.positiveInf)
        head.next = tail
        tail.prev = head
    }

    func search(key: Int) -> SkipListNode? {
        var node: SkipListNode? = head

        // Start from the highest level and move down
        while node != nil {
            // Move right as far as possible without going past the key
            while let next = node?.next, next.key <= key {
                node = next
            }

            // If we found the key, return the node
            if node?.key == key {
                return node
            }

            // Move down one level
            node = node?.below
        }

        // Key wasn't found
        return nil
    }

    func insert(key: Int) {
        // We can't insert an existing key
        guard search(key: key) == nil else {
            return
        }

        // Create stack to keep track of nodes at each level where we'll need to insert
        var stack: [SkipListNode] = []

        // Find the position where the new node should be inserted at the bottom level
        var current = head
        var level = height

        // Traverse down through the levels
        while level >= 0 {
            // At each level, move right until we find the last node with key < target key
            while let next = current.next, next.key < key {
                current = next
            }

            // Add this node to the stack before moving down
            stack.append(current)

            if level > 0, let below = current.below {
                current = below
            } else {
                // We should never reach here in a properly constructed skip list
                break
            }

            level -= 1
        }

        // Insert the new node at the bottom level
        var prevNode: SkipListNode?
        var currentLevel = 0

        // Stack is now full of nodes where we need to insert after
        // Keep building up new nodes with a coin flip to determine height
        var coinFlipIsHeads = flipCoin()
        while !stack.isEmpty && (currentLevel == 0 || coinFlipIsHeads) {
            let insertAfter = stack.removeLast()

            // Create a new node
            let node = SkipListNode(key: key)

            // Insert the new node after insertAfter
            node.prev = insertAfter
            node.next = insertAfter.next
            insertAfter.next?.prev = node
            insertAfter.next = node

            // Link to the node below (from the previous iteration)
            if let prevNode {
                node.below = prevNode
                prevNode.above = node
            }

            // Keep track of this node for the next iteration
            prevNode = node
            // Increment level
            currentLevel += 1
            // Flip coin again
            coinFlipIsHeads = flipCoin()

            // If we need to add a new level
            if stack.isEmpty && coinFlipIsHeads {
                increaseHeightIfNeeded(level: currentLevel)

                // The new head and tail are now on top
                stack.append(head)
            }
        }
    }

    private func flipCoin() -> Bool {
        Bool.random()
    }

    private func increaseHeightIfNeeded(level: Int) {
        if level >= height {
            height += 1
            addEmptyLevel()
        }
    }

    private func addEmptyLevel() {
        let newHead = SkipListNode(key: Self.negativeInf)
        let newTail = SkipListNode(key: Self.positiveInf)

        // Connect horizontally
        newHead.next = newTail
        newTail.prev = newHead

        // Connect vertically
        newHead.below = head
        head.above = newHead

        newTail.below = tail
        tail.above = newTail

        // Update head and tail
        head = newHead
        tail = newTail
    }

    func delete(key: Int) -> Bool {
        // First find the node to delete
        let nodeToDelete = search(key: key)

        // If the node doesn't exist, return false
        guard let firstNode = nodeToDelete else {
            return false
        }

        // Start from the found node (which might be at any level)
        // and work our way up to the top level where this key exists
        var currentNode: SkipListNode? = firstNode

        // Delete the node at each level
        while let node = currentNode {
            // Update the horizontal links
            node.prev?.next = node.next
            node.next?.prev = node.prev

            // Move up to the next level
            currentNode = node.above
        }

        // Consider decreasing height if the top level is now empty
        decreaseHeightIfNeeded()

        return true
    }

    private func decreaseHeightIfNeeded() {
        // If the top level only contains sentinel nodes (head and tail), remove it
        while height > 0, head.next === tail {
            // Top level is empty, remove it
            head = head.below!  // Safe unwrap as height > 0
            tail = tail.below!  // Safe unwrap as height > 0

            // Break vertical links to allow garbage collection
            head.above = nil
            tail.above = nil

            height -= 1
        }
    }

    func printList() -> String {
        // Start from the top level
        var currentLevel = height
        var currentHead = head
        var output = ""

        // For each level
        while currentLevel >= 0 {
            output.append("Level \(currentLevel): ")

            // Traverse the current level and print each key
            var currentNode = currentHead
            while let next = currentNode.next {
                // Skip printing the positive infinity sentinel
                if next.key == Self.positiveInf {
                    break
                }

                // Skip printing the negative infinity sentinel
                if currentNode.key != Self.negativeInf {
                    output.append("\(currentNode.key) -> ")
                } else {
                    output.append("")
                }

                currentNode = next
            }

            // Print the last value if it's not a sentinel node
            if currentNode.key != Self.positiveInf && currentNode.key != Self.negativeInf {
                output.append("\(currentNode.key)")
            } else {
                output.append("")
            }

            // Move to the level below
            if let below = currentHead.below {
                currentHead = below
            }
            currentLevel -= 1
            output.append("\n")
        }

        // Print the height of the skip list
        output.append("Skip List Height: \(height)")
        return output
    }
}

extension SkipList: CustomStringConvertible {
    var description: String {
        printList()
    }
}
