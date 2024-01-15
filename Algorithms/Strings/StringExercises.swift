//
//  StringExercises.swift
//  Algorithms
//
//  Created by Radu Dan on 03.05.2022.
//

import Foundation

// MARK: - Compress

func compress(text: String) -> String {
    guard !text.isEmpty else {
        return ""
    }
    
    guard text.count > 1 else {
        return "\(text.first!)1"
    }
    
    let stack = StackList<String>()
    let textArray = Array(text)
    var output = String()
    
    textArray.enumerated().forEach { index, character in
        let isLast = index == textArray.count - 1
        if let peek = stack.peek, peek != String(character) || isLast {
            output.append(peek)
            var count = isLast ? 1 : 0
            while stack.peek?.isEmpty == false {
                _ = stack.pop()
                count += 1
            }
            output.append("\(count)")
        }
        stack.push(data: character)
    }
    
    return output
}

func compress2(text: String) -> String {
    guard !text.isEmpty else {
        return ""
    }
    
    let textArray = Array(text)
    var output = String()
    var counter = 0
    
    textArray.enumerated().forEach { index, character in
        counter += 1
        let isLast = index == textArray.count - 1
        
        if isLast || (!isLast && character != textArray[index + 1]) {
            output.append(character)
            output.append("\(counter)")
            counter = 0
        }
    }
    
    return output
}

// MARK: - One away

func areOneAway(text: String, anotherText: String) -> Bool {
    let textCount = text.count
    let anotherTextCount = anotherText.count
    
    guard text != anotherText &&
            textCount == anotherTextCount ||
            textCount - 1 == anotherTextCount ||
            textCount == anotherTextCount - 1 else {
        return false
    }
    
    let textArray = Array(text)
    let anotherTextArray = Array(anotherText)
    var _index = 0
    var incremented = false
    let length = min(textCount, anotherTextCount)
    
    while _index < length {
        let textElement = (incremented && textCount > anotherTextCount) ? textArray[_index + 1] : textArray[_index]
        let anotherTextElement = (incremented && textCount < anotherTextCount ? anotherTextArray[_index + 1] : anotherTextArray[_index])
        
        if textElement != anotherTextElement {
            if incremented { return false }
            incremented = true
        }
        
        _index += 1
    }
    
    return incremented || _index == length
}

//print(areOneAway(text: "pale", anotherText: "pale"))
