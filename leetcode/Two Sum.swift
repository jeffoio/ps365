//
//  Two Sum.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/06.
//
//  Two Sum
//  https://leetcode.com/problems/two-sum/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var answer = [0,0]
        for i in 0..<nums.count {
            for j in i..<nums.count {
                if nums[i] + nums[j] == target, i != j {
                    answer = [i,j]
                }
            }
        }
        return answer.sorted()
    }
}
