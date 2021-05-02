//
//  2294.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/30.
//
//  동전 2
//  https://www.acmicpc.net/problem/2294

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var coinValue = [Int]()
var dp = Array(repeating: -1, count: 100001) //
for _ in 0..<n {
    let coin = Int(readLine()!)!
    coinValue.append(coin)
    dp[coin] = 1
}



for coin in coinValue {
    for i in 1...k {
        if i - coin <= 0 || dp[i-coin] < 0 { continue }
        if dp[i] == -1 {
            dp[i] = dp[i-coin] + 1
        } else {
            dp[i] = min(dp[i], 1 + dp[i-coin])
        }
        
    }
    
}

print(dp[k])
