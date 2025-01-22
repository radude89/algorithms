//
//  TrieNode.swift
//  Algorithms
//
//  Created by Radu Dan on 22.01.2025.
//

import Foundation

/// A Trie (prefix tree) node implementation
///
/// Time Complexity:
/// - Insert: O(m) where m is the length of the word
/// - Search: O(m) where m is the length of the word
///
/// Space Complexity:
/// - O(ALPHABET_SIZE * m * n) where:
///   - ALPHABET_SIZE is the number of possible characters (26 for English alphabet)
///   - m is the average length of words
///   - n is the number of words in the trie
///
final class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false

    func insert(word: String) {
        var currentNode = self
        for char in word {
            if currentNode.children[char] == nil {
                currentNode.children[char] = TrieNode()
            }
            currentNode = currentNode.children[char]!
        }
        currentNode.isEndOfWord = true
    }

    func search(word: String) -> Bool {
        var currentNode = self
        for char in word {
            guard let node = currentNode.children[char] else {
                return false
            }
            currentNode = node
        }

        return currentNode.isEndOfWord
    }
}

extension TrieNode: CustomStringConvertible {
    var description: String {
        var result = ""
        describeNode(self, prefix: "", result: &result)
        return result
    }

    private func describeNode(
        _ node: TrieNode,
        prefix: String,
        result: inout String
    ) {
        if node.isEndOfWord {
            result += "\(prefix)\n"
        }

        for (char, child) in node.children.sorted(by: { $0.key < $1.key }) {
            describeNode(
                child,
                prefix: prefix + String(char),
                result: &result
            )
        }
    }
}
