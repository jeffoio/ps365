//
//  Maximum_Subarray.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/22.
//
//  53. Maximum Subarray
//  https://leetcode.com/problems/maximum-subarray/

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var preFixSum = Array(repeating: 0, count: nums.count)
        preFixSum[0] = nums[0]

        for i in 1..<nums.count {
            preFixSum[i] = nums[i] + preFixSum[i-1]
        }

        var sum = Int.min
        var max = preFixSum.max()!
        var min = preFixSum[0]

        for i in 1..<nums.count {
            if preFixSum[i] - min > max {
                max = preFixSum[i] - min
            }
            if preFixSum[i] < min {
                min = preFixSum[i]
            }
        }

        return max
    }
}
