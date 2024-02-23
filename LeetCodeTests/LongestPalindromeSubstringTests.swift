//
//  LongestPalindromeSubstringTests.swift
//  LeetCodeTests
//
//  Created by Mikhail Kirillov on 19/2/24.
//

import XCTest
@testable import LeetCode

final class LongestPalindromeSubstringTests: XCTestCase {

    let model = LongestPalindromeSubstringModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLongestPalindromeSingle() {
        let str = ("civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadelttilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth", "elttilllittle")
        let pal = model.longestPalindrome(str.0)
        XCTAssertEqual(pal, str.1)
    }

    func testLongestPalindrome() {

        for _ in (0...100) {
            let count = Int.random(in: (2...10))
            let strCount = generateString(count)
            let pal = model.longestPalindrome(strCount.0)

            XCTAssertEqual(pal.count, strCount.1)
        }
    }

    func generateString(_ maxPalindromeLength: Int) -> (String, Int) {

        let numberOfPalindromes = Int.random(in: 0...5)
        var string = randomString(length: Int.random(in: maxPalindromeLength * numberOfPalindromes...100))

        guard numberOfPalindromes != 0 else {
            return (String(string), 0)
        }

        var biggestPalindromeCount = 0

        for _ in (0...numberOfPalindromes) {
            let length: Int = Int.random(in: 0...maxPalindromeLength)
            if length > biggestPalindromeCount {
                biggestPalindromeCount = length
            }
            let randomIndex = Int.random(in: 0..<string.count - length)
            for i in (0...length) {
                let char1 = string[randomIndex + i]
                let opposite = randomIndex + length - i
                string.replaceSubrange((opposite...opposite), with: [char1])
            }
        }
        return (String(string), numberOfPalindromes == 0 ? 0 : biggestPalindromeCount)
    }

    func randomString(length: Int) -> [Character] {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return (0..<length).map{ _ in letters.randomElement()! }
    }
}
