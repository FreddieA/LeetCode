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
        var dict = [Character: [Int]]()
        var longestPalindrome = String(s.first!)

        for (index, char) in arr.enumerated() {
            if let prevIndexes = dict[char] {

                for indexIndex in prevIndexes {
                    let newArr = Array(arr[indexIndex...index])
                    if newArr.isPalindrome() {
                        if longestPalindrome.count - 1 < index - indexIndex {
                            longestPalindrome = String(arr[indexIndex...index])
                        }
                    } 
                    dict[char]?.append(index)
                }
            } else {
                dict[char] = [index]
            }
        }
        return longestPalindrome
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
