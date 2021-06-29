//
//  0312_boj_1463.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/12.
//
//  1로 만들기
//  https://www.acmicpc.net/problem/1463

//  DP
var n = Int(readLine()!)!
var k = Array(repeating: 0, count: n+1)

for i in 0...n {
    if i < 2 { continue }
    k[i] = k[i-1] + 1
    if i%2 == 0, k[i] > k[i/2] + 1 {
        k[i] = k[i/2] + 1
    }
    if i%3 == 0, k[i] > k[i/3] + 1 {
        k[i] = k[i/3] + 1
    }
}
print(k[n])

//  BFS
var n = Int(readLine()!)!
var visited  = Array(repeating: false, count: n+1)
visited[n] = true
var q = [n]
var count = 0

loop: while !q.isEmpty {
    var nextQ = [Int]()
    
    for cur in q {
        if cur == 1 {
            break loop
        }
        if cur % 3 == 0, !visited[cur/3]{
            nextQ.append(cur/3)
            visited[cur/3] = true
        }
        if cur % 2 == 0, !visited[cur/2] {
            nextQ.append(cur/2)
            visited[cur/2] = true
        }
        if !visited[cur-1] {
            nextQ.append(cur-1)
            visited[cur-1] = true
        }
        
    }
    q = nextQ
    count += 1
}

print(count)
