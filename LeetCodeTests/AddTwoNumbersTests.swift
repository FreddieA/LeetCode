//
//  LeetCodeAddTwoNumbersTests.swift
//  LeetCodeAddTwoNumbersTests
//
//  Created by Mikhail Kirillov on 18/2/24.
//

import XCTest
@testable import LeetCode

final class AddTwoNumbersTests: XCTestCase {

    let model = AddTwoNumbersModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddTwoNumbers() {
        for _ in 0..<500 {
            let len1 = Int.random(in: 1...10)
            let len2 = Int.random(in: 1...10)

            let l1 = generateLinkedList(len1)
            let l2 = generateLinkedList(len2)

            let result = model.addTwoNumbers(l1, l2)
            let expected = convertLinkedListToNumber(l1) + convertLinkedListToNumber(l2)

            XCTAssertEqual(convertLinkedListToNumber(result), expected)
        }
    }

    func generateLinkedList(_ length: Int) -> ListNode {
        let head = ListNode(Int.random(in: 1...9))
        var current: ListNode? = head
        for _ in 1..<length {
            current?.next = ListNode(Int.random(in: 0...9))
            current = current?.next
        }
        return head
    }

    func convertLinkedListToNumber(_ head: ListNode?) -> Int {
        var number = 0
        var multiplier = 1
        var current = head
        while let node = current {
            number += node.val * multiplier
            multiplier *= 10
            current = node.next
        }
        return number
    }
}
