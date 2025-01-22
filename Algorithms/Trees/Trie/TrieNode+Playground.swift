//
//  TrieNode+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 22.01.2025.
//

import Foundation

extension TrieNode: Playground {
    static func executeOperations() {
        let trie = TrieNode()
        trie.insert(word: "and")
        trie.insert(word: "ant")
        print(trie)
        print("Looking for the word 'and'...\nIs it in the array? 👉 \(trie.search(word: "and"))")
    }
}
