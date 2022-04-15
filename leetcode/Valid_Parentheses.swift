//
//  Valid_Parentheses.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/22.
//
//  20. Valid Parentheses
//  https://leetcode.com/problems/valid-parentheses/

class Solution {
    func isValid(_ s: String) -> Bool {
        var str = Array(s).map{String($0)}
        var stack = [String]()
        let dic = ["}": "{",
                   ")": "(",
                   "]": "["]

        for char in str {

            if stack.isEmpty {
                stack.append(char)
                continue
            }
            if dic.contains { $0.value == char} {
                stack.append(char)
            } else {
                let lastChar = stack.last!
                if dic[char] == lastChar {
                    stack.removeLast()
                } else {
                    stack.append(char)
                }
            }
        }

        return stack.isEmpty
    }
}
