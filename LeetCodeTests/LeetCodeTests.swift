//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by Mikhail Kirillov on 18/2/24.
//

import XCTest
@testable import LeetCode

final class LeetCodeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let index = [3,2,4].twoSumHash(6)
        print(index)
        
    }

    func testPerformanceExample() throws {
        var array = generateRandomArray(size: 10)
        var preset = [10, 9 , 8, 7, 6, 5, 4, 3, 2, 1]
        self.measure {
            let sorted = preset.quickSorted()
            print(sorted)
        }
    }

    func generateRandomArray(size: Int) -> [Int] {
        var array = [Int]()
        for _ in 0..<size {
            array.append(Int.random(in: 1...1000)) // Generate random numbers between 1 and 1000
        }
        return array
    }
}

extension Array where Element == Int {

    mutating func quickSorted() -> [Element] {
        guard count > 1 else { return self }

        var copy = self
        var breakPoint = replace(arr: &copy)

        while breakPoint != -1 {

            if breakPoint > 1 {
                var slice1 = Array(copy[0..<breakPoint])
                breakPoint = replace(arr: &slice1)
            }
            if breakPoint < copy.count-1 {
                var slice2 = Array(copy[breakPoint+1..<copy.count])
                breakPoint = replace(arr: &slice2)
            }
        }
        return copy

        func replace(arr: inout [Element]) -> Int {
            var breakPoint = arr.count-1
            for i in stride(from: arr.count-2, through: 0, by: -1) {
                if arr[breakPoint] < arr[i] {
                    let temp = arr[i]
                    arr[i] = arr[breakPoint]
                    arr[breakPoint] = temp
                    breakPoint = i
                }
            }
            return  breakPoint != arr.count-1 ? breakPoint : -1
        }
    }

    static func sort(_ slice: inout ArraySlice<Element>) {
        guard slice.count > 2, let pivot = slice.last else { return }

        var breakPoint = slice.count-1
        for i in stride(from: slice.count-2, through: slice.startIndex, by: -1) {
            if pivot < slice[i] {
                let temp = slice[i]
                slice[i] = pivot
                slice[breakPoint] = temp
                breakPoint = i
            }
        }
        if breakPoint != slice.count-1 {
            var slice1 = slice[slice.startIndex...breakPoint]
            var slice2 = slice[breakPoint..<slice.count]
            sort(&slice1)
            sort(&slice2)
        }
    }
}

extension Array where Element == Int {

    func twoSum(_ target: Int) -> [Int] {

        for i in (0..<count) {
            if let ind = firstIndex(where: { target - $0 == self[i] }), i != ind {
                return [i, ind]
            }
        }
        return []
    }

    func twoSumHash(_ target: Int) -> [Int] {

        var dict = self.reduce(into: [Int: Int]()) { partialResult, value in
            partialResult[value] = value
        }
        for (index, value) in self.enumerated() {
            dict[value] = index
        }
        for i in (0..<count) {
            if let index = dict[target - self[i]], i != index  {
                return [i, index]
            }
        }
        return []
    }

    func maxIndexOf(_ target: Int) -> Int {

        let count = self.count
        let midindex = count / 2

        if self[midindex] == target { return midindex }

        if self[midindex] < target {
            if count == 1 {
                return midindex
            }
            let newArr = Array(self[midindex..<count])
            return newArr.maxIndexOf(target)
        }

        if self[midindex] > target {
            let newArr = Array(self[0..<midindex])
            return newArr.maxIndexOf(target)
        }
        return 0
    }
}
