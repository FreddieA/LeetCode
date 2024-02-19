//
//  AddTwoNumbersModel.swift
//  LeetCodeAddTwoNumbers
//
//  Created by Mikhail Kirillov on 18/2/24.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class AddTwoNumbersModel {

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

        var head: ListNode? = nil
        var currentl1: ListNode? = l1
        var currentl2: ListNode? = l2
        var resultList: ListNode? = nil
        var carryOver: Int? = nil
        var shouldStop: Bool = false

        while !shouldStop {

            switch (currentl1, currentl2) {
            case (.some, .none):
                currentl2 = ListNode()
            case (.none, .some):
                currentl1 = ListNode()
            case (.none, .none):
                if carryOver != nil {
                    currentl1 = ListNode()
                    currentl2 = ListNode()
                } else {
                    shouldStop = true
                    continue
                }
            case (.some, .some):
                break
            }

            let sum = (currentl1?.val ?? 0) + (currentl2?.val ?? 0) + (carryOver ?? 0)
            carryOver = sum > 9 ? 1 : nil
            let change = sum > 9 ? sum - 10 : sum

            if resultList == nil {

                resultList = ListNode(change)
                head = resultList
            } else {
                resultList?.next = ListNode(change)
                resultList = resultList?.next
            }

            currentl1 = currentl1?.next
            currentl2 = currentl2?.next
        }
        return head
    }

}
