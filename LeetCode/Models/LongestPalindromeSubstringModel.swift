//
//  LongestPalindromeSubstringModel.swift
//  LeetCode
//
//  Created by Mikhail Kirillov on 19/2/24.
//

import Foundation

struct LongestPalindromeSubstringModel {

    func longestPalindrome(_ s: String) -> String {
        switch s.count {
        case 0:
            return ""
        case 1:
            return s
        case 2:
            return s.first == s.last ? s : String(s.first!)
        default:
            return longestPalindromeInternal(s)
        }
    }

    private func longestPalindromeInternal(_ s: String) -> String {
        let arr = Array(s)

        var longest = (0, 0)
        for i in 1..<arr.count {
            var shouldStop = false
            var counter = 1
            while !shouldStop {

                if i - counter < 0 || i + counter == arr.count {
                    shouldStop = true
                    continue
                }

                if arr[i - counter] != arr[i + counter] {
                    shouldStop = true
                    continue
                }
                if longest.1 - longest.0 < (i + counter - abs(i - counter)) {
                    longest.0 = i - counter
                    longest.1 = i + counter
                }
                counter += 1
            }
        }
        return String(arr[longest.0...longest.1])
    }
}

extension Array where Element == Character {

    func isPalindrome() -> Bool {

        guard self.count > 1 else {
            return false
        }
        for i in 0...self.count / 2 {
            if self[i] != self[self.count - i - 1] {
                return false
            }
        }
        return true
    }
}
