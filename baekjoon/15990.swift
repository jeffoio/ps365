//
//  0316_boj_15990.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/16.
//
//  1, 2, 3 더하기 5
//  
var memo:[[Int64]] = Array(repeating: [0,0,0,0], count: 100001)
memo[1] = [0,1,0,0]
memo[2] = [0,0,1,0]
memo[3] = [0,1,1,1]

for i in 4...100000 {
    if i-1 >= 0 {
        memo[i][1] = (memo[i-1][2] + memo[i-1][3]) % 1000000009
    }
    if i-2 >= 0 {
        memo[i][2] = (memo[i-2][1] + memo[i-2][3]) % 1000000009
    }
    if i-3 >= 0 {
        memo[i][3] = (memo[i-3][1] + memo[i-3][2]) % 1000000009
    }
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(memo[n].reduce(0, +) % 1000000009)
}

