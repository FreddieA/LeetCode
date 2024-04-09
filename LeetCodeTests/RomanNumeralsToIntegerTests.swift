//
//  RomanNumeralsToIntegerTests.swift
//  LeetCodeTests
//
//  Created by Mikhail Kirillov on 9/4/24.
//

import XCTest
@testable import LeetCode

final class RomanNumeralsToIntegerTests: XCTestCase {

    let model = RomanNumeralsToIntegerModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddTwoNumbers() {
        XCTAssertEqual(model.romanToInt("MCMXCIV"), 1994)
    }
}
