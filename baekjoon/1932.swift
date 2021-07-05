//
//  1932.swift
//  codingtest
//
//  Created by jeff on 2021/07/02.
//
//  정수 삼각형
//  https://www.acmicpc.net/problem/1932

let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
dp[0][0] = board[0][0]

for x in 1..<n {
    for y in 0...x {
        if y == 0 {
            dp[x][y] = board[x][y] + dp[x-1][y]
        } else {
            dp[x][y] = board[x][y] + max(dp[x-1][y], dp[x-1][y-1])
        }
    }
}

print(dp[n-1].max()!)
