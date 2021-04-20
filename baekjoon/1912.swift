//
//  1912.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/20.
//
//  연속합
//  https://www.acmicpc.net/problem/1912

// 1. make preFix Sum
// 2. Find max Value
// 3. Find min Value before max Value posion
// 4. max - min

let n = Int(readLine()!)!
let numers = readLine()!.split(separator: " ").map{Int(String($0))!}
var preFix = Array(repeating: 0, count: n)
preFix[0] = numers[0]

for i in 1..<n {
    preFix[i] = numers[i] + preFix[i-1]
}

var sum = Int.min
var maxSum = preFix.max()!
var minSum = preFix[0]

for i in 1..<n {
    maxSum = max(maxSum, preFix[i] - minSum)
    minSum = min(minSum, preFix[i])
}
print(maxSum)
