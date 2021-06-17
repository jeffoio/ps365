//
//  5014.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/17.
//
//  스타트링크
//  https://www.acmicpc.net/problem/5014

let info = readLine()!.split(separator: " ").map{Int(String($0))!}
let (f,s,g,u,d) = (info[0], info[1], info[2], info[3], info[4])
var isArrived = false, count = 0
var visited = Array(repeating: false, count: f+1)
var q = [s]
visited[s] = true

loop: while !q.isEmpty {
    var nextQ = [Int]()
    
    for cur in q {
        if cur == g {
            isArrived = true
            break loop
        }
        
        if cur+u <= f, !visited[cur+u] {
            visited[cur+u] = true
            nextQ.append(cur+u)
        }
        
        if cur-d > 0, !visited[cur-d] {
            visited[cur-d] = true
            nextQ.append(cur-d)
        }
        
    }
    
    count += 1
    q = nextQ
}

if isArrived {
    print(count)
} else {
    print("use the stairs")
}
