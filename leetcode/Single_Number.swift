//
//  Single_Number.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/22.
//
//  136. Single Number
//  https://leetcode.com/problems/single-number/

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
//         var dic = [Int: Int]()
        
//         for num in nums {
//             dic[num, default: 0] += 1
//         }
       
        
//         return dic.filter { $0.value == 1 }.first!.key
        var set = Set<Int>()
        
        for num in nums {
            if set.contains(num) {
                set.remove(num)
            } else {
                set.insert(num)
            }
        }
        return set.first!
    }
}
