//
//  17204.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/18.
//
//  죽음의 게임
//  https://www.acmicpc.net/problem/17204

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var pointOut = [Int]()
var visited = Array(repeating: false, count: n)
var m = 0, cur = 0, check = false
for _ in 0..<n {
    pointOut.append(Int(readLine()!)!)
}

while !visited[cur] {
    m += 1
    visited[cur] = true
    if pointOut[cur] == k {
        check = true
        break
    }
    cur = pointOut[cur]
    
}
if check {
    print(m)
} else {
    print(-1)
}
