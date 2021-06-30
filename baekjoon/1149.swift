//
//  1149.swift
//  codingtest
//
//  Created by jeff on 2021/06/30.
//
//  RGB거리
//  https://www.acmicpc.net/problem/1149

let n = Int(readLine()!)!
var cost = [[Int]]()
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n)

for _ in 0..<n {
    cost.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

dp[0] = cost[0]

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + cost[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + cost[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + cost[i][2]
}

print(dp[n-1].min()!)
