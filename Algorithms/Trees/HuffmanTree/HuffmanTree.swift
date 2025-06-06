//
//  HuffmanTree.swift
//  Algorithms
//
//  Created by Radu Dan on 06.06.2025.
//

import Foundation

class HuffmanNode {
    let character: Character?
    let frequency: Int
    var leftChild: HuffmanNode?
    var rightChild: HuffmanNode?
    
    init(character: Character?, frequency: Int) {
        self.character = character
        self.frequency = frequency
    }
    
    var isLeaf: Bool {
        return leftChild == nil && rightChild == nil
    }
}

extension HuffmanNode: Comparable {
    static func < (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool {
        return lhs.frequency < rhs.frequency
    }
    
    static func == (lhs: HuffmanNode, rhs: HuffmanNode) -> Bool {
        return lhs.frequency == rhs.frequency
    }
}

class HuffmanTree {
    private var root: HuffmanNode?
    private var codes: [Character: String] = [:]
    
    func buildTree(from text: String) {
        let frequencies = calculateFrequencies(text: text)
        root = buildHuffmanTree(frequencies: frequencies)
        generateCodes()
    }
    
    private func calculateFrequencies(text: String) -> [Character: Int] {
        var frequencies: [Character: Int] = [:]
        for character in text {
            frequencies[character, default: 0] += 1
        }
        return frequencies
    }
    
    private func buildHuffmanTree(frequencies: [Character: Int]) -> HuffmanNode? {
        guard !frequencies.isEmpty else { return nil }
        
        if frequencies.count == 1 {
            let (character, frequency) = frequencies.first!
            let leaf = HuffmanNode(character: character, frequency: frequency)
            let root = HuffmanNode(character: nil, frequency: frequency)
            root.leftChild = leaf
            return root
        }
        
        var priorityQueue = frequencies.map { character, frequency in
            HuffmanNode(character: character, frequency: frequency)
        }.sorted(by: >)
        
        while priorityQueue.count > 1 {
            let right = priorityQueue.removeLast()
            let left = priorityQueue.removeLast()
            
            let merged = HuffmanNode(
                character: nil,
                frequency: left.frequency + right.frequency
            )
            merged.leftChild = left
            merged.rightChild = right
            
            priorityQueue.append(merged)
            priorityQueue.sort(by: >)
        }
        
        return priorityQueue.first
    }
    
    private func generateCodes() {
        codes.removeAll()
        guard let root = root else { return }
        generateCodes(node: root, code: "")
    }
    
    private func generateCodes(node: HuffmanNode, code: String) {
        if node.isLeaf {
            if let character = node.character {
                codes[character] = code.isEmpty ? "0" : code
            }
            return
        }
        
        if let leftChild = node.leftChild {
            generateCodes(node: leftChild, code: code + "0")
        }
        
        if let rightChild = node.rightChild {
            generateCodes(node: rightChild, code: code + "1")
        }
    }
    
    func encode(text: String) -> String? {
        guard !codes.isEmpty else { return nil }
        
        var encoded = ""
        for character in text {
            guard let code = codes[character] else { return nil }
            encoded += code
        }
        return encoded
    }
    
    func decode(encodedText: String) -> String? {
        guard let root = root else { return nil }
        
        var decoded = ""
        var currentNode: HuffmanNode? = root
        
        for bit in encodedText {
            if bit == "0" {
                currentNode = currentNode?.leftChild
            } else if bit == "1" {
                currentNode = currentNode?.rightChild
            } else {
                return nil
            }
            
            guard let node = currentNode else { return nil }
            
            if node.isLeaf {
                if let character = node.character {
                    decoded.append(character)
                }
                currentNode = root
            }
        }
        
        return currentNode === root ? decoded : nil
    }
    
    func getCompressionRatio(originalText: String) -> Double {
        guard let encoded = encode(text: originalText) else { return 0.0 }
        
        let originalBits = originalText.count * 8
        let compressedBits = encoded.count
        
        return Double(compressedBits) / Double(originalBits)
    }
    
    func printCodes() {
        print("Huffman Codes:")
        for (character, code) in codes.sorted(by: { $0.key < $1.key }) {
            let displayChar = character == " " ? "SPACE" : String(character)
            print("\(displayChar): \(code)")
        }
    }
    
    func printTree() {
        guard let root = root else {
            print("Tree is empty")
            return
        }
        printTree(node: root, prefix: "", isLast: true)
    }
    
    private func printTree(node: HuffmanNode, prefix: String, isLast: Bool) {
        let connector = isLast ? "└── " : "├── "
        let nodeDescription = node.character != nil ? 
            "'\(node.character!)' (\(node.frequency))" : 
            "Internal (\(node.frequency))"
        
        print(prefix + connector + nodeDescription)
        
        let childPrefix = prefix + (isLast ? "    " : "│   ")
        
        if let leftChild = node.leftChild {
            let hasRightSibling = node.rightChild != nil
            printTree(node: leftChild, prefix: childPrefix, isLast: !hasRightSibling)
        }
        
        if let rightChild = node.rightChild {
            printTree(node: rightChild, prefix: childPrefix, isLast: true)
        }
    }
}