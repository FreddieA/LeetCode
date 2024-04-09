//
//  RomanNumeralsToIntegerModel.swift
//  LeetCode
//
//  Created by Mikhail Kirillov on 9/4/24.
//

import Foundation

let numerals = [Character("I"): 1,
                Character("V"): 5,
                Character("X"): 10,
                Character("L"): 50,
                Character("C"): 100,
                Character("D"): 500,
                Character("M"): 1000]

class RomanNumeralsToIntegerModel {
    func romanToInt(_ s: String) -> Int {
        let arr = Array(s).map({ numerals[$0]! })

        var sum = 0
        var prevNum: Int?
        for index in stride(from: arr.count-1, to: -1, by: -1) {
            let num = arr[index]
            if let prevNum {
                if num < prevNum {
                    sum -= num
                } else {
                    sum += num
                }
            } else {
                sum += num
            }
            prevNum = num
        }
        return sum
    }
}
