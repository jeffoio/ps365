//
//  12852.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/29.
//
//  1로 만들기 2
//  https://www.acmicpc.net/problem/12852

let n = Int(readLine()!)!
var memo = Array(repeating: 0, count: n+1)
var cur = Array(repeating: [Int](), count: n+1)

for i in 0...n {
    var choice = 0
    cur[i].append(i)
    if i < 2 {
        continue
    }
    memo[i] = memo[i-1] + 1

    
    if i%2 == 0, memo[i] > memo[i/2] + 1 {
        memo[i] = memo[i/2] + 1
        choice = 1
    }
    if i%3 == 0, memo[i] > memo[i/3] + 1 {
        memo[i] = memo[i/3] + 1
        choice = 2
    }
    
    switch choice {
    case 0:
        cur[i] += cur[i-1]
    case 1:
        cur[i] += cur[i/2]
    default:
        cur[i] += cur[i/3]
    }
    
}

print(cur[n].count-1)
print(cur[n].map{String($0)}.joined(separator: " "))
