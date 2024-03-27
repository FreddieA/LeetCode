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
        var c = (1,1)
        var l = (1,1)

        while c.1+1 < arr.count {

            if arr[max(c.0-1, 0)] == arr[c.1+1] {
                c.0 = max(c.0-1, 0)
                c.1 += 1
                compare(rhs: c, lhs: &l)
            } else if arr[c.0-1] == arr[c.0] && arr[c.0...c.1].isHomogenous() {
                c.0 -= 1
                compare(rhs: c, lhs: &l)
            } else if arr[c.1+1] == arr[c.1] && arr[c.0...c.1].isHomogenous() {
                c.1 += 1
                compare(rhs: c, lhs: &l)
            } else {
                if c.1 - c.0 > 1 {
                    c.0 = (c.1 - c.0 / 2) + 1
                    c.1 = c.0
                } else {
                    c.0 = c.1 + 1
                    c.1 = c.0
                }
            }
        }
        return String(arr[l.0...l.1])
    }

    private func compare(rhs: (Int, Int), lhs: inout (Int, Int)) {
        if rhs.1 - rhs.0 > lhs.1 - lhs.0 {
            lhs.1 = rhs.1
            lhs.0 = rhs.0
        }
    }
}

extension ArraySlice where Element == Character {

    func isHomogenous() -> Bool {
        for i in self.startIndex+1..<self.endIndex {
            if self[i] != self[i-1] {
                return false
            }
        }
        return true
    }
}
