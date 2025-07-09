//
//  SlidingWindow.swift
//  Algorithms
//
//  Created by Radu Dan on 08.07.2025.
//

import Foundation

enum SlidingWindow: Playground {
    static func executeOperations() {
        print("Static sliding window")
        print(Static.maxSum(array: [1, 4, 2, 10, 2, 3, 1, 0, 20], k: 4))
        
        print("Dynamic sliding window")
        print(
            Dynamic.longestSubArrayLengthBelowSum(
                array: [4, 5, 2, 0, 1, 8, 12, 3, 6, 9,],
                sum: 15
            )
        )
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
    
    enum Dynamic {
        static func longestSubArrayLengthBelowSum(array: [Int], sum: Int) -> Int {
            var left = 0
            var windowSum = 0
            var best = 0
            
            for right in 0..<array.count {
                windowSum += array[right]
                
                while windowSum >= sum {
                    windowSum -= array[left]
                    left += 1
                }
                
                best = max(best, right - left + 1)
            }

            return best
        }
    }
}
