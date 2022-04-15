//
//  AddTwoNumbers.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/07.
//
//  Add Two Numbers
//  https://leetcode.com/problems/add-two-numbers/

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var top = l1, down = l2
        var head = ListNode(), tail = head
        var carry = 0

        while top != nil || down != nil {
            var sum = 0
            sum += top?.val ?? 0
            sum += down?.val ?? 0

            if carry != 0 {
                sum += 1
                carry = 0
            }
            if sum >= 10 {
                sum -= 10
                carry = 1
            }
            tail.val = sum
            top = top?.next
            down = down?.next
            if top != nil || down != nil {
                tail.next = ListNode()
                tail = tail.next!
            }

        }
        if carry > 0 {
            tail.next = ListNode(carry)
        }
        return head
    }
}
