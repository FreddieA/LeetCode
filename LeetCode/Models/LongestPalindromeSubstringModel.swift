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

        var center = 0
        var l = (0,0)
        var c = (0,0)

        for i in (0..<arr.count) {
            
            let oppositeIndex = abs(center - (i - center))
            if oppositeIndex < 0 {
                continue
            }
            if arr[oppositeIndex] == arr[i] {
                c.0 = oppositeIndex
                c.1 = i
            } else {
                center += 1
            }

            if c.1 - c.0 > l.1 - l.0 {
                l.0 = c.0
                l.1 = c.1
            }
        }

        return String(arr[l.0...l.1])
    }
}

extension Array where Element == Character {

    func isHomogenous() -> Bool {
        for i in 1..<self.count {
            if self[i] != self[i-1] {
                return false
            }
        }
        return true
    }
}
