//
//  HuffmanTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 06.06.2025.
//

import Foundation

extension HuffmanTree: Playground {
    static func executeOperations() {
        print("=== Huffman Coding Demo ===\n")
        
        let sampleTexts = [
            "hello world",
            "ABRACADABRA",
            "The quick brown fox jumps over the lazy dog",
            "aaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjkkkkk"
        ]
        
        for (index, text) in sampleTexts.enumerated() {
            print("Example \(index + 1): \"\(text)\"")
            print("─────────────────────────────────────")
            
            let huffmanTree = HuffmanTree()
            huffmanTree.buildTree(from: text)
            
            huffmanTree.printCodes()
            print()
            
            if let encoded = huffmanTree.encode(text: text) {
                print("Original: \(text)")
                print("Encoded:  \(encoded)")
                
                if let decoded = huffmanTree.decode(encodedText: encoded) {
                    print("Decoded:  \(decoded)")
                    print("✅ Encoding/Decoding successful!")
                } else {
                    print("❌ Decoding failed!")
                }
                
                let ratio = huffmanTree.getCompressionRatio(originalText: text)
                print("Compression ratio: \(String(format: "%.2f", ratio * 100))%")
                print("Space saved: \(String(format: "%.2f", (1 - ratio) * 100))%")
            } else {
                print("❌ Encoding failed!")
            }
            
            print("\nTree structure:")
            huffmanTree.printTree()
            print("\n" + String(repeating: "=", count: 50) + "\n")
        }
        
        demonstrateIOSUseCases()
    }
    
    private static func demonstrateIOSUseCases() {
        print("=== iOS Use Cases Demo ===\n")
        
        print("1. JSON Payload Compression")
        let jsonData = """
        {
            "users": [
                {"name": "Alice", "email": "alice@example.com"},
                {"name": "Bob", "email": "bob@example.com"},
                {"name": "Charlie", "email": "charlie@example.com"}
            ]
        }
        """
        
        let jsonHuffman = HuffmanTree()
        jsonHuffman.buildTree(from: jsonData)
        
        if let encoded = jsonHuffman.encode(text: jsonData) {
            let originalSize = jsonData.count * 8
            let compressedSize = encoded.count
            print("Original JSON size: \(originalSize) bits")
            print("Compressed size: \(compressedSize) bits")
            print("Savings: \(originalSize - compressedSize) bits")
        }
        
        print("\n2. Chat Message Compression")
        let chatMessages = [
            "Hey, how are you doing today?",
            "I'm doing great! Thanks for asking.",
            "That's awesome to hear! Any plans for the weekend?"
        ]
        
        let combinedMessages = chatMessages.joined(separator: " ")
        let chatHuffman = HuffmanTree()
        chatHuffman.buildTree(from: combinedMessages)
        
        for message in chatMessages {
            if let encoded = chatHuffman.encode(text: message) {
                let originalBits = message.count * 8
                let compressedBits = encoded.count
                print("Message: \"\(message)\"")
                print("Compression: \(originalBits) → \(compressedBits) bits")
            }
        }
        
        print("\n3. Game Level Data Compression")
        let levelData = "platform,platform,enemy,coin,platform,enemy,coin,coin,platform"
        let gameHuffman = HuffmanTree()
        gameHuffman.buildTree(from: levelData)
        
        if let encoded = gameHuffman.encode(text: levelData) {
            print("Level data: \(levelData)")
            print("Compressed representation efficiently stores repeated elements")
            print("Original: \(levelData.count * 8) bits")
            print("Compressed: \(encoded.count) bits")
        }
    }
}