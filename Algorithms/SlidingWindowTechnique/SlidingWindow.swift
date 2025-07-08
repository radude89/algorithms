//
//  SlidingWindow.swift
//  Algorithms
//
//  Created by Radu Dan on 08.07.2025.
//

import Foundation

enum SlidingWindow: Playground {
    static func executeOperations() {
        print(Static.maxSum(array: [1, 4, 2, 10, 2, 3, 1, 0, 20], k: 4))
    }
}

extension SlidingWindow {
    enum Static {
        static func maxSum(array: [Int], k: Int) -> Int {
            guard array.count >= k else { return 0 }
            
            var windowSum = 0
            
            for i in 0..<k {
                windowSum += array[i]
            }
            
            var maxSum = windowSum
            for i in k..<array.count {
                windowSum = windowSum - array[i-k] + array[i]
                if maxSum < windowSum {
                    maxSum = windowSum
                }
            }
            
            return maxSum
        }
    }
}
