//
//  2579.swift
//  codingtest
//
//  Created by jeff on 2021/06/29.
//
//  계단 오르기
//  https://www.acmicpc.net/problem/2579

var n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 3), count: n)
var stairsScore = [Int]()

for i in 0..<n {
    stairsScore.append(Int(readLine()!)!)
    if i == 0 {
        dp[i][1] = stairsScore[i]
    } else if i == 1 {
        dp[i][1] = stairsScore[i]
        dp[i][2] = dp[i-1][1] + stairsScore[i]
    } else {
        dp[i][1] = max(dp[i-2][1], dp[i-2][2]) + stairsScore[i]
        if dp[i-1][1] != 0 {
            dp[i][2] = dp[i-1][1] + stairsScore[i]
        }
    }
}
print(dp[n].max()!)
