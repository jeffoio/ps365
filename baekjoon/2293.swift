//
//  2293.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/30.
//
//  동전 1
//  https://www.acmicpc.net/problem/2293

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var coinValue = [Int]()
var dp = Array(repeating: 0, count: 10001)
for _ in 0..<n {
    coinValue.append(Int(readLine()!)!)
}
dp[0] = 1

for coin in coinValue {
    for i in 1...k {
        if (i - coin) >= 0 {
            if dp[i] &+ dp[i - coin] > 2147483648 { dp[i] = 0 }
            dp[i] = dp[i] + dp[i - coin]
        }
    }
}

print(dp[k])
