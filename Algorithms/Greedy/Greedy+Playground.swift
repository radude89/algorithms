//
//  Greedy+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 08.07.2025.
//

import Foundation

enum Greedy: Playground {
    static func executeOperations() {
        // Knapsack Algorithm Example
        let totalWeight = KnapsackAlgorithm.calculateMaxProfit(
            objects: [1, 2, 3, 4, 5, 6, 7],
            profits: [5, 10, 15, 7, 8, 9, 4],
            weights: [1, 3, 5, 4, 1, 3, 2],
            capacity: 15
        )
        print("Knapsack Max Profit: \(totalWeight)")

        // Huffman Coding Example
        print("\n" + String(repeating: "=", count: 40))
        print("HUFFMAN CODING DEMONSTRATION")
        print(String(repeating: "=", count: 40))

        let text = "swift ios development"
        let huffman = HuffmanTree()
        huffman.buildTree(from: text)

        print("\nOriginal text: '\(text)'")
        print("Character frequencies and codes:")
        huffman.printCodes()

        if let encoded = huffman.encode(text: text) {
            print("\nEncoded: \(encoded)")
            
            if let decoded = huffman.decode(encodedText: encoded) {
                print("Decoded: '\(decoded)'")
                print("✅ Successful encoding/decoding!")
            }
            
            let ratio = huffman.getCompressionRatio(originalText: text)
            let originalBits = text.count * 8
            let compressedBits = encoded.count
            
            print("\nCompression Stats:")
            print("Original size: \(originalBits) bits")
            print("Compressed size: \(compressedBits) bits")
            print("Compression ratio: \(String(format: "%.1f", ratio * 100))%")
            print("Space saved: \(String(format: "%.1f", (1 - ratio) * 100))%")
        }
    }
}
